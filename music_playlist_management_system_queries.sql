USE music_playlist_db;


-- =====================================================
-- DML QUERY 1
-- Display all songs in a selected playlist in original order

SELECT
    ps.position,
    s.title,
    a.artist_name,
    s.duration_seconds
FROM playlist_song ps
JOIN song s
    ON ps.song_id = s.song_id
JOIN artist a
    ON s.artist_id = a.artist_id
JOIN playlist p
    ON ps.playlist_id = p.playlist_id
WHERE p.playlist_name = 'My Mix Rock'
ORDER BY ps.position;


-- =====================================================
-- DML QUERY 2
-- Search for songs whose title contains a user-provided keyword

SELECT
    s.title,
    a.artist_name,
    s.duration_seconds
FROM song s
JOIN artist a
    ON s.artist_id = a.artist_id
WHERE s.title LIKE '%Rain%'
ORDER BY s.title;


-- =====================================================
-- DML QUERY 3
-- Display all songs performed by a selected artist

SELECT
    s.title,
    s.duration_seconds
FROM song s
JOIN artist a
    ON s.artist_id = a.artist_id
WHERE a.artist_name = 'X Japan'
ORDER BY s.title;


-- =====================================================
-- DML QUERY 4
-- Display all playlists containing a selected song

SELECT
    p.playlist_name,
    ps.position
FROM playlist_song ps
JOIN playlist p
    ON ps.playlist_id = p.playlist_id
JOIN song s
    ON ps.song_id = s.song_id
WHERE s.title = 'Endless Rain'
ORDER BY p.playlist_name;


-- =====================================================
-- DML QUERY 5
-- Display the number of songs in each playlist

SELECT
    p.playlist_name,
    COUNT(ps.song_id) AS song_count
FROM playlist p
LEFT JOIN playlist_song ps
    ON p.playlist_id = ps.playlist_id
GROUP BY p.playlist_id, p.playlist_name
ORDER BY song_count DESC;


-- =====================================================
-- DML QUERY 6
-- Calculate the total duration of a selected playlist

SELECT
    p.playlist_name,
    SEC_TO_TIME(SUM(s.duration_seconds)) AS total_duration
FROM playlist p
JOIN playlist_song ps
    ON p.playlist_id = ps.playlist_id
JOIN song s
    ON ps.song_id = s.song_id
WHERE p.playlist_name = 'My Mix Rock'
GROUP BY p.playlist_id, p.playlist_name;


-- =====================================================
-- DML QUERY 7
-- Display the longest songs in a selected playlist

SELECT
    s.title,
    a.artist_name,
    SEC_TO_TIME(s.duration_seconds) AS duration
FROM playlist_song ps
JOIN song s
    ON ps.song_id = s.song_id
JOIN artist a
    ON s.artist_id = a.artist_id
JOIN playlist p
    ON ps.playlist_id = p.playlist_id
WHERE p.playlist_name = 'My Mix Rock'
ORDER BY s.duration_seconds DESC
LIMIT 10;


-- =====================================================
-- DML QUERY 8
-- Display distinct artists in a selected playlist

SELECT DISTINCT
    a.artist_name
FROM playlist_song ps
JOIN song s
    ON ps.song_id = s.song_id
JOIN artist a
    ON s.artist_id = a.artist_id
JOIN playlist p
    ON ps.playlist_id = p.playlist_id
WHERE p.playlist_name = 'My Mix Rock'
ORDER BY a.artist_name;


-- =====================================================
-- DML QUERY 9
-- Display songs that are not associated with any playlist

SELECT
    s.song_id,
    s.title,
    a.artist_name,
    s.duration_seconds
FROM song s
JOIN artist a
    ON s.artist_id = a.artist_id
LEFT JOIN playlist_song ps
    ON s.song_id = ps.song_id
WHERE ps.song_id IS NULL
ORDER BY s.title;


-- =====================================================
-- DML QUERY 10
-- Display the complete playlist catalogue with song count and total duration

SELECT
    p.playlist_name,
    COUNT(ps.song_id) AS song_count,
    SEC_TO_TIME(COALESCE(SUM(s.duration_seconds), 0)) AS total_duration
FROM playlist p
LEFT JOIN playlist_song ps
    ON p.playlist_id = ps.playlist_id
LEFT JOIN song s
    ON ps.song_id = s.song_id
GROUP BY p.playlist_id, p.playlist_name
ORDER BY p.playlist_name;

-- =====================================================
-- STORED PROCEDURES
-- _____________________________________________________


-- =====================================================
-- PROCEDURE 1
-- Generate a complete report of songs in a playlist
-- Uses a cursor to process each song

DELIMITER //

