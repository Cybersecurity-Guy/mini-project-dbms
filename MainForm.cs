using System.Data;
using MySql.Data.MySqlClient;

namespace MusicPlaylistManager;

public sealed class MainForm : Form
{
    // IMPORTANT: replace CHANGE_ME with your MySQL password.
    private const string ConnectionString =
    "Server=localhost;Port=3306;Database=music_playlist_db;Uid=root;Pwd=My$QLR00t;SslMode=None;AllowPublicKeyRetrieval=True;";

    private readonly Color _background = Color.FromArgb(15, 24, 38);
    private readonly Color _panel = Color.FromArgb(25, 39, 57);
    private readonly Color _panelLight = Color.FromArgb(31, 49, 68);
    private readonly Color _teal = Color.FromArgb(60, 210, 190);
    private readonly Color _muted = Color.FromArgb(177, 193, 205);
    private readonly Color _white = Color.FromArgb(245, 248, 250);

    private readonly ListBox _playlists = new();
    private readonly DataGridView _songs = new();
    private readonly TextBox _search = new();
    private readonly ComboBox _artist = new();
    private readonly Label _title = new();
    private readonly Label _status = new();
    private readonly Label _songCount = new();
    private readonly Label _duration = new();
    private readonly Label _artistCount = new();
    private readonly Button _searchButton = new();
    private readonly Button _clearButton = new();
    private readonly Button _refreshButton = new();

    private int? _playlistId;
    private string? _playlistName;
    private bool _loadingPlaylists;

    public MainForm()
    {
        Text = "Music Playlist Manager";
        StartPosition = FormStartPosition.CenterScreen;
        MinimumSize = new Size(1000, 650);
        Size = new Size(1280, 800);
        BackColor = _background;
        ForeColor = _white;
        Font = new Font("Segoe UI", 10F);
        BuildInterface();
        Shown += async (_, _) => await LoadInitialDataAsync();
    }

    private void BuildInterface()
    {
        var root = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 2,
            BackColor = _background,
            Padding = new Padding(18)
        };
        root.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 240));
        root.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
        root.RowStyles.Add(new RowStyle(SizeType.Absolute, 82));
        root.RowStyles.Add(new RowStyle(SizeType.Percent, 100));
        Controls.Add(root);

        var header = new Panel { Dock = DockStyle.Fill, BackColor = _background };
        var brand = new Label
        {
            Text = "♫  MUSIC PLAYLIST MANAGER",
            Font = new Font("Segoe UI", 21F, FontStyle.Bold),
            ForeColor = _teal,
            Dock = DockStyle.Top,
            Height = 42
        };
        var subtitle = new Label
        {
            Text = "Your collection, organised.",
            ForeColor = _muted,
            Dock = DockStyle.Top,
            Height = 25
        };
        header.Controls.Add(subtitle);
        header.Controls.Add(brand);
        root.Controls.Add(header, 0, 0);
        root.SetColumnSpan(header, 2);

        var sidebar = new Panel
        {
            Dock = DockStyle.Fill,
            BackColor = _panel,
            Padding = new Padding(12)
        };
        var sideLabel = new Label
        {
            Text = "YOUR PLAYLISTS",
            Dock = DockStyle.Top,
            Height = 34,
            ForeColor = _teal,
            Font = new Font("Segoe UI", 10F, FontStyle.Bold)
        };
        _playlists.Dock = DockStyle.Fill;
        _playlists.BackColor = _panel;
        _playlists.ForeColor = _white;
        _playlists.BorderStyle = BorderStyle.None;
        _playlists.Font = new Font("Segoe UI", 11F);
        _playlists.IntegralHeight = false;
        _playlists.SelectedIndexChanged += async (_, _) =>
        {
            if (_loadingPlaylists) return;
            if (_playlists.SelectedItem is PlaylistItem item)
            {
                _playlistId = item.Id;
                _playlistName = item.Name;
                await LoadSongsAsync();
            }
        };

        var allSongsButton = new Button { Text = "All songs", Dock = DockStyle.Bottom, Height = 40 };
        StyleButton(allSongsButton, false);
        allSongsButton.Click += async (_, _) =>
        {
            _playlistId = null;
            _playlistName = null;
            _loadingPlaylists = true;
            _playlists.ClearSelected();
            _loadingPlaylists = false;
            await LoadSongsAsync();
        };

        sidebar.Controls.Add(_playlists);
        sidebar.Controls.Add(sideLabel);
        sidebar.Controls.Add(allSongsButton);
        root.Controls.Add(sidebar, 0, 1);

        var content = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 1,
            RowCount = 4,
            Padding = new Padding(16, 0, 0, 0),
            BackColor = _background
        };
        content.RowStyles.Add(new RowStyle(SizeType.Absolute, 52));
        content.RowStyles.Add(new RowStyle(SizeType.Absolute, 62));
        content.RowStyles.Add(new RowStyle(SizeType.Percent, 100));
        content.RowStyles.Add(new RowStyle(SizeType.Absolute, 76));
        root.Controls.Add(content, 1, 1);

        _title.Text = "All songs";
        _title.Dock = DockStyle.Fill;
        _title.Font = new Font("Segoe UI", 19F, FontStyle.Bold);
        _title.ForeColor = _white;
        content.Controls.Add(_title, 0, 0);

        var searchBar = new FlowLayoutPanel
        {
            Dock = DockStyle.Fill,
            WrapContents = false,
            FlowDirection = FlowDirection.LeftToRight,
            BackColor = _background,
            Padding = new Padding(0, 8, 0, 4)
        };
        _search.Width = 235;
        _search.Height = 34;
        _search.Font = new Font("Segoe UI", 10.5F);
        _search.BackColor = _panel;
        _search.ForeColor = _white;
        _search.BorderStyle = BorderStyle.FixedSingle;
        _search.PlaceholderText = "Search song title...";
        _search.KeyDown += async (_, e) =>
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.SuppressKeyPress = true;
                await LoadSongsAsync();
            }
        };

        _artist.Width = 190;
        _artist.DropDownStyle = ComboBoxStyle.DropDownList;
        _artist.BackColor = _panel;
        _artist.ForeColor = _white;
        _artist.FlatStyle = FlatStyle.Flat;
        _artist.SelectedIndexChanged += async (_, _) =>
        {
            if (!_loadingPlaylists && _artist.Items.Count > 0)
                await LoadSongsAsync();
        };

        _searchButton.Text = "Search";
        StyleButton(_searchButton, true);
        _searchButton.Width = 82;
        _searchButton.Height = 34;
        _searchButton.Click += async (_, _) => await LoadSongsAsync();

        _clearButton.Text = "Clear";
        StyleButton(_clearButton, false);
        _clearButton.Width = 70;
        _clearButton.Height = 34;
        _clearButton.Click += async (_, _) =>
        {
            _search.Clear();
            if (_artist.Items.Count > 0) _artist.SelectedIndex = 0;
            await LoadSongsAsync();
        };

        _refreshButton.Text = "Refresh";
        StyleButton(_refreshButton, false);
        _refreshButton.Width = 85;
        _refreshButton.Height = 34;
        _refreshButton.Click += async (_, _) => await LoadInitialDataAsync();

        searchBar.Controls.AddRange(new Control[] { _search, _artist, _searchButton, _clearButton, _refreshButton });
        content.Controls.Add(searchBar, 0, 1);

        _songs.Dock = DockStyle.Fill;
        _songs.BackgroundColor = _panel;
        _songs.GridColor = _panelLight;
        _songs.BorderStyle = BorderStyle.None;
        _songs.EnableHeadersVisualStyles = false;
        _songs.ColumnHeadersDefaultCellStyle.BackColor = _panelLight;
        _songs.ColumnHeadersDefaultCellStyle.ForeColor = _teal;
        _songs.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
        _songs.DefaultCellStyle.BackColor = _panel;
        _songs.DefaultCellStyle.ForeColor = _white;
        _songs.DefaultCellStyle.SelectionBackColor = Color.FromArgb(35, 91, 94);
        _songs.DefaultCellStyle.SelectionForeColor = _white;
        _songs.AlternatingRowsDefaultCellStyle.BackColor = Color.FromArgb(21, 33, 49);
        _songs.RowHeadersVisible = false;
        _songs.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        _songs.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        _songs.MultiSelect = false;
        _songs.ReadOnly = true;
        _songs.AllowUserToAddRows = false;
        _songs.AllowUserToDeleteRows = false;
        _songs.AutoGenerateColumns = true;
        _songs.RowTemplate.Height = 32;
        content.Controls.Add(_songs, 0, 2);

        var stats = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 3,
            RowCount = 2,
            Padding = new Padding(0, 10, 0, 0),
            BackColor = _background
        };
        for (int i = 0; i < 3; i++)
            stats.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.333F));
        stats.RowStyles.Add(new RowStyle(SizeType.Percent, 70));
        stats.RowStyles.Add(new RowStyle(SizeType.Percent, 30));

        SetupStatLabel(_songCount, "SONGS   —");
        SetupStatLabel(_duration, "TOTAL DURATION   —");
        SetupStatLabel(_artistCount, "ARTISTS   —");
        stats.Controls.Add(_songCount, 0, 0);
        stats.Controls.Add(_duration, 1, 0);
        stats.Controls.Add(_artistCount, 2, 0);
        _status.Text = "Waiting for database connection…";
        _status.Dock = DockStyle.Fill;
        _status.ForeColor = _muted;
        _status.Font = new Font("Segoe UI", 9F);
        stats.Controls.Add(_status, 0, 1);
        stats.SetColumnSpan(_status, 3);
        content.Controls.Add(stats, 0, 3);
    }

    private void SetupStatLabel(Label label, string text)
    {
        label.Text = text;
        label.Dock = DockStyle.Fill;
        label.BackColor = _panel;
        label.ForeColor = _teal;
        label.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
        label.TextAlign = ContentAlignment.MiddleCenter;
        label.Margin = new Padding(0, 0, 8, 0);
        label.AutoEllipsis = true;
    }

    private void StyleButton(Button button, bool primary)
    {
        button.FlatStyle = FlatStyle.Flat;
        button.FlatAppearance.BorderSize = primary ? 0 : 1;
        button.FlatAppearance.BorderColor = _teal;
        button.BackColor = primary ? _teal : _panelLight;
        button.ForeColor = primary ? _background : _white;
        button.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
        button.Cursor = Cursors.Hand;
        button.Margin = new Padding(5, 0, 0, 0);
    }

    private async Task LoadInitialDataAsync()
    {
        _status.Text = "Connecting to MySQL…";
        try
        {
            await using var connection = new MySqlConnection(ConnectionString);
            await connection.OpenAsync();

            var playlistItems = new List<PlaylistItem>();
            const string playlistSql = "SELECT playlist_id, playlist_name FROM playlist ORDER BY playlist_name;";
            await using (var command = new MySqlCommand(playlistSql, connection))
            await using (var reader = await command.ExecuteReaderAsync())
            {
                while (await reader.ReadAsync())
                    playlistItems.Add(new PlaylistItem(reader.GetInt32(0), reader.GetString(1)));
            }

            var artistNames = new List<string> { "All artists" };
            const string artistSql = "SELECT artist_name FROM artist ORDER BY artist_name;";
            await using (var command = new MySqlCommand(artistSql, connection))
            await using (var reader = await command.ExecuteReaderAsync())
            {
                while (await reader.ReadAsync())
                    artistNames.Add(reader.GetString(0));
            }

            _loadingPlaylists = true;
            _playlists.Items.Clear();
            foreach (var item in playlistItems) _playlists.Items.Add(item);
            _artist.Items.Clear();
            _artist.Items.AddRange(artistNames.Cast<object>().ToArray());
            _artist.SelectedIndex = 0;
            _loadingPlaylists = false;

            _status.Text = $"Connected • {playlistItems.Count} playlists loaded";
            await LoadSongsAsync();
        }
        catch (Exception ex)
        {
            _loadingPlaylists = false;
            _status.Text = "Database connection failed";
            MessageBox.Show(
                "Could not connect to music_playlist_db.\n\n" +
                "1. Confirm MySQL Server is running.\n" +
                "2. Edit ConnectionString in MainForm.cs and replace CHANGE_ME with your MySQL password.\n" +
                "3. Confirm the database and tables exist.\n\nDetails:\n" + ex.Message,
                "MySQL connection error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
        }
    }

    private async Task LoadSongsAsync()
    {
        _status.Text = "Loading songs…";
        try
        {
            await using var connection = new MySqlConnection(ConnectionString);
            await connection.OpenAsync();

            const string sql = @"
SELECT
    ps.position AS Position,
    s.title AS Title,
    a.artist_name AS Artist,
    SEC_TO_TIME(s.duration_seconds) AS Duration,
    s.duration_seconds AS DurationSeconds
FROM song AS s
INNER JOIN artist AS a ON a.artist_id = s.artist_id
LEFT JOIN playlist_song AS ps ON ps.song_id = s.song_id
LEFT JOIN playlist AS p ON p.playlist_id = ps.playlist_id
WHERE (@playlistId IS NULL OR p.playlist_id = @playlistId)
  AND (@keyword = '' OR s.title LIKE @pattern)
  AND (@artistName = '' OR a.artist_name = @artistName)
ORDER BY COALESCE(ps.position, 2147483647), s.title;";

            var table = new DataTable();
            await using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.Add("@playlistId", MySqlDbType.Int32).Value =
                    _playlistId.HasValue ? _playlistId.Value : DBNull.Value;
                string keyword = _search.Text.Trim();
                command.Parameters.Add("@keyword", MySqlDbType.VarChar).Value = keyword;
                command.Parameters.Add("@pattern", MySqlDbType.VarChar).Value = "%" + keyword + "%";
                string selectedArtist = _artist.SelectedItem?.ToString() ?? "All artists";
                command.Parameters.Add("@artistName", MySqlDbType.VarChar).Value =
                    selectedArtist == "All artists" ? "" : selectedArtist;

                using var adapter = new MySqlDataAdapter(command);
                adapter.Fill(table);
            }

            _songs.DataSource = table;
            if (_songs.Columns.Contains("DurationSeconds"))
                _songs.Columns["DurationSeconds"]!.Visible = false;

            if (_songs.Columns.Contains("Position"))
            {
                // Position only makes sense within a specific playlist.
                _songs.Columns["Position"]!.HeaderText = "#";
                _songs.Columns["Position"]!.Visible = _playlistId.HasValue;
            }

            if (_songs.Columns.Contains("Title"))
                _songs.Columns["Title"]!.FillWeight = 48;
            if (_songs.Columns.Contains("Artist"))
                _songs.Columns["Artist"]!.FillWeight = 32;
            if (_songs.Columns.Contains("Duration"))
                _songs.Columns["Duration"]!.FillWeight = 20;

            _title.Text = _playlistName ?? "All songs";

            long totalSeconds = 0;
            var uniqueArtists = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (DataRow row in table.Rows)
            {
                if (row["DurationSeconds"] != DBNull.Value)
                    totalSeconds += Convert.ToInt64(row["DurationSeconds"]);
                uniqueArtists.Add(Convert.ToString(row["Artist"]) ?? "");
            }

            _songCount.Text = $"SONGS   {table.Rows.Count:N0}";
            _duration.Text = $"DURATION   {FormatDuration(totalSeconds)}";
            _artistCount.Text = $"ARTISTS   {uniqueArtists.Count:N0}";
            _status.Text = $"Showing {table.Rows.Count:N0} result(s)";
        }
        catch (Exception ex)
        {
            _status.Text = "Could not load songs";
            MessageBox.Show(
                "The song query failed. Check that the table and column names match your database.\n\nDetails:\n" + ex.Message,
                "Query error",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);
        }
    }

    private static string FormatDuration(long seconds)
    {
        var duration = TimeSpan.FromSeconds(seconds);
        return duration.TotalHours >= 1
            ? $"{(int)duration.TotalHours:00}:{duration.Minutes:00}:{duration.Seconds:00}"
            : $"{duration.Minutes:00}:{duration.Seconds:00}";
    }

    private sealed record PlaylistItem(int Id, string Name)
    {
        public override string ToString() => Name;
    }
}
