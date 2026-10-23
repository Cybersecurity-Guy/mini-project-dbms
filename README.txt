MUSIC PLAYLIST MANAGER — FIXED STARTER PROJECT
================================================

Project file: MusicPlaylistManager.csproj
Main form: MainForm.cs
Entry point: Program.cs

1. Extract this ZIP.
2. Open MusicPlaylistManager.csproj in Visual Studio 2022.
3. In MainForm.cs, replace CHANGE_ME in ConnectionString with your MySQL password.
4. Make sure MySQL Server is running and music_playlist_db exists.
5. In Visual Studio, right-click the project and select "Restore NuGet Packages".
   If that option is unavailable, use Build > Restore NuGet Packages or run
   "dotnet restore" from the directory containing MusicPlaylistManager.csproj.
6. Build > Rebuild Solution, then press F5.

The project targets .NET 8 Windows Forms and uses the MySql.Data NuGet package.
It assumes the existing schema uses:
- artist(artist_id, artist_name)
- song(song_id, title, duration_seconds, artist_id)
- playlist(playlist_id, playlist_name)
- playlist_song(playlist_id, song_id, position)

This is a read-only GUI: playlist selection, title search, artist filtering, counts,
and duration statistics. It does not delete or alter database data.

Important: a missing obj/project.assets.json error means NuGet restore has not completed;
it is not a C# syntax error. The project must restore packages before it can build.