CREATE PROCEDURE playlist_song_report(
    IN input_playlist_name VARCHAR(150)
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE song_title VARCHAR(200);
    DECLARE artist_name_result VARCHAR(150);
    DECLARE song_duration INT;
    DECLARE song_position INT;

    DECLARE song_cursor CURSOR FOR
        SELECT
            ps.position,
            s.title,
            a.artist_name,
            s.duration_seconds
        FROM playlist_song ps
        JOIN playlist p
            ON ps.playlist_id = p.playlist_id
        JOIN song s
            ON ps.song_id = s.song_id
        JOIN artist a
            ON s.artist_id = a.artist_id
        WHERE p.playlist_name = input_playlist_name
        ORDER BY ps.position;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DROP TEMPORARY TABLE IF EXISTS playlist_report;

    CREATE TEMPORARY TABLE playlist_report (
        position_no INT,
        song_title VARCHAR(200),
        artist_name VARCHAR(150),
        duration_seconds INT
    );

    OPEN song_cursor;

    read_loop: LOOP
        FETCH song_cursor
        INTO song_position, song_title, artist_name_result, song_duration;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO playlist_report
        VALUES (
            song_position,
            song_title,
            artist_name_result,
            song_duration
        );
    END LOOP;

    CLOSE song_cursor;

    SELECT *
    FROM playlist_report
    ORDER BY position_no;

    DROP TEMPORARY TABLE playlist_report;
END //

DELIMITER ;


-- =====================================================
-- PROCEDURE 2
-- Generate a report of all songs by an artist
-- Uses a cursor to process each song

DELIMITER //

CREATE PROCEDURE artist_song_report(
    IN input_artist_name VARCHAR(150)
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE song_title VARCHAR(200);
    DECLARE song_duration INT;

    DECLARE artist_cursor CURSOR FOR
        SELECT
            s.title,
            s.duration_seconds
        FROM song s
        JOIN artist a
            ON s.artist_id = a.artist_id
        WHERE a.artist_name = input_artist_name
        ORDER BY s.title;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DROP TEMPORARY TABLE IF EXISTS artist_report;

    CREATE TEMPORARY TABLE artist_report (
        song_title VARCHAR(200),
        duration_seconds INT
    );

    OPEN artist_cursor;

    read_loop: LOOP
        FETCH artist_cursor
        INTO song_title, song_duration;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        INSERT INTO artist_report
        VALUES (
            song_title,
            song_duration
        );
    END LOOP;

    CLOSE artist_cursor;

    SELECT *
    FROM artist_report
    ORDER BY song_title;

    DROP TEMPORARY TABLE artist_report;
END //

DELIMITER ;


-- =====================================================
-- TEST PROCEDURE 1

CALL playlist_song_report('My Mix Rock');


-- =====================================================
-- TEST PROCEDURE 2

CALL artist_song_report('X Japan');



-- =====================================================
-- FUNCTIONS
-- _____________________________________________________

-- =====================================================
-- FUNCTION 1
-- Return the number of songs in a playlist

DELIMITER //

CREATE FUNCTION get_song_count(
    input_playlist_id INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_songs INT;

    SELECT COUNT(*)
    INTO total_songs
    FROM playlist_song
    WHERE playlist_id = input_playlist_id;

    RETURN total_songs;
END //

DELIMITER ;


-- =====================================================
-- FUNCTION 2
-- Return the total duration of a playlist in seconds

DELIMITER //

CREATE FUNCTION get_playlist_duration(
    input_playlist_id INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_duration INT;

    SELECT COALESCE(SUM(s.duration_seconds), 0)
    INTO total_duration
    FROM playlist_song ps
    JOIN song s
        ON ps.song_id = s.song_id
    WHERE ps.playlist_id = input_playlist_id;

    RETURN total_duration;
END //

DELIMITER ;


-- =====================================================
-- TEST FUNCTION 1

SELECT
    p.playlist_name,
    get_song_count(p.playlist_id) AS song_count
FROM playlist p;


-- =====================================================
-- TEST FUNCTION 2

SELECT
    p.playlist_name,
    get_playlist_duration(p.playlist_id) AS total_duration_seconds
FROM playlist p;



-- =====================================================
-- TRIGGERS
-- *****************************************************


-- =====================================================
-- AUDIT TABLE FOR TRIGGERS

CREATE TABLE IF NOT EXISTS deletion_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    item_type VARCHAR(50) NOT NULL,
    item_id INT NOT NULL,
    item_name VARCHAR(200) NOT NULL,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =====================================================
-- TRIGGER 1
-- Record deleted songs in the audit table

DELIMITER //

CREATE TRIGGER after_song_delete
AFTER DELETE ON song
FOR EACH ROW
BEGIN
    INSERT INTO deletion_audit (
        item_type,
        item_id,
        item_name
    )
    VALUES (
        'SONG',
        OLD.song_id,
        OLD.title
    );
END //

DELIMITER ;


-- =====================================================
-- TRIGGER 2
-- Record deleted playlists in the audit table

DELIMITER //

CREATE TRIGGER after_playlist_delete
AFTER DELETE ON playlist
FOR EACH ROW
BEGIN
    INSERT INTO deletion_audit (
        item_type,
        item_id,
        item_name
    )
    VALUES (
        'PLAYLIST',
        OLD.playlist_id,
        OLD.playlist_name
    );
END //

DELIMITER ;


-- =====================================================
-- VIEW TRIGGER AUDIT LOG

SELECT *
FROM deletion_audit
ORDER BY deleted_at DESC;