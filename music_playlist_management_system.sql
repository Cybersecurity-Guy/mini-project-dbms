-- Music Playlist Management System - MySQL Database
-- Source playlist filenames: numbers in parentheses such as (1) or (2) are upload-name suffixes and are intentionally ignored.
-- Generated from the uploaded CSV playlists.

CREATE DATABASE IF NOT EXISTS music_playlist_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE music_playlist_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS playlist_song;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS artist;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(200) NOT NULL,
    CONSTRAINT uq_artist_name UNIQUE (artist_name)
) ENGINE=InnoDB;

CREATE TABLE song (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    artist_id INT NOT NULL,
    duration_seconds INT NOT NULL,
    CONSTRAINT chk_song_duration CHECK (duration_seconds >= 0),
    CONSTRAINT uq_song_version UNIQUE (title, artist_id, duration_seconds),
    CONSTRAINT fk_song_artist FOREIGN KEY (artist_id)
        REFERENCES artist(artist_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(200) NOT NULL,
    CONSTRAINT uq_playlist_name UNIQUE (playlist_name)
) ENGINE=InnoDB;

CREATE TABLE playlist_song (
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    position INT NOT NULL,
    PRIMARY KEY (playlist_id, song_id),
    CONSTRAINT uq_playlist_position UNIQUE (playlist_id, position),
    CONSTRAINT chk_position CHECK (position > 0),
    CONSTRAINT fk_ps_playlist FOREIGN KEY (playlist_id)
        REFERENCES playlist(playlist_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_ps_song FOREIGN KEY (song_id)
        REFERENCES song(song_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Artists
INSERT IGNORE INTO artist (artist_name) VALUES ('ABBA');
INSERT IGNORE INTO artist (artist_name) VALUES ('AC/DC');
INSERT IGNORE INTO artist (artist_name) VALUES ('Aerosmith');
INSERT IGNORE INTO artist (artist_name) VALUES ('Aimer');
INSERT IGNORE INTO artist (artist_name) VALUES ('Air Supply');
INSERT IGNORE INTO artist (artist_name) VALUES ('Alphaville');
INSERT IGNORE INTO artist (artist_name) VALUES ('Arctic Monkeys');
INSERT IGNORE INTO artist (artist_name) VALUES ('Be-ray');
INSERT IGNORE INTO artist (artist_name) VALUES ('Ben E. King');
INSERT IGNORE INTO artist (artist_name) VALUES ('Billy Joel');
INSERT IGNORE INTO artist (artist_name) VALUES ('BLUEBYRDS');
INSERT IGNORE INTO artist (artist_name) VALUES ('Bon Jovi');
INSERT IGNORE INTO artist (artist_name) VALUES ('Brian May');
INSERT IGNORE INTO artist (artist_name) VALUES ('Bryan Adams');
INSERT IGNORE INTO artist (artist_name) VALUES ('Chicago');
INSERT IGNORE INTO artist (artist_name) VALUES ('Creedence Clearwater Revival');
INSERT IGNORE INTO artist (artist_name) VALUES ('Cutting Crew');
INSERT IGNORE INTO artist (artist_name) VALUES ('David Bowie');
INSERT IGNORE INTO artist (artist_name) VALUES ('David Buckley');
INSERT IGNORE INTO artist (artist_name) VALUES ('Deep Purple');
INSERT IGNORE INTO artist (artist_name) VALUES ('Dick Dale');
INSERT IGNORE INTO artist (artist_name) VALUES ('Eagles');
INSERT IGNORE INTO artist (artist_name) VALUES ('Eric Clapton');
INSERT IGNORE INTO artist (artist_name) VALUES ('Europe');
INSERT IGNORE INTO artist (artist_name) VALUES ('Eurythmics');
INSERT IGNORE INTO artist (artist_name) VALUES ('Extreme');
INSERT IGNORE INTO artist (artist_name) VALUES ('FireHouse');
INSERT IGNORE INTO artist (artist_name) VALUES ('Foreigner');
INSERT IGNORE INTO artist (artist_name) VALUES ('Freddie Mercury');
INSERT IGNORE INTO artist (artist_name) VALUES ('Freddie Mercury Solo');
INSERT IGNORE INTO artist (artist_name) VALUES ('George Michael');
INSERT IGNORE INTO artist (artist_name) VALUES ('Ghost');
INSERT IGNORE INTO artist (artist_name) VALUES ('Guns N'' Roses');
INSERT IGNORE INTO artist (artist_name) VALUES ('John Denver');
INSERT IGNORE INTO artist (artist_name) VALUES ('John Lennon');
INSERT IGNORE INTO artist (artist_name) VALUES ('Kansas');
INSERT IGNORE INTO artist (artist_name) VALUES ('Keane');
INSERT IGNORE INTO artist (artist_name) VALUES ('Kenshi Yonezu');
INSERT IGNORE INTO artist (artist_name) VALUES ('KISS');
INSERT IGNORE INTO artist (artist_name) VALUES ('KOHTA YAMAMOTO official');
INSERT IGNORE INTO artist (artist_name) VALUES ('Larry Lurex');
INSERT IGNORE INTO artist (artist_name) VALUES ('Linkin Park');
INSERT IGNORE INTO artist (artist_name) VALUES ('luciano pinto');
INSERT IGNORE INTO artist (artist_name) VALUES ('Lynyrd Skynyrd');
INSERT IGNORE INTO artist (artist_name) VALUES ('Marty Friedman');
INSERT IGNORE INTO artist (artist_name) VALUES ('Metro Boomin');
INSERT IGNORE INTO artist (artist_name) VALUES ('Montserrat Caballé');
INSERT IGNORE INTO artist (artist_name) VALUES ('Nazareth');
INSERT IGNORE INTO artist (artist_name) VALUES ('Neil Diamond');
INSERT IGNORE INTO artist (artist_name) VALUES ('Paul McCartney & Eric Clapton');
INSERT IGNORE INTO artist (artist_name) VALUES ('Queen');
INSERT IGNORE INTO artist (artist_name) VALUES ('Queen & David Bowie');
INSERT IGNORE INTO artist (artist_name) VALUES ('RADWIMPS');
INSERT IGNORE INTO artist (artist_name) VALUES ('Richard Marx');
INSERT IGNORE INTO artist (artist_name) VALUES ('Roger Taylor & Yoshiki');
INSERT IGNORE INTO artist (artist_name) VALUES ('Roxette');
INSERT IGNORE INTO artist (artist_name) VALUES ('SawanoHiroyuki[nZk]');
INSERT IGNORE INTO artist (artist_name) VALUES ('Scorpions');
INSERT IGNORE INTO artist (artist_name) VALUES ('SiM');
INSERT IGNORE INTO artist (artist_name) VALUES ('Steelheart');
INSERT IGNORE INTO artist (artist_name) VALUES ('Steven Tyler, Slash & Train');
INSERT IGNORE INTO artist (artist_name) VALUES ('Survivor');
INSERT IGNORE INTO artist (artist_name) VALUES ('Tears For Fears');
INSERT IGNORE INTO artist (artist_name) VALUES ('THE LAST ROCKSTARS');
INSERT IGNORE INTO artist (artist_name) VALUES ('The Police');
INSERT IGNORE INTO artist (artist_name) VALUES ('The Rolling Stones');
INSERT IGNORE INTO artist (artist_name) VALUES ('The Turtles');
INSERT IGNORE INTO artist (artist_name) VALUES ('The White Stripes');
INSERT IGNORE INTO artist (artist_name) VALUES ('Toto');
INSERT IGNORE INTO artist (artist_name) VALUES ('Uli Jon Roth - Topic');
INSERT IGNORE INTO artist (artist_name) VALUES ('White Lion');
INSERT IGNORE INTO artist (artist_name) VALUES ('Whitney Houston');
INSERT IGNORE INTO artist (artist_name) VALUES ('X Japan');
INSERT IGNORE INTO artist (artist_name) VALUES ('Yoshiki');
INSERT IGNORE INTO artist (artist_name) VALUES ('Yutaka Ozaki');

-- Playlists
INSERT IGNORE INTO playlist (playlist_name) VALUES ('Alive Mix');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('AOT Soundtrack');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('My Mix Rock');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('My Quick Picks');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('Queen');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('X Japan');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('X Japan - Yoshiki');
INSERT IGNORE INTO playlist (playlist_name) VALUES ('You and I Mix');

-- Songs
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Alive - X Japan Lyrics', artist_id, 505
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yoshiki & Roger Tailor (with Toshi) - Foreing Sand (Live 1994 at GME Aoniyoshi)', artist_id, 365
FROM artist
WHERE artist_name = 'Roger Taylor & Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - UnfinishedREMIX English subtitles (cc)', artist_id, 259
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '7XX Japan - Week End ''93 ver  remixWith backing vocals for all members)', artist_id, 360
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Joker Backing vocals volume up', artist_id, 299
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X-Japan Silent Jealousy - Returns 1993.12.30', artist_id, 459
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I.V.', artist_id, 294
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Jade (Music Video)', artist_id, 442
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Forever Love Remix', artist_id, 450
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longing togireta melody', artist_id, 459
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scarlet Love Song (BUDDAH MIX)', artist_id, 375
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Unfinished (Remaster)', artist_id, 269
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Endless Rain', artist_id, 395
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Endless Rain (From The Last Live)', artist_id, 427
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - SAY ANYTHING (X With Orchestra 1991.12.08)', artist_id, 510
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - HERO () English subtitles(cc)', artist_id, 291
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Longing REMIX  cc', artist_id, 460
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love (Studio Version)', artist_id, 519
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Crucify My Love Remix', artist_id, 283
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Without You (Unplugged - Studio Version)', artist_id, 362
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCARS', artist_id, 307
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Blue Blood (Remaster)', artist_id, 303
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Rusty Nail from ""The Last Live"" HD', artist_id, 343
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Easy Fight RamblingBacking vocals volume up', artist_id, 336
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Born To Be Free Remix (cc)', artist_id, 389
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DRAIN', artist_id, 209
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lemon', artist_id, 257
FROM artist
WHERE artist_name = 'Kenshi Yonezu'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'tæk 0N ttn', artist_id, 257
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Reluctant Heroes', artist_id, 268
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'eye-water', artist_id, 182
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'bodymotion', artist_id, 343
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'cóunterattàck-mænknd', artist_id, 367
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'armyG', artist_id, 207
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Vogel im Käfig', artist_id, 381
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DOA', artist_id, 207
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'EMA', artist_id, 343
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '9', artist_id, 316
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bauklötze', artist_id, 237
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '2chi', artist_id, 408
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'XL-TT', artist_id, 398
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Call your name', artist_id, 269
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'omake-pfadlib', artist_id, 212
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barricades', artist_id, 222
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'APETITAN', artist_id, 332
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YouSeeBIGGIRL/T:T', artist_id, 360
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'son2seaVer', artist_id, 322
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Call of Silence', artist_id, 179
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ERENthe', artist_id, 384
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'attackD', artist_id, 285
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YAMANAIAME', artist_id, 267
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '2Volt', artist_id, 402
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'st-hrn-egt20130629', artist_id, 302
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'So ist es immer', artist_id, 290
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'st-hrn-gt-pf20130629', artist_id, 277
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ymniam-orch', artist_id, 190
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Reluctant Heroes MODv', artist_id, 270
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'st-hrn-gt20130629', artist_id, 253
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'theDOGS', artist_id, 276
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'pf-medley20130629', artist_id, 307
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'EMAymniam', artist_id, 331
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'pf20130218', artist_id, 282
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'gt20130218', artist_id, 152
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'TWO-lives', artist_id, 294
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'st20130629', artist_id, 325
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'vn-pf20130524', artist_id, 202
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ymniam-MKorch', artist_id, 155
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'pf-adlib-c20130218', artist_id, 232
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'pf-adlib-b20130218', artist_id, 172
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'vc-pf20130218', artist_id, 372
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'TheWeightOfLives', artist_id, 439
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YAMANAIAME FMv', artist_id, 268
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTs2M1', artist_id, 251
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTs2M2', artist_id, 130
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTs2M3', artist_id, 206
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTs2M4', artist_id, 244
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'K2-', artist_id, 347
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Zero Eclipse', artist_id, 254
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part1-1st:0Sk', artist_id, 371
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part1-2nd:sA', artist_id, 232
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part1-3rd:BARRIchestra', artist_id, 360
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part1-4th:7-b@$', artist_id, 318
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'K21', artist_id, 204
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AoTs3-3spens/21', artist_id, 393
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Call your name Gv', artist_id, 260
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-1st:tæk 0N ttn WMId', artist_id, 311
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-2nd:ShingekiNoKyojin', artist_id, 183
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-3rd:Before Lights Out', artist_id, 176
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-4th:2An', artist_id, 159
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-5th:Apple Seed', artist_id, 167
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SymphonicSuite [AoT] Part2-6th:ThanksAT', artist_id, 240
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ERENthe (MOVIEver.)', artist_id, 385
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barricades (MOVIEver.)', artist_id, 258
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AoTs3-PF1', artist_id, 126
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'T-KT', artist_id, 175
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A1G', artist_id, 201
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AoTs3-PF2', artist_id, 205
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AoTs3-1000', artist_id, 208
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'tooth-i:', artist_id, 184
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'LEN97n10MAHLE', artist_id, 135
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'K21 (Instrumental)', artist_id, 202
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Zero Eclipse (Instrumental)', artist_id, 252
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barricades (MOVIEver. / Instrumental)', artist_id, 257
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Call your name Gv (Instrumental)', artist_id, 260
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'tæk 0N ttn WMId (Instrumental)', artist_id, 309
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Before Lights Out (Instrumental)', artist_id, 174
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Apple Seed (Instrumental)', artist_id, 167
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ashes on The Fire', artist_id, 275
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Other Side of the Sea', artist_id, 298
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Splinter Wolf', artist_id, 322
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Nightmare', artist_id, 222
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guilty Hero', artist_id, 263
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Successor', artist_id, 250
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Memory Lane', artist_id, 184
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liberio at Night', artist_id, 177
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liberio Festival', artist_id, 184
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'True History', artist_id, 321
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Warriors', artist_id, 247
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Fall of Marley', artist_id, 199
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Zeek''s Plan', artist_id, 227
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Nowhere to go', artist_id, 186
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Atonement', artist_id, 199
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Cold Light', artist_id, 215
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Reason', artist_id, 207
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Friendships', artist_id, 225
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Memory Lane Vln ver.', artist_id, 184
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liberio at Night Pf & Vln ver.', artist_id, 178
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTF-s1', artist_id, 478
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTF-s2', artist_id, 214
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'AOTF-s3', artist_id, 223
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ashes on The Fire', artist_id, 276
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Splinter Wolf', artist_id, 323
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guilty Hero', artist_id, 264
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Successor', artist_id, 251
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Zeek''s Plan', artist_id, 228
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Cold Light', artist_id, 216
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Nowhere to go', artist_id, 190
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Footsteps of Doom', artist_id, 308
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Into the Night (Acoustic ver.)', artist_id, 132
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ashes on The Fire (PTV)', artist_id, 308
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'MAN-Child', artist_id, 228
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'All of The Freedoms', artist_id, 279
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'TRAITOR', artist_id, 289
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Night of The End', artist_id, 242
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'From You, 2,000 Years Ago', artist_id, 416
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Global Allied Fleet', artist_id, 236
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'MICHI', artist_id, 285
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'THAW', artist_id, 259
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Into the Night', artist_id, 250
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'EL', artist_id, 282
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YouSee-Power', artist_id, 258
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'tæk 0N ttn (TFSv)', artist_id, 298
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'An Ordinary Day', artist_id, 345
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Aim of the Fate', artist_id, 221
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar', artist_id, 238
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 't''aek till we are Ashes', artist_id, 415
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Vanishment', artist_id, 202
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Reason', artist_id, 209
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Friendships', artist_id, 226
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Memory Lane (Vln ver.)', artist_id, 184
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liberio at Night (Pf & Vln ver.)', artist_id, 178
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Footsteps of Doom', artist_id, 307
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Into the Night Acoustic ver.', artist_id, 132
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ashes on The Fire -PTV-', artist_id, 307
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'TRAITOR', artist_id, 288
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Global Allied Fleet', artist_id, 235
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'THAW', artist_id, 258
FROM artist
WHERE artist_name = 'KOHTA YAMAMOTO official'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'tæk 0N ttnTFSv', artist_id, 298
FROM artist
WHERE artist_name = 'SawanoHiroyuki[nZk]'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Eric Clapton - Layla (Live at Royal Albert Hall, 1991) (Orchestral Version)', artist_id, 489
FROM artist
WHERE artist_name = 'Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Eric Clapton - Wonderful Tonight [Official Live]', artist_id, 371
FROM artist
WHERE artist_name = 'Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'John Lennon - Imagine - 1971', artist_id, 195
FROM artist
WHERE artist_name = 'luciano pinto'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lynyrd Skynyrd - Simple Man - Live At The Florida Theatre / 2015', artist_id, 434
FROM artist
WHERE artist_name = 'Lynyrd Skynyrd'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Freddie Mercury - Love Me Like There''s No Tomorrow (Official Video)', artist_id, 233
FROM artist
WHERE artist_name = 'Freddie Mercury Solo'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Steven Tyler, Slash, and Train ''Dream On'' at the Howard Stern Birthday Bash (2014)', artist_id, 311
FROM artist
WHERE artist_name = 'Steven Tyler, Slash & Train'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen - Somebody To Love (Official Video)', artist_id, 310
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen - I Was Born To Love You (Official Video)', artist_id, 296
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Made For Lovin'' You', artist_id, 272
FROM artist
WHERE artist_name = 'KISS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fortunate Son', artist_id, 141
FROM artist
WHERE artist_name = 'Creedence Clearwater Revival'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen - Too Much Love Will Kill You (Official Video)', artist_id, 240
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen - I Want To Break Free ( Live At Wembley 1986 )', artist_id, 211
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Wants to Live Forever (Live at Wembley 11-07-1986)', artist_id, 327
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Rolling Stones - Paint It, Black (Official Lyric Video)', artist_id, 227
FROM artist
WHERE artist_name = 'The Rolling Stones'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - Livin'' On A Prayer', artist_id, 249
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - It''s My Life (Official Music Video)', artist_id, 267
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Police - Every Breath You Take (Official Music Video)', artist_id, 229
FROM artist
WHERE artist_name = 'The Police'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Alphaville - Forever Young (Official Music Video)', artist_id, 223
FROM artist
WHERE artist_name = 'Alphaville'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Africa', artist_id, 296
FROM artist
WHERE artist_name = 'Toto'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears in Heaven', artist_id, 272
FROM artist
WHERE artist_name = 'Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Starman (2012 Remaster)', artist_id, 255
FROM artist
WHERE artist_name = 'David Bowie'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bad Moon Rising', artist_id, 142
FROM artist
WHERE artist_name = 'Creedence Clearwater Revival'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Don''t Want to Miss a Thing (From "Armageddon" Soundtrack)', artist_id, 299
FROM artist
WHERE artist_name = 'Aerosmith'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Take Me Home, Country Roads (Original Version)', artist_id, 191
FROM artist
WHERE artist_name = 'John Denver'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somewhere Only We Know', artist_id, 238
FROM artist
WHERE artist_name = 'Keane'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Everybody Wants To Rule The World (Single Version)', artist_id, 253
FROM artist
WHERE artist_name = 'Tears For Fears'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sweet Caroline', artist_id, 204
FROM artist
WHERE artist_name = 'Neil Diamond'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'She''s Gone', artist_id, 393
FROM artist
WHERE artist_name = 'Steelheart'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Wind Of Change', artist_id, 313
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scorpions - Send Me An Angel', artist_id, 269
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Still Loving You (2015 - Remaster)', artist_id, 389
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hold the Line', artist_id, 236
FROM artist
WHERE artist_name = 'Toto'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Cocaine', artist_id, 222
FROM artist
WHERE artist_name = 'Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hammer To Fall (Remastered 2011)', artist_id, 266
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You & I', artist_id, 376
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Beautiful Boy (Darling Boy) (Remastered 2010)', artist_id, 246
FROM artist
WHERE artist_name = 'John Lennon'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '[I Just] Died In Your Arms', artist_id, 281
FROM artist
WHERE artist_name = 'Cutting Crew'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - You Give Love A Bad Name', artist_id, 231
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Kansas - Dust in the Wind (Official Video)', artist_id, 200
FROM artist
WHERE artist_name = 'Kansas'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - Bed Of Roses (Official Music Video)', artist_id, 403
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hard to Say I''m Sorry', artist_id, 233
FROM artist
WHERE artist_name = 'Chicago'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Richard Marx - Right Here Waiting (Official Music Video)', artist_id, 263
FROM artist
WHERE artist_name = 'Richard Marx'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Free Bird', artist_id, 559
FROM artist
WHERE artist_name = 'Lynyrd Skynyrd'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Europe - Carrie (Official Video)', artist_id, 271
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - Never Say Goodbye (Official Music Video)', artist_id, 287
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Firehouse - When I Look Into Your Eyes', artist_id, 240
FROM artist
WHERE artist_name = 'FireHouse'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - Always (Official Music Video)', artist_id, 366
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Europe - I''ll Cry For You', artist_id, 280
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bryan Adams - (Everything I Do) I Do It For You', artist_id, 393
FROM artist
WHERE artist_name = 'Bryan Adams'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bon Jovi - I''ll Be There For You', artist_id, 345
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Firehouse - Love Of A Lifetime', artist_id, 288
FROM artist
WHERE artist_name = 'FireHouse'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scorpions - No One Like You (Official Video)', artist_id, 235
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Air Supply - Making Love Out Of Nothing At All (Official HD Video)', artist_id, 293
FROM artist
WHERE artist_name = 'Air Supply'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Winner Takes It All', artist_id, 295
FROM artist
WHERE artist_name = 'ABBA'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Back In Black', artist_id, 256
FROM artist
WHERE artist_name = 'AC/DC'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Wanted Dead Or Alive', artist_id, 309
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hotel California (2013 Remaster)', artist_id, 392
FROM artist
WHERE artist_name = 'Eagles'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'When the Smoke Is Going Down (2015 - Remaster)', artist_id, 232
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Final Countdown', artist_id, 311
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under Pressure (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Follow Your Heart', artist_id, 246
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Show Must Go On (Remastered 2011)', artist_id, 278
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Believe in Love (2015 - Remaster)', artist_id, 324
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Woman (Remastered 2010)', artist_id, 213
FROM artist
WHERE artist_name = 'John Lennon'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Remastered 2011)', artist_id, 215
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want to Know What Love Is (1999 Remaster)', artist_id, 305
FROM artist
WHERE artist_name = 'Foreigner'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Thunderstruck', artist_id, 293
FROM artist
WHERE artist_name = 'AC/DC'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'This Ain''t A Love Song', artist_id, 307
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Will Always Love You', artist_id, 264
FROM artist
WHERE artist_name = 'Whitney Houston'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Remastered 2011)', artist_id, 180
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Piano Man', artist_id, 339
FROM artist
WHERE artist_name = 'Billy Joel'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Innuendo (Remastered 2011)', artist_id, 394
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Open Your Heart', artist_id, 244
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In the End', artist_id, 217
FROM artist
WHERE artist_name = 'Linkin Park'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Prisoners In Paradise', artist_id, 337
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Superstitious', artist_id, 275
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let the Good Times Rock', artist_id, 245
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'T.N.T.', artist_id, 215
FROM artist
WHERE artist_name = 'AC/DC'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Knockin'' On Heaven''s Door', artist_id, 336
FROM artist
WHERE artist_name = 'Guns N'' Roses'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stand By Me (Ultimate Mix)', artist_id, 212
FROM artist
WHERE artist_name = 'John Lennon'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Still Loving You (Live at Taratata, April 28th 1996)', artist_id, 379
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Nation Army', artist_id, 233
FROM artist
WHERE artist_name = 'The White Stripes'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Careless Whisper', artist_id, 393
FROM artist
WHERE artist_name = 'George Michael'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sweet Dreams (Are Made of This)', artist_id, 218
FROM artist
WHERE artist_name = 'Eurythmics'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''ll Never Let You Go', artist_id, 307
FROM artist
WHERE artist_name = 'Steelheart'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Eye of the Tiger', artist_id, 244
FROM artist
WHERE artist_name = 'Survivor'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'More Than Meets the Eye', artist_id, 201
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Paul McCartney, Eric Clapton - While My Guitar Gently Weeps (Taken from Concert For George)', artist_id, 362
FROM artist
WHERE artist_name = 'Paul McCartney & Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan   Tears with Lyrics Full Song Fan', artist_id, 469
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Soldier Of Fortune (2009 Digital Remaster)', artist_id, 205
FROM artist
WHERE artist_name = 'Deep Purple'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Misirlou Pulp Fiction Theme', artist_id, 134
FROM artist
WHERE artist_name = 'Dick Dale'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bryan Adams - Heaven (Official Music Video)', artist_id, 241
FROM artist
WHERE artist_name = 'Bryan Adams'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jewel', artist_id, 246
FROM artist
WHERE artist_name = 'Marty Friedman'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Remastered 2011)', artist_id, 218
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen & David Bowie - Under Pressure  live [1981] sounds better', artist_id, 242
FROM artist
WHERE artist_name = 'Queen & David Bowie'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Wants To Live Forever (Remastered 2011)', artist_id, 296
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Angel', artist_id, 275
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lady Starlight (2015 - Remaster)', artist_id, 377
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Me Like There''s No Tomorrow (Special Edition)', artist_id, 226
FROM artist
WHERE artist_name = 'Freddie Mercury Solo'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Wonderful Tonight', artist_id, 226
FROM artist
WHERE artist_name = 'Eric Clapton'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Happy Together', artist_id, 177
FROM artist
WHERE artist_name = 'The Turtles'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stand by Me', artist_id, 174
FROM artist
WHERE artist_name = 'Ben E. King'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'More Than Words', artist_id, 334
FROM artist
WHERE artist_name = 'Extreme'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Show Must Go On (Remastered 2011)', artist_id, 273
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dust in the Wind', artist_id, 207
FROM artist
WHERE artist_name = 'Kansas'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rock the Night', artist_id, 248
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Imagine (Remastered 2010)', artist_id, 188
FROM artist
WHERE artist_name = 'John Lennon'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forget-Me-Not', artist_id, 315
FROM artist
WHERE artist_name = 'Yutaka Ozaki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Too Much Love Will Kill You', artist_id, 269
FROM artist
WHERE artist_name = 'Brian May'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A World Where the Sun Never Rises', artist_id, 171
FROM artist
WHERE artist_name = 'Aimer'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Miracle', artist_id, 293
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mary On A Cross', artist_id, 245
FROM artist
WHERE artist_name = 'Ghost'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dream On', artist_id, 268
FROM artist
WHERE artist_name = 'Aerosmith'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love', artist_id, 519
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'How It Happened', artist_id, 209
FROM artist
WHERE artist_name = 'David Buckley'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Grand Escape (Movie Edit) (feat. Toko Miura)', artist_id, 189
FROM artist
WHERE artist_name = 'RADWIMPS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Wanna Be Yours', artist_id, 184
FROM artist
WHERE artist_name = 'Arctic Monkeys'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Self Love (Spider-Man: Across the Spider-Verse)', artist_id, 190
FROM artist
WHERE artist_name = 'Metro Boomin'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Rumbling', artist_id, 221
FROM artist
WHERE artist_name = 'SiM'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (2011 Mix)', artist_id, 228
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Doing All Right (Remastered 2011)', artist_id, 250
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Great King Rat (Remastered 2011)', artist_id, 343
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Fairy King (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar (Remastered 2011)', artist_id, 384
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Night Comes Down (Remastered 2011)', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Modern Times Rock ''n'' Roll (Remastered 2011)', artist_id, 109
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son And Daughter (Remastered 2011)', artist_id, 200
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jesus (Remastered 2011)', artist_id, 225
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (Remastered 2011)', artist_id, 77
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Remastered 2011)', artist_id, 356
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Remastered 2011)', artist_id, 216
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fat Bottomed Girls (Remastered 2011)', artist_id, 203
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bicycle Race (Remastered 2011)', artist_id, 181
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You''re My Best Friend (Remastered 2011)', artist_id, 171
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Stop Me Now (Remastered 2011)', artist_id, 210
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Save Me (Remastered 2011)', artist_id, 229
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Remastered 2011)', artist_id, 164
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somebody To Love (Remastered 2011)', artist_id, 297
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Remastered 2011)', artist_id, 254
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Good Old-Fashioned Lover Boy (Remastered 2011)', artist_id, 174
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Play The Game (Remastered 2011)', artist_id, 212
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flash (Remastered 2011)', artist_id, 168
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (Remastered 2011)', artist_id, 168
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Remastered 2011)', artist_id, 122
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Remastered 2011)', artist_id, 187
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Death On Two Legs (Dedicated To...) (Remastered 2011)', artist_id, 224
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lazing On A Sunday Afternoon (Remastered 2011)', artist_id, 68
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m In Love With My Car (Remastered 2011)', artist_id, 185
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''39 (Remastered 2011)', artist_id, 211
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sweet Lady (Remastered 2011)', artist_id, 243
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seaside Rendezvous (Remastered 2011)', artist_id, 135
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Prophet''s Song (Remastered 2011)', artist_id, 501
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Good Company (Remastered 2011)', artist_id, 204
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Remastered 2011)', artist_id, 355
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Remastered 2011)', artist_id, 76
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Staying Power (Remastered 2011)', artist_id, 253
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dancer (Remastered 2011)', artist_id, 231
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Back Chat (Remastered 2011)', artist_id, 276
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Body Language (Remastered 2011)', artist_id, 272
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Action This Day (Remastered 2011)', artist_id, 215
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Put Out The Fire (Remastered 2011)', artist_id, 199
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Life Is Real (Song For Lennon) (Remastered 2011)', artist_id, 212
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Calling All Girls (Remastered 2011)', artist_id, 232
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Las Palabras De Amor (The Words Of Love) (Remastered 2011)', artist_id, 272
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Cool Cat (Remastered 2011)', artist_id, 210
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Night Comes Down (2024 Mix)', artist_id, 262
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Funny How Love Is (Remastered 2011)', artist_id, 170
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Needs You (Remastered 2011)', artist_id, 187
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Some Day One Day (Remastered 2011)', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Misfire (Remastered 2011)', artist_id, 110
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'She Makes Me (Stormtrooper In Stilettos) (Remastered 2011)', artist_id, 250
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Is This The World We Created...? (Remastered 2011)', artist_id, 135
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Leaving Home Ain''t Easy (Remastered 2011)', artist_id, 196
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Procession (Remastered 2011)', artist_id, 74
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Father To Son (Remastered 2011)', artist_id, 374
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Queen (As It Began) (Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Loser In The End (Remastered 2011)', artist_id, 242
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ogre Battle (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Fairy Feller''s Master-Stroke (Remastered 2011)', artist_id, 161
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Nevermore (Remastered 2011)', artist_id, 79
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The March Of The Black Queen (Remastered 2011)', artist_id, 393
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (Remastered 2011)', artist_id, 169
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Reaching Out (Live In Sheffield / 2005)', artist_id, 69
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want To Break Free (Live In Sheffield / 2005)', artist_id, 240
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tie Your Mother Down (Live In Sheffield / 2005)', artist_id, 271
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fat Bottomed Girls (Live In Sheffield / 2005)', artist_id, 346
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Wishing Well (Live In Sheffield / 2005)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Live In Sheffield / 2005)', artist_id, 276
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Live In Sheffield / 2005)', artist_id, 243
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say It''s Not True (Live In Sheffield / 2005)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''39 (Live In Sheffield / 2005)', artist_id, 279
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Live In Sheffield / 2005)', artist_id, 312
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hammer To Fall (Live In Sheffield / 2005)', artist_id, 406
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Feel Like Makin'' Love (Live In Sheffield / 2005)', artist_id, 381
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let There Be Drums (Live In Sheffield / 2005)', artist_id, 223
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m In Love With My Car (Live In Sheffield / 2005)', artist_id, 217
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guitar Solo (Live In Sheffield / 2005)', artist_id, 420
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Last Horizon (Live In Sheffield / 2005)', artist_id, 285
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'These Are The Days Of Our Lives (Live In Sheffield / 2005)', artist_id, 281
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Live In Sheffield / 2005)', artist_id, 360
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Can''t Get Enough (Live In Sheffield / 2005)', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Kind Of Magic (Live In Sheffield / 2005)', artist_id, 368
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Live In Sheffield / 2005)', artist_id, 310
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live In Sheffield / 2005)', artist_id, 379
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Show Must Go On (Live In Sheffield / 2005)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'All Right Now (Live In Sheffield / 2005)', artist_id, 415
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live In Sheffield / 2005)', artist_id, 156
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Live In Sheffield / 2005)', artist_id, 271
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live In Sheffield / 2005)', artist_id, 97
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stone Cold Crazy (Remastered 2011)', artist_id, 137
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Hitman (Remastered 2011)', artist_id, 297
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sheer Heart Attack (Remastered 2011)', artist_id, 208
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Princes Of The Universe (Remastered 2011)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son And Daughter (2024 Mix)', artist_id, 203
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dead On Time (Remastered 2011)', artist_id, 204
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar (2024 Mix)', artist_id, 387
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Man (Remastered 2011)', artist_id, 299
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Headlong (Remastered 2011)', artist_id, 278
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m Going Slightly Mad (Remastered 2011)', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Can''t Live With You (Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Try So Hard (2011 Remaster)', artist_id, 220
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ride The Wild Wind (Remastered 2011)', artist_id, 283
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'All God''s People (Remastered 2011)', artist_id, 262
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'These Are The Days Of Our Lives (2011 Remaster)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Delilah (Remastered 2011)', artist_id, 215
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bijou (2011 Remaster)', artist_id, 217
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Procession (Live At The Rainbow, London / November 1974)', artist_id, 78
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Live At The Rainbow, London / November 1974)', artist_id, 298
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ogre Battle (Live At The Rainbow, London / November 1974)', artist_id, 331
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Father To Son (Live At The Rainbow, London / November 1974)', artist_id, 355
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Queen (As It Began) (Live At The Rainbow, London / November 1974)', artist_id, 334
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flick Of The Wrist (Live At The Rainbow, London / November 1974)', artist_id, 246
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Lap Of The Gods (Live At The Rainbow, London / November 1974)', artist_id, 198
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Live At The Rainbow, London / November 1974)', artist_id, 86
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The March Of The Black Queen (Live At The Rainbow, London / November 1974)', artist_id, 96
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bring Back That Leroy Brown (Live At The Rainbow, London / November 1974)', artist_id, 101
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son And Daughter (Live At The Rainbow, London / November 1974)', artist_id, 225
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guitar Solo (Live At The Rainbow, London / November 1974)', artist_id, 282
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son And Daughter (Reprise) (Live At The Rainbow, London / November 1974)', artist_id, 135
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (Live At The Rainbow, London / November 1974)', artist_id, 143
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Drum Solo (Live At The Rainbow, London / November 1974)', artist_id, 52
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (Reprise) (Live At The Rainbow, London / November 1974)', artist_id, 85
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (Live At The Rainbow, London / November 1974)', artist_id, 209
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stone Cold Crazy (Live At The Rainbow, London / November 1974)', artist_id, 160
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar (Live At The Rainbow, London / November 1974)', artist_id, 520
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Lap Of The Gods...Revisited (Live At The Rainbow, London / November 1974)', artist_id, 250
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Big Spender (Live At The Rainbow, London / November 1974)', artist_id, 92
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Modern Times Rock ''n'' Roll (Live At The Rainbow, London / November 1974)', artist_id, 192
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jailhouse Rock (Live At The Rainbow, London / November 1974)', artist_id, 248
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live At The Rainbow, London / November 1974)', artist_id, 77
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'One Vision (Remastered 2011)', artist_id, 312
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Kind Of Magic (Remastered 2011)', artist_id, 265
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'One Year Of Love (Remastered 2011)', artist_id, 268
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Pain Is So Close To Pleasure (Remastered 2011)', artist_id, 262
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Friends Will Be Friends (Remastered 2011)', artist_id, 247
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Wants To Live Forever (Remastered 2011)', artist_id, 316
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Gimme The Prize (Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Lose Your Head (Remastered 2011)', artist_id, 279
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ogre Battle (2011 Remaster)', artist_id, 255
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stone Cold Crazy (Remastered 2011)', artist_id, 134
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m In Love With My Car (Remastered 2011)', artist_id, 186
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (2011 Mix)', artist_id, 227
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Long Away (Remastered 2011)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Millionaire Waltz (Remastered 2011)', artist_id, 295
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tenement Funster (Remastered 2011)', artist_id, 167
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flick Of The Wrist (Remastered 2011)', artist_id, 198
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lily Of The Valley (Remastered 2011)', artist_id, 106
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The March Of The Black Queen (Remastered 2011)', artist_id, 399
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Lap Of The Gods... Revisited (Remastered 2011)', artist_id, 227
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Party (Remastered 2011)', artist_id, 144
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Khashoggi''s Ship (Remastered 2011)', artist_id, 169
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (Remastered 2011)', artist_id, 303
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Remastered 2011)', artist_id, 282
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Invisible Man (Remastered 2011)', artist_id, 243
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Breakthru (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rain Must Fall (Remastered 2011)', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scandal (Remastered 2011)', artist_id, 283
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Baby Does Me (Remastered 2011)', artist_id, 203
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Was It All Worth It (Remastered 2011)', artist_id, 346
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Party (Original Take)', artist_id, 174
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Khashoggi''s Ship (Original Take)', artist_id, 188
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (Original Take With John''s Ending)', artist_id, 286
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Original Take)', artist_id, 376
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Invisible Man (Early Version With Guide Vocal)', artist_id, 304
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'When Love Breaks Up (Demo)', artist_id, 104
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Breakthru (Real Drums And Bass)', artist_id, 299
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rain Must Fall (Demo)', artist_id, 162
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scandal (Original Rough Mix)', artist_id, 280
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Baby Loves Me', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Was It All Worth It (Original Take)', artist_id, 303
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You Know You Belong To Me', artist_id, 114
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Guess We''re All Falling Out (Demo)', artist_id, 223
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dog With A Bone', artist_id, 229
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Water (Demo)', artist_id, 112
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Face It Alone', artist_id, 248
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Single Version)', artist_id, 242
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hang On In There (B-Side)', artist_id, 227
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Breakthru (12" Version)', artist_id, 345
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stealin'' (B-Side)', artist_id, 240
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Invisible Man (12" Version)', artist_id, 330
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hijack My Heart (B-Side)', artist_id, 253
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scandal (12" Mix (Album Version))', artist_id, 396
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Life Has Been Saved (1989 B-Side Version / Remastered 2011)', artist_id, 197
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stone Cold Crazy (Live At The Rainbow, London / ''74 / B-Side)', artist_id, 131
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Melancholy Blues (Live In Houston, Texas / 1977 / B-Side Version)', artist_id, 231
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Chinese Torture (Instrumental)', artist_id, 105
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Party (Instrumental)', artist_id, 144
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Khashoggi''s Ship (Backing Track)', artist_id, 169
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (Backing Track)', artist_id, 303
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Backing Track)', artist_id, 282
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Invisible Man (Backing Track)', artist_id, 238
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Breakthru (Backing Track)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rain Must Fall (Backing Track)', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Scandal (Backing Track)', artist_id, 283
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Baby Does Me (Backing Track)', artist_id, 204
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Was It All Worth It (Backing Track)', artist_id, 345
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Live At The Hammersmith Odeon, London / 1975)', artist_id, 283
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ogre Battle (Live At The Hammersmith Odeon, London / 1975)', artist_id, 320
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Queen (As It Began) (Live At The Hammersmith Odeon, London / 1975)', artist_id, 331
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live At The Hammersmith Odeon, London / 1975)', artist_id, 149
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Live At The Hammersmith Odeon, London / 1975)', artist_id, 129
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The March of the Black Queen (Live At The Hammersmith Odeon, London / 1975)', artist_id, 91
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Reprise / Live At The Hammersmith Odeon, London / 1975)', artist_id, 63
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bring Back That Leroy Brown (Live At The Hammersmith Odeon, London / 1975)', artist_id, 93
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Brighton Rock (Live At The Hammersmith Odeon, London / 1975)', artist_id, 144
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guitar Solo (Live At The Hammersmith Odeon, London / 1975)', artist_id, 398
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son and Daughter (Live At The Hammersmith Odeon, London / 1975)', artist_id, 105
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (Live At The Hammersmith Odeon, London / 1975)', artist_id, 273
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar (Live At The Hammersmith Odeon, London / 1975)', artist_id, 526
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In the Lap of the Gods... Revisited (Live At The Hammersmith Odeon, London / 1975)', artist_id, 324
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Big Spender (Live At The Hammersmith Odeon, London / 1975)', artist_id, 84
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jailhouse Rock Medley (Live At The Hammersmith Odeon, London / 1975)', artist_id, 561
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas of Rhye (Live At The Hammersmith Odeon, London / 1975)', artist_id, 191
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'See What a Fool I''ve Been (Live At The Hammersmith Odeon, London / 1975)', artist_id, 262
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live At The Hammersmith Odeon, London / 1975)', artist_id, 83
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live, European Tour / 1979)', artist_id, 210
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me Entertain You (Live, European Tour / 1979)', artist_id, 185
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Death On Two Legs (Live, European Tour / 1979)', artist_id, 213
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Live, European Tour / 1979)', artist_id, 120
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bicycle Race (Live, European Tour / 1979)', artist_id, 89
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m In Love With My Car (Live, European Tour / 1979)', artist_id, 122
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Get Down, Make Love (Live, European Tour / 1979)', artist_id, 272
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You''re My Best Friend (Live, European Tour / 1979)', artist_id, 128
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Live, European Tour / 1979)', artist_id, 523
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dreamer''s Ball (Live, European Tour / 1979)', artist_id, 223
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Live, European Tour / 1979)', artist_id, 300
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''39 (Live, European Tour / 1979)', artist_id, 207
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (Live, European Tour / 1979)', artist_id, 242
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Stop Me Now (Live, European Tour / 1979)', artist_id, 269
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Spread Your Wings (Live, European Tour / 1979)', artist_id, 316
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Brighton Rock (Live, European Tour / 1979)', artist_id, 734
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live, European Tour / 1979)', artist_id, 353
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tie Your Mother Down (Live, European Tour / 1979)', artist_id, 222
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sheer Heart Attack (Live, European Tour / 1979)', artist_id, 216
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live, European Tour / 1979)', artist_id, 169
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Live, European Tour / 1979)', artist_id, 208
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live, European Tour / 1979)', artist_id, 93
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Cosmos Rockin''', artist_id, 252
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Time To Shine', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Still Burnin''', artist_id, 243
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Small', artist_id, 280
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Warboys', artist_id, 199
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Believe', artist_id, 368
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Call Me', artist_id, 179
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Voodoo', artist_id, 268
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Some Things That Glitter', artist_id, 243
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'C-lebrity', artist_id, 219
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Through The Night', artist_id, 293
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say It''s Not True', artist_id, 242
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Surf''s Up...School''s Out', artist_id, 356
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'small reprise', artist_id, 126
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 141
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ay-Ohs (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 66
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hammer To Fall (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 294
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 244
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 150
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)', artist_id, 277
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mustapha (Remastered 2011)', artist_id, 182
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Spread Your Wings (Remastered 2011)', artist_id, 275
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sleeping On The Sidewalk (Remastered 2011)', artist_id, 188
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s Late (Remastered 2011)', artist_id, 388
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rock It (Prime Jive) (Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sail Away Sweet Sister (Remastered 2011)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dragon Attack (Remastered 2011)', artist_id, 259
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jealousy (Remastered 2011)', artist_id, 194
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Battle Theme (Remastered 2011)', artist_id, 141
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Kind Of Magic (Remastered 2011)', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under Pressure (Remastered 2011)', artist_id, 237
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Remastered 2011)', artist_id, 344
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Remastered 2011)', artist_id, 242
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want To Break Free (Remastered 2011)', artist_id, 258
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Innuendo (Remastered 2011)', artist_id, 389
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Hard Life (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Breakthru (Remastered 2011)', artist_id, 250
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Headlong (Remastered 2011)', artist_id, 272
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (Remastered 2011)', artist_id, 295
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m Going Slightly Mad (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Invisible Man (Remastered 2011)', artist_id, 238
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hammer To Fall (Remastered 2011)', artist_id, 219
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Friends Will Be Friends (Remastered 2011)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Show Must Go On (Remastered 2011)', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'One Vision (Remastered 2011)', artist_id, 246
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Intro (Live)', artist_id, 120
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Fast) (Live)', artist_id, 187
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me Entertain You (Live)', artist_id, 169
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Play The Game (Live)', artist_id, 238
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somebody To Love (Live)', artist_id, 474
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Live)', artist_id, 120
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''m In Love With My Car (Live)', artist_id, 124
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Get Down, Make Love (Live)', artist_id, 286
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Save Me (Live)', artist_id, 255
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Live)', artist_id, 332
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dragon Attack (Live)', artist_id, 192
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Reprise) (Live)', artist_id, 114
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Live)', artist_id, 237
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under Pressure (Live)', artist_id, 231
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (Live)', artist_id, 210
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Drum And Tympani Solo (Live)', artist_id, 181
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guitar Solo (Live)', artist_id, 312
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flash (Live)', artist_id, 132
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Hero (Live)', artist_id, 112
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Live)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jailhouse Rock (Live)', artist_id, 153
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live)', artist_id, 329
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tie Your Mother Down (Live)', artist_id, 233
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Live)', artist_id, 241
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sheer Heart Attack (Live)', artist_id, 234
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live)', artist_id, 130
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Live)', artist_id, 208
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live)', artist_id, 88
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'See What A Fool I''ve Been (B-Side Version / Remastered 2011)', artist_id, 272
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Human Body (B-Side)', artist_id, 223
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Soul Brother (B-Side)', artist_id, 217
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rock In Rio Blues (Live / B-Side / Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Go Crazy (B-Side)', artist_id, 224
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever (2011 Remaster)', artist_id, 202
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lost Opportunity (B-Side)', artist_id, 232
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Beautiful Day (B-Side Version / Remastered 2011)', artist_id, 239
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fat Bottomed Girls (2011 Remaster)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'If You Can''t Beat Them (Remastered 2011)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me Entertain You (Remastered 2011)', artist_id, 182
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In Only Seven Days (Remastered 2011)', artist_id, 150
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dreamer''s Ball (Remastered 2011)', artist_id, 211
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fun It (Remastered 2011)', artist_id, 209
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'More Of That Jazz (Remastered 2011)', artist_id, 257
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive (2024 Mix)', artist_id, 226
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Doing All Right (2024 Mix)', artist_id, 251
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Great King Rat (2024 Mix)', artist_id, 346
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mad The Swine (2024 Mix)', artist_id, 201
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Fairy King (2024 Mix)', artist_id, 252
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Modern Times Rock ''n'' Roll (2024 Mix)', artist_id, 109
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jesus (2024 Mix)', artist_id, 223
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (2024 Mix)', artist_id, 80
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Remastered 2011)', artist_id, 349
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tear It Up (Remastered 2011)', artist_id, 205
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Hard Life (Remastered 2011)', artist_id, 247
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Man On The Prowl (Remastered 2011)', artist_id, 206
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Machines (or ''Back To Humans'') (Remastered 2011)', artist_id, 308
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want To Break Free (Remastered 2011)', artist_id, 199
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Passing The Open Windows (Remastered 2011)', artist_id, 322
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made In Heaven (2011 Remaster)', artist_id, 327
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Try So Hard (2011 Remaster)', artist_id, 221
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born To Love You (2011 Remaster)', artist_id, 291
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Winter''s Tale (2011 Remaster)', artist_id, 233
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ride The Wild Wind (Remastered 2011)', artist_id, 284
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bijou (2011 Remaster)', artist_id, 218
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Khashoggi''s Ship (2011 Remaster)', artist_id, 173
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Is This The World We Created...? (Remastered 2011)', artist_id, 133
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Beautiful Day (Remastered 2011)', artist_id, 202
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mother Love (2011 Remaster)', artist_id, 289
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somebody To Love (Remastered 2011)', artist_id, 298
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Stop Me Now (Remastered 2011)', artist_id, 211
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Teo Torriatte (Let Us Cling Together) (Remastered 2011)', artist_id, 355
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Spread Your Wings (Remastered 2011)', artist_id, 274
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Remastered 2011)', artist_id, 182
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''39 (Remastered 2011)', artist_id, 213
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The March Of The Black Queen (Remastered 2011)', artist_id, 401
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Good Old-Fashioned Lover Boy (Remastered 2011)', artist_id, 175
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Remastered 2011)', artist_id, 348
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'One Vision (Live)', artist_id, 338
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tie Your Mother Down (Live)', artist_id, 282
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Lap Of The Gods... Revisited (Live)', artist_id, 137
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye (Live)', artist_id, 101
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tear It Up (Live)', artist_id, 108
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Kind Of Magic (Live)', artist_id, 501
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under Pressure (Live)', artist_id, 230
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Live)', artist_id, 297
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Wants To Live Forever', artist_id, 240
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want To Break Free (Live)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Looks Like It''s Gonna Be A Good Night (Improv / Live)', artist_id, 219
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guitar Solo (Live)', artist_id, 444
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Live)', artist_id, 361
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Live)', artist_id, 278
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tavaszi Szel Vizet Araszt (Live)', artist_id, 136
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Is This The World We Created...? (Live)', artist_id, 152
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '(You''re So Square) Baby I Don''t Care (Live)', artist_id, 89
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hello Mary Lou (Goodbye Heart) (Live)', artist_id, 144
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tutti Frutti (Live)', artist_id, 216
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Live)', artist_id, 331
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hammer To Fall (Live)', artist_id, 307
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Live)', artist_id, 293
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Radio Ga Ga (Live)', artist_id, 372
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Live)', artist_id, 183
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Friends Will Be Friends (Live)', artist_id, 122
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Live)', artist_id, 232
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'God Save The Queen (Live)', artist_id, 84
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me In Your Heart Again (2014 Remaster)', artist_id, 275
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Kills (The Ballad)', artist_id, 253
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'There Must Be More To Life Than This (William Orbit Mix)', artist_id, 208
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Hard Life (2014 Remaster)', artist_id, 247
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You''re My Best Friend (Remastered 2011)', artist_id, 173
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Of My Life (Remastered 2011)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Drowse (2014 Remaster)', artist_id, 219
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Long Away (Remastered 2011)', artist_id, 213
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lily Of The Valley (2014 Remaster)', artist_id, 100
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'These Are The Days Of Our Lives (2011 Remaster)', artist_id, 255
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Winter''s Tale (2011 Remaster)', artist_id, 229
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Play The Game (2014 Remaster)', artist_id, 195
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Save Me (2014 Remaster)', artist_id, 227
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somebody To Love (2014 Remaster)', artist_id, 293
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Too Much Love Will Kill You (Remastered 2011)', artist_id, 260
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Innuendo (Digital Remaster)', artist_id, 392
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bohemian Rhapsody (Digital Remaster)', artist_id, 354
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Brighton Rock (Remastered 2011)', artist_id, 311
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Was It All Worth It (Remastered 2011)', artist_id, 348
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Will Rock You (Remastered 2011)', artist_id, 123
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are The Champions (Remastered 2011)', artist_id, 180
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'All Dead, All Dead (Remastered 2011)', artist_id, 190
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fight From The Inside (Remastered 2011)', artist_id, 182
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Get Down, Make Love (Remastered 2011)', artist_id, 231
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sleeping On The Sidewalk (Remastered 2011)', artist_id, 187
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s Late (Remastered 2011)', artist_id, 387
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Melancholy Blues (Remastered 2011)', artist_id, 212
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Party (Remastered 2011)', artist_id, 145
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Khashoggi''s Ship (Remastered 2011)', artist_id, 168
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (Remastered 2011)', artist_id, 302
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Want It All (Remastered 2011)', artist_id, 281
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Save Me (Remastered 2011)', artist_id, 230
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Fat Bottomed Girls (Remastered 2011)', artist_id, 256
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Lily Of The Valley (Remastered 2011)', artist_id, 105
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Remastered 2011)', artist_id, 253
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Lap Of The Gods (Remastered 2011)', artist_id, 203
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dear Friends (Remastered 2011)', artist_id, 68
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bring Back That Leroy Brown (Remastered 2011)', artist_id, 136
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Show Must Go On (Live / Theatre National de Chaillot, Paris / 1997)', artist_id, 276
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under Pressure (Rah Mix)', artist_id, 249
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barcelona', artist_id, 266
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Too Much Love Will Kill You', artist_id, 259
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Somebody To Love (Live At The Freddie Mercury Tribute Concert For AIDS Awareness, Wembley / 1992)', artist_id, 308
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You Don''t Fool Me', artist_id, 323
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Heaven For Everyone', artist_id, 278
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Las Palabras De Amor (The Words Of Love)', artist_id, 270
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Driven By You', artist_id, 250
FROM artist
WHERE artist_name = 'Brian May'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living on My Own (Julian Raymond Album Mix)', artist_id, 218
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me Live', artist_id, 286
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Great Pretender', artist_id, 206
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Princes Of The Universe', artist_id, 212
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Another One Bites The Dust (Remix)', artist_id, 261
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'No One But You (Only The Good Die Young)', artist_id, 252
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'These Are The Days Of Our Lives', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Thank God It''s Christmas', artist_id, 260
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flash''s Theme (Remastered 2011)', artist_id, 210
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Space Capsule (The Love Theme) (Remastered 2011)', artist_id, 163
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ming''s Theme (In The Court Of Ming The Merciless) (Remastered 2011)', artist_id, 161
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Ring (Hypnotic Seduction Of Dale) (Remastered 2011)', artist_id, 58
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Football Fight (Remastered 2011)', artist_id, 89
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'In The Death Cell (Love Theme Reprise) (Remastered 2011)', artist_id, 145
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Execution Of Flash (Remastered 2011)', artist_id, 66
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Kiss (Aura Resurrects Flash) (Remastered 2011)', artist_id, 105
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Arboria (Planet Of The Tree Men) (Remastered 2011)', artist_id, 102
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Escape From The Swamp (Remastered 2011)', artist_id, 104
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flash To The Rescue (Remastered 2011)', artist_id, 164
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Vultan''s Theme (Attack Of The Hawk Men) (Remastered 2011)', artist_id, 73
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Battle Theme (Remastered 2011)', artist_id, 139
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Wedding March (Remastered 2011)', artist_id, 56
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Marriage Of Dale And Ming (And Flash Approaching) (Remastered 2011)', artist_id, 125
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crash Dive On Mingo City (Remastered 2011)', artist_id, 61
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Flash''s Theme Reprise (Remastered 2011)', artist_id, 84
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Hero (Remastered 2011)', artist_id, 214
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crazy Little Thing Called Love (Remastered 2011)', artist_id, 165
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Need Your Loving Tonight (Remastered 2011)', artist_id, 170
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Don''t Try Suicide (Remastered 2011)', artist_id, 233
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Too Much Love Will Kill You (Remastered 2011)', artist_id, 263
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You Take My Breath Away (Remastered 2011)', artist_id, 307
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me In Your Heart Again (2014 Remaster)', artist_id, 276
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dear Friends (Remastered 2011)', artist_id, 69
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You Take My Breath Away (2014 Remaster)', artist_id, 279
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Spread Your Wings (2014 Remaster)', artist_id, 271
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born To Love You (2011 Remaster)', artist_id, 290
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''39 (2014 Remaster)', artist_id, 211
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mother Love (2011 Remaster)', artist_id, 288
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made In Heaven (2011 Remaster)', artist_id, 326
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Too Much Love Will Kill You (Remastered 2011)', artist_id, 261
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Miracle (2014 Remaster)', artist_id, 298
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Is This The World We Created...? (2014 Remaster)', artist_id, 133
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tie Your Mother Down (Remastered 2011)', artist_id, 288
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Now I''m Here (Remastered 2011)', artist_id, 258
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Keep Yourself Alive', artist_id, 228
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Doing All Right', artist_id, 250
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Great King Rat', artist_id, 343
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Fairy King', artist_id, 254
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Liar', artist_id, 386
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Night Comes Down', artist_id, 264
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Modern Times Rock ''n'' Roll', artist_id, 109
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Son And Daughter', artist_id, 204
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Jesus', artist_id, 225
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seven Seas Of Rhye', artist_id, 77
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Killer Queen (Remastered 2011)', artist_id, 185
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Bicycle Race (Remastered 2011)', artist_id, 182
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Coming Soon (Remastered 2011)', artist_id, 171
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Beautiful Day (Remastered 2011)', artist_id, 155
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made In Heaven (2011 Remaster)', artist_id, 325
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let Me Live (Remastered 2011)', artist_id, 286
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Life Has Been Saved (Remastered 2011)', artist_id, 196
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mother Love (2011 Remaster)', artist_id, 287
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Heaven For Everyone (Remastered 2011)', artist_id, 337
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You Don''t Fool Me (Remastered 2011)', artist_id, 325
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Winter''s Tale (2011 Remaster)', artist_id, 231
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'It''s A Beautiful Day (Reprise) (Remastered 2011)', artist_id, 181
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yeah (Remastered 2011)', artist_id, 5
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Untitled (Remastered 2011)', artist_id, 1355
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let''s Turn It On (Special Edition)', artist_id, 223
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made In Heaven (Special Edition)', artist_id, 247
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born To Love You (Special Edition)', artist_id, 220
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Foolin'' Around (Special Edition)', artist_id, 210
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Your Kind Of Lover (Special Edition)', artist_id, 215
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Mr. Bad Guy (Special Edition)', artist_id, 250
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Man Made Paradise (Special Edition)', artist_id, 250
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'There Must Be More To Life Than This (Special Edition)', artist_id, 182
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living On My Own (Special Edition)', artist_id, 204
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Love Is Dangerous (Special Edition)', artist_id, 224
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Me Like There''s No Tomorrow (Special Edition)', artist_id, 226
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living on My Own (Single Edit)', artist_id, 186
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Great Pretender', artist_id, 207
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Kills', artist_id, 271
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barcelona', artist_id, 267
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made in Heaven (Single Remix)', artist_id, 251
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Me Like There''s No Tomorrow', artist_id, 227
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born to Love You', artist_id, 220
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Golden Boy (Single Edit)', artist_id, 316
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Can Hear Music', artist_id, 206
FROM artist
WHERE artist_name = 'Larry Lurex'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'How Can I Go On (Single Version)', artist_id, 243
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living On My Own (No More Brothers Radio Mix)', artist_id, 222
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Goin'' Back', artist_id, 213
FROM artist
WHERE artist_name = 'Larry Lurex'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Let''s Turn It On', artist_id, 224
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'My Love Is Dangerous', artist_id, 221
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'She Blows Hot and Cold', artist_id, 220
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living on My Own (Julian Raymond Album Mix)', artist_id, 219
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stop All the Fighting', artist_id, 201
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Exercises in Free Love (Freddie Vocal)', artist_id, 241
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Exercises in Free Love (Montserrat Vocal)', artist_id, 245
FROM artist
WHERE artist_name = 'Montserrat Caballé'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Fallen Priest (B-Side Edit)', artist_id, 178
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Overture Piccante', artist_id, 401
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Kills (Wolf Euro Mix)', artist_id, 208
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barcelona (New Orchestrated Version)', artist_id, 346
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'La Japonaise (New Orchestrated Version)', artist_id, 293
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Fallen Priest (New Orchestrated Version)', artist_id, 347
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Ensue''o (New Orchestrated Version)', artist_id, 263
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Golden Boy (New Orchestrated Version)', artist_id, 364
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Guide Me Home (New Orchestrated Version)', artist_id, 171
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'How Can I Go On (New Orchestrated Version)', artist_id, 230
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Exercises In Free Love (New Orchestrated Version)', artist_id, 238
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Overture Piccante (New Orchestrated Version)', artist_id, 403
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Great Pretender (Special Edition)', artist_id, 206
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born To Love You (Special Edition)', artist_id, 219
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Barcelona (2012 Orchestrated Version)', artist_id, 342
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Kills (Special Edition)', artist_id, 270
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'How Can I Go On (2012 Orchestrated Version / Single Version)', artist_id, 239
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Living On My Own (No More Brothers Radio Mix)', artist_id, 218
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Golden Boy (2012 Orchestrated Version / Single Edit)', artist_id, 313
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'She Blows Hot And Cold (Special Edition)', artist_id, 206
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Made In Heaven (Special Edition)', artist_id, 246
FROM artist
WHERE artist_name = 'Freddie Mercury'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Queen - Nevermore (Official Lyric Video)', artist_id, 84
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Prologue (World Anthem) (Remaster)', artist_id, 156
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Week End (Remaster)', artist_id, 364
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Easy Fight Rambling (Remaster)', artist_id, 283
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Remaster)', artist_id, 362
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Endless Rain', artist_id, 397
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Kurenai (Intro strings)', artist_id, 380
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Xclamation', artist_id, 238
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Orgasm', artist_id, 168
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Celebration (Remaster)', artist_id, 293
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rose of Pain (Remaster)', artist_id, 711
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Kurenai (Long version)', artist_id, 415
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '20th CENTURY BOY ((Live Take) [Remaster])', artist_id, 175
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X ((Live Version) [Remaster])', artist_id, 581
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Week End', artist_id, 346
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Endless Rain (Live Version) (Remaster)', artist_id, 419
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Silent Jealousy', artist_id, 440
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sadistic Desire', artist_id, 364
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing Sex', artist_id, 264
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Joker', artist_id, 296
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything', artist_id, 521
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Silent Jealousy ((Live Version) [Remaster])', artist_id, 470
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'A Piano String in Es Dur', artist_id, 114
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Silent Jealousy', artist_id, 439
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Miscast', artist_id, 314
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Desperate Angel', artist_id, 354
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Wind from Mr. Martin -Pata''s Nap-', artist_id, 63
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Voiceless Screaming', artist_id, 377
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Stab Me In The Back', artist_id, 233
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Replica', artist_id, 276
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Joker', artist_id, 332
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything', artist_id, 523
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DAHLIA', artist_id, 477
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longingtogireta melody', artist_id, 459
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rusty Nail', artist_id, 328
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WHITE POEM I', artist_id, 199
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'CRUCIFY MY LOVE', artist_id, 277
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears', artist_id, 628
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WRIGGLE', artist_id, 86
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love (Acoustic Version)', artist_id, 474
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'La Venus (Acoustic Version - Studio)', artist_id, 281
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Kurenai (Live - from The Last Live)', artist_id, 339
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Dahlia (Studio Version)', artist_id, 479
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Crucify My Love (Studio Version)', artist_id, 273
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing Sex (Live)', artist_id, 286
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears (Studio Version)', artist_id, 433
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longing ~Setsubou no Yoru~ (Studio Version)', artist_id, 313
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Art of Life (Studio Version)', artist_id, 280
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (From The Last Live)', artist_id, 396
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'BLUE BLOOD (Live)', artist_id, 358
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SADISTIC DESIRE (Live)', artist_id, 442
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing Sex (Live)', artist_id, 512
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEK END (Live)', artist_id, 369
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI Drum solo (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI piano solo (Live)', artist_id, 246
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ART OF LIFE (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'JOKER (Live)', artist_id, 311
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Orgasm (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Count down 1993-1994 Version) (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ENDLESS RAIN (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything (SE) (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Amethyst (Live)', artist_id, 371
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Live)', artist_id, 356
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'JOKER (Live)', artist_id, 252
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DAHLIA (Live)', artist_id, 448
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCARS ON MELODY (Live)', artist_id, 305
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEK END (Live)', artist_id, 350
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing SEX (Live)', artist_id, 269
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI Drum Solo (Short Version) (Live)', artist_id, 496
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything (Live)', artist_id, 404
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ROSE OF PAIN (Live)', artist_id, 366
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI Piano Solo (Live)', artist_id, 430
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '#NAME?', artist_id, 432
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'CELEBRATION (Live)', artist_id, 300
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rusty Nail (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longing (Live)', artist_id, 572
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears(SE) (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything(SE) (Live)', artist_id, 400
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Amethyst (Live)', artist_id, 199
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rusty Nail (Live)', artist_id, 336
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEK END (Live)', artist_id, 361
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DAHLIA (Live)', artist_id, 456
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCARS ON MELODY (Live)', artist_id, 311
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing SEX (Live)', artist_id, 271
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI Drum Solo (Live)', artist_id, 581
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything (Live)', artist_id, 414
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ROSE OF PAIN (Live)', artist_id, 363
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI Piano Solo (Live)', artist_id, 462
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'KURENAI- (Short Version) (Live)', artist_id, 460
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ENDLESS RAIN (Short Version) (Live)', artist_id, 495
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'JOKER (Live)', artist_id, 314
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Short Version) (Live)', artist_id, 276
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longing (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything(SE) (Live)', artist_id, 488
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears(SE) (Live)', artist_id, 597
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Amethyst (Live)', artist_id, 380
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rusty Nail (Live)', artist_id, 329
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCARS (Live)', artist_id, 299
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DAHLIA (Live)', artist_id, 478
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DRAIN (Live)', artist_id, 258
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'CRUCIFY MY LOVE (Live)', artist_id, 312
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Longing-togireta melody- (Live)', artist_id, 499
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'KURENAI- (Live)', artist_id, 379
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Orgasm (Short version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love (Live)', artist_id, 469
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Prologue (WORLD ANTHEM) (Live)', artist_id, 171
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Live)', artist_id, 597
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ENDLESS RAIN (Short version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'THE LAST SONG (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Amethyst (Live)', artist_id, 390
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Rusty Nail (Live)', artist_id, 465
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEK END (Live)', artist_id, 404
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCARS (Short Version) (Live)', artist_id, 278
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DAHLIA (Live)', artist_id, 488
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DRAIN (Live)', artist_id, 537
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'CRUCIFY MY LOVE (Live)', artist_id, 540
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ENDLESS RAIN (Live)', artist_id, 600
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'KURENAI- (Live)', artist_id, 467
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'White Poem I (Short Version) (Live)', artist_id, 368
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'FOREVER LOVE (Short Version) (Live)', artist_id, 471
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Short Version) (Live)', artist_id, 596
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Prologue(WORLD ANTHEM) (Live)', artist_id, 187
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Silent Jealousy (Live)', artist_id, 473
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SADISTIC DESIRE (Live)', artist_id, 420
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Standing Sex (Live)', artist_id, 486
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEK END (Live)', artist_id, 433
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI piano solo (Live)', artist_id, 259
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ART OF LIFE (Short version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'CELEBRATION (Live)', artist_id, 373
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears (Live)', artist_id, 557
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'KURENAI- (Short Version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X (Short version) (Live)', artist_id, 599
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Say Anything (SE) (Live)', artist_id, 517
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''Red Swan'' by YOSHIKI (feat. HYDE & SUGIZO) from "YOSHIKI: Under the Sky"', artist_id, 291
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI sings 1st time on TV for his Mother ''Angel YOSHIKI ver'' New Single "X JAPAN ver" out July 28', artist_id, 126
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Seize The Light (Classical Version [Live])', artist_id, 393
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Golden Globe Theme (Theme for the Golden Globe Awards)', artist_id, 230
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Tears (Classical Version)', artist_id, 306
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Red Christmas (Classical Version)', artist_id, 442
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Anniversary [Theme for the Emperor of Japan 10 Year Anniversary]', artist_id, 439
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love (Classical Version [Live])', artist_id, 501
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I''ll Be Your Love[Theme for the World Expo Japan] (Classical Version))', artist_id, 544
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Amethyst', artist_id, 380
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'The Last Song (Classical Version [Live])', artist_id, 488
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Golden Globe Theme (Quartet Version)', artist_id, 229
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'BREATHING', artist_id, 334
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'NOTHING', artist_id, 339
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'LOVE OF TENDER', artist_id, 207
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'BELLE', artist_id, 199
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'DEBT', artist_id, 266
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'BREATHING (reprise)', artist_id, 239
FROM artist
WHERE artist_name = 'BLUEBYRDS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Butterfly (Acoustic Version)', artist_id, 290
FROM artist
WHERE artist_name = 'Be-ray'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Butterfly', artist_id, 279
FROM artist
WHERE artist_name = 'Be-ray'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Psycho Love', artist_id, 226
FROM artist
WHERE artist_name = 'THE LAST ROCKSTARS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'THE LAST ROCKSTARS (PARIS MIX)', artist_id, 286
FROM artist
WHERE artist_name = 'THE LAST ROCKSTARS'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - Forever Love (Vocal Only/Acapella)', artist_id, 373
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN '' Without you [LIVE 2008.03.30 Souzou no Yoru | Night of Creation]', artist_id, 362
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '#XJAPAN  X  [ X JAPAN SP SONGS ,TV LIVE 2016.12.17 ]', artist_id, 288
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN / MC', artist_id, 483
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Love by X JAPAN - Official Music Video', artist_id, 287
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - Say Anything', artist_id, 543
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - Joker', artist_id, 289
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - WEEK END', artist_id, 374
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - ENDLESS RAIN (Live at NIPPON BUDOKAN ,1990)', artist_id, 392
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - X (Live at Hibiya Open-Air Concert Hall,1989', artist_id, 577
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN '' KURENAI (Live at Hibiya Open-Air Concert Hall,1989', artist_id, 408
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'ART OF LIFE - X JAPAN (Full ver 30 min)', artist_id, 1844
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - TEARS - composed by YOSHIKI', artist_id, 396
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Rusty Nail from "The Last Live" HD', artist_id, 343
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN ENDLESS RAINHD', artist_id, 422
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN Silent JealousyHD', artist_id, 477
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan "Kurenai" from The Last Live (HD)', artist_id, 433
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Jade (PG Version)', artist_id, 384
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yoshiki X Japan Drum Diving', artist_id, 15
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan World Tour Volume I', artist_id, 160
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Born To Be Free at Nissan Stadium', artist_id, 387
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yoshiki Wembley Solo in UK | WE ARE X Now Available on Amazon Prime Video in the U.S.!', artist_id, 192
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'WEEKEND - No Audience - X JAPAN 2018- Live Broadcast -  Line Cut', artist_id, 381
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan "Angel" First Single in 8 Years; Music & Lyrics by YOSHIKI - Now Streaming Worldwide', artist_id, 275
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Endless Rain from "The Last Live" HD', artist_id, 657
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI - DRUM SOLO after 2 neck surgeries - No Audience Live - X JAPAN (LINE CUT)', artist_id, 561
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Live @ Wembley Arena March 4, 2017 - London', artist_id, 89
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Rusty Nail (Anime Version)', artist_id, 329
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Forever Love from The Last Live - HD', artist_id, 494
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - I.V. (Official Music Video) HD', artist_id, 301
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Hero (lyric video trailer)', artist_id, 42
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan The Last Song - Tears - UNFINISHED from "The Last Live" HD', artist_id, 1801
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Last Knights Trailer (Featuring X Japan Single "Born To Be Free")', artist_id, 26
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'We Are All "Born To Be Free" - X Japan and Fans', artist_id, 377
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Wembley Arena - March 4, 2017', artist_id, 103
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan is Finally Coming to Wembley Arena March 4, 2017 - London', artist_id, 175
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan SSE Arena, Wembley - March 4, 2017 (announcement)', artist_id, 119
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Madison Square Garden - Oct 11, 2014 (announcement)', artist_id, 133
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan Japan Tour 2015 in NAGOYA - Live Viewing', artist_id, 59
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Madison Square Garden - Oct 11, 2014', artist_id, 31
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN - MADISON SQUARE GARDEN 10.11.14', artist_id, 31
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yoshiki''s return to drums! X Japan to perform at Coachella 2018', artist_id, 70
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X JAPAN "No Audience" Concert', artist_id, 30
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan "WITHOUT YOU" (rough cut) - TOKYO DOME 2009', artist_id, 502
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'X Japan - Endless Rain (French Lyrics HD version)', artist_id, 68
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'NOW AVAILABLE ON PRIME VIDEO IN THE US: AWARD-WINNING X JAPAN DOCUMENTARY "WE ARE X"', artist_id, 142
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'YOSHIKI ANNOUNCES X JAPAN- DOCUMENTARY "WE ARE X" ON PRIME VIDEO-  AVAILABLE NOW in the US!', artist_id, 30
FROM artist
WHERE artist_name = 'X Japan'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Yoshiki Foundation America', artist_id, 341
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT '''WE ARE X'' JAPAN BLU-RAY RELEASE DECEMBER 13, 2017!', artist_id, 109
FROM artist
WHERE artist_name = 'Yoshiki'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Never Say Goodbye', artist_id, 289
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Sign of the Times', artist_id, 255
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Little Wing (Live in Japan)', artist_id, 505
FROM artist
WHERE artist_name = 'Uli Jon Roth - Topic'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Send Me An Angel (Coming Home Live)', artist_id, 271
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Forever Young (2019 Remaster)', artist_id, 226
FROM artist
WHERE artist_name = 'Alphaville'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'I Was Born To Love You (Vocals & Piano Version / Remastered 2011)', artist_id, 176
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Hard to Say I''m Sorry / Get Away (2006 Remaster)', artist_id, 306
FROM artist
WHERE artist_name = 'Chicago'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Right Here Waiting', artist_id, 265
FROM artist
WHERE artist_name = 'Richard Marx'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'When I Look Into Your Eyes', artist_id, 240
FROM artist
WHERE artist_name = 'FireHouse'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'SCORPIONS - LIVING FOR TOMORROW (Lyrics)', artist_id, 332
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Who Wants To Live Forever', artist_id, 315
FROM artist
WHERE artist_name = 'Queen'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Thank You For Loving Me', artist_id, 309
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Open Your Heart', artist_id, 247
FROM artist
WHERE artist_name = 'Europe'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Always Somewhere (2015 - Remaster)', artist_id, 298
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Every Breath You Take', artist_id, 254
FROM artist
WHERE artist_name = 'The Police'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'You''re All I Need', artist_id, 266
FROM artist
WHERE artist_name = 'White Lion'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Under The Same Sun', artist_id, 294
FROM artist
WHERE artist_name = 'Scorpions'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love Hurts (Single Edit)', artist_id, 233
FROM artist
WHERE artist_name = 'Nazareth'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Listen To Your Heart', artist_id, 329
FROM artist
WHERE artist_name = 'Roxette'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Always', artist_id, 354
FROM artist
WHERE artist_name = 'Bon Jovi'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Straight From The Heart (Classic Version)', artist_id, 209
FROM artist
WHERE artist_name = 'Bryan Adams'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);
INSERT INTO song (title, artist_id, duration_seconds)
SELECT 'Love of a Lifetime (2024 Remaster)', artist_id, 286
FROM artist
WHERE artist_name = 'FireHouse'
ON DUPLICATE KEY UPDATE song_id = LAST_INSERT_ID(song_id);

-- Playlist-song relationships (position preserves original CSV order)
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Alive - X Japan Lyrics'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 505
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'Yoshiki & Roger Tailor (with Toshi) - Foreing Sand (Live 1994 at GME Aoniyoshi)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Roger Taylor & Yoshiki')
 AND s.duration_seconds = 365
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - UnfinishedREMIX English subtitles (cc)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 259
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = '7XX Japan - Week End ''93 ver  remixWith backing vocals for all members)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 360
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Joker Backing vocals volume up'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 299
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'X-Japan Silent Jealousy - Returns 1993.12.30'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 459
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'I.V.'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 294
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Jade (Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 442
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Forever Love Remix'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 450
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Longing togireta melody'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 459
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Scarlet Love Song (BUDDAH MIX)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 375
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Unfinished (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 395
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain (From The Last Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 427
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - SAY ANYTHING (X With Orchestra 1991.12.08)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 510
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - HERO () English subtitles(cc)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 291
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Longing REMIX  cc'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 460
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 519
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Crucify My Love Remix'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Without You (Unplugged - Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 362
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'SCARS'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'Blue Blood (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 303
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Rusty Nail from ""The Last Live"" HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Easy Fight RamblingBacking vocals volume up'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 336
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Born To Be Free Remix (cc)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 389
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'DRAIN'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'Lemon'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Kenshi Yonezu')
 AND s.duration_seconds = 257
WHERE p.playlist_name = 'Alive Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'tæk 0N ttn'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 257
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'The Reluctant Heroes'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'eye-water'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'bodymotion'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'cóunterattàck-mænknd'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 367
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'armyG'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'Vogel im Käfig'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 381
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'DOA'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'EMA'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = '9'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Bauklötze'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 237
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = '2chi'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 408
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'XL-TT'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 398
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'Call your name'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'omake-pfadlib'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'Barricades'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'APETITAN'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 332
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'YouSeeBIGGIRL/T:T'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 360
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'son2seaVer'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 322
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Call of Silence'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 179
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'ERENthe'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 384
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'attackD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 285
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'YAMANAIAME'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 267
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = '2Volt'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 402
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'st-hrn-egt20130629'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 302
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'So ist es immer'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 290
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'st-hrn-gt-pf20130629'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 277
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'ymniam-orch'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 190
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 29
FROM playlist p
JOIN song s
  ON s.title = 'The Reluctant Heroes MODv'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 270
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 30
FROM playlist p
JOIN song s
  ON s.title = 'st-hrn-gt20130629'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 31
FROM playlist p
JOIN song s
  ON s.title = 'theDOGS'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 32
FROM playlist p
JOIN song s
  ON s.title = 'pf-medley20130629'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 33
FROM playlist p
JOIN song s
  ON s.title = 'EMAymniam'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 331
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 34
FROM playlist p
JOIN song s
  ON s.title = 'pf20130218'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 35
FROM playlist p
JOIN song s
  ON s.title = 'gt20130218'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 152
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 36
FROM playlist p
JOIN song s
  ON s.title = 'TWO-lives'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 294
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 37
FROM playlist p
JOIN song s
  ON s.title = 'st20130629'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 325
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 38
FROM playlist p
JOIN song s
  ON s.title = 'vn-pf20130524'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 39
FROM playlist p
JOIN song s
  ON s.title = 'ymniam-MKorch'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 155
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 40
FROM playlist p
JOIN song s
  ON s.title = 'pf-adlib-c20130218'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 41
FROM playlist p
JOIN song s
  ON s.title = 'pf-adlib-b20130218'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 172
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 42
FROM playlist p
JOIN song s
  ON s.title = 'vc-pf20130218'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 372
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 43
FROM playlist p
JOIN song s
  ON s.title = 'TheWeightOfLives'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 439
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 44
FROM playlist p
JOIN song s
  ON s.title = 'YAMANAIAME FMv'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 45
FROM playlist p
JOIN song s
  ON s.title = 'AOTs2M1'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 251
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 46
FROM playlist p
JOIN song s
  ON s.title = 'AOTs2M2'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 130
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 47
FROM playlist p
JOIN song s
  ON s.title = 'AOTs2M3'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 48
FROM playlist p
JOIN song s
  ON s.title = 'AOTs2M4'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 244
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 49
FROM playlist p
JOIN song s
  ON s.title = 'K2-'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 347
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 50
FROM playlist p
JOIN song s
  ON s.title = 'Zero Eclipse'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 254
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 51
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part1-1st:0Sk'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 371
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 52
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part1-2nd:sA'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 53
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part1-3rd:BARRIchestra'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 360
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 54
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part1-4th:7-b@$'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 318
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 55
FROM playlist p
JOIN song s
  ON s.title = 'K21'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 56
FROM playlist p
JOIN song s
  ON s.title = 'AoTs3-3spens/21'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 57
FROM playlist p
JOIN song s
  ON s.title = 'Call your name Gv'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 58
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-1st:tæk 0N ttn WMId'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 59
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-2nd:ShingekiNoKyojin'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 183
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 60
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-3rd:Before Lights Out'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 176
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 61
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-4th:2An'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 159
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 62
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-5th:Apple Seed'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 167
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 63
FROM playlist p
JOIN song s
  ON s.title = 'SymphonicSuite [AoT] Part2-6th:ThanksAT'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 64
FROM playlist p
JOIN song s
  ON s.title = 'ERENthe (MOVIEver.)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 385
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 65
FROM playlist p
JOIN song s
  ON s.title = 'Barricades (MOVIEver.)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 66
FROM playlist p
JOIN song s
  ON s.title = 'AoTs3-PF1'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 126
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 67
FROM playlist p
JOIN song s
  ON s.title = 'T-KT'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 175
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 68
FROM playlist p
JOIN song s
  ON s.title = 'A1G'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 201
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 69
FROM playlist p
JOIN song s
  ON s.title = 'AoTs3-PF2'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 70
FROM playlist p
JOIN song s
  ON s.title = 'AoTs3-1000'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 71
FROM playlist p
JOIN song s
  ON s.title = 'tooth-i:'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 72
FROM playlist p
JOIN song s
  ON s.title = 'LEN97n10MAHLE'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 135
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 73
FROM playlist p
JOIN song s
  ON s.title = 'K21 (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 74
FROM playlist p
JOIN song s
  ON s.title = 'Zero Eclipse (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 75
FROM playlist p
JOIN song s
  ON s.title = 'Barricades (MOVIEver. / Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 257
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 76
FROM playlist p
JOIN song s
  ON s.title = 'Call your name Gv (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 77
FROM playlist p
JOIN song s
  ON s.title = 'tæk 0N ttn WMId (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 309
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 78
FROM playlist p
JOIN song s
  ON s.title = 'Before Lights Out (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 174
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 79
FROM playlist p
JOIN song s
  ON s.title = 'Apple Seed (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 167
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 80
FROM playlist p
JOIN song s
  ON s.title = 'Ashes on The Fire'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 81
FROM playlist p
JOIN song s
  ON s.title = 'The Other Side of the Sea'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 82
FROM playlist p
JOIN song s
  ON s.title = 'Splinter Wolf'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 322
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 83
FROM playlist p
JOIN song s
  ON s.title = 'Nightmare'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 84
FROM playlist p
JOIN song s
  ON s.title = 'Guilty Hero'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 85
FROM playlist p
JOIN song s
  ON s.title = 'The Successor'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 86
FROM playlist p
JOIN song s
  ON s.title = 'Memory Lane'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 87
FROM playlist p
JOIN song s
  ON s.title = 'Liberio at Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 177
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 88
FROM playlist p
JOIN song s
  ON s.title = 'Liberio Festival'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 89
FROM playlist p
JOIN song s
  ON s.title = 'True History'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 321
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 90
FROM playlist p
JOIN song s
  ON s.title = 'The Warriors'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 91
FROM playlist p
JOIN song s
  ON s.title = 'The Fall of Marley'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 92
FROM playlist p
JOIN song s
  ON s.title = 'Zeek''s Plan'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 93
FROM playlist p
JOIN song s
  ON s.title = 'Nowhere to go'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 186
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 94
FROM playlist p
JOIN song s
  ON s.title = 'Atonement'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 95
FROM playlist p
JOIN song s
  ON s.title = 'Cold Light'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 96
FROM playlist p
JOIN song s
  ON s.title = 'The Reason'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 97
FROM playlist p
JOIN song s
  ON s.title = 'Friendships'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 225
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 98
FROM playlist p
JOIN song s
  ON s.title = 'Memory Lane Vln ver.'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 99
FROM playlist p
JOIN song s
  ON s.title = 'Liberio at Night Pf & Vln ver.'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 178
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 100
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s1'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 478
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 101
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s2'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 102
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s3'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 103
FROM playlist p
JOIN song s
  ON s.title = 'Ashes on The Fire'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 104
FROM playlist p
JOIN song s
  ON s.title = 'The Other Side of the Sea'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 105
FROM playlist p
JOIN song s
  ON s.title = 'Splinter Wolf'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 323
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 106
FROM playlist p
JOIN song s
  ON s.title = 'Nightmare'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 107
FROM playlist p
JOIN song s
  ON s.title = 'Guilty Hero'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 108
FROM playlist p
JOIN song s
  ON s.title = 'The Successor'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 251
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 109
FROM playlist p
JOIN song s
  ON s.title = 'Memory Lane'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 110
FROM playlist p
JOIN song s
  ON s.title = 'Liberio at Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 177
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 111
FROM playlist p
JOIN song s
  ON s.title = 'Liberio Festival'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 112
FROM playlist p
JOIN song s
  ON s.title = 'True History'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 321
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 113
FROM playlist p
JOIN song s
  ON s.title = 'The Warriors'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 114
FROM playlist p
JOIN song s
  ON s.title = 'The Fall of Marley'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 115
FROM playlist p
JOIN song s
  ON s.title = 'Zeek''s Plan'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 116
FROM playlist p
JOIN song s
  ON s.title = 'Cold Light'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 216
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 117
FROM playlist p
JOIN song s
  ON s.title = 'Nowhere to go'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 190
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 118
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s1'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 478
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 119
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s2'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 120
FROM playlist p
JOIN song s
  ON s.title = 'AOTF-s3'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 121
FROM playlist p
JOIN song s
  ON s.title = 'Footsteps of Doom'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 308
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 122
FROM playlist p
JOIN song s
  ON s.title = 'Into the Night (Acoustic ver.)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 132
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 123
FROM playlist p
JOIN song s
  ON s.title = 'Ashes on The Fire (PTV)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 308
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 124
FROM playlist p
JOIN song s
  ON s.title = 'MAN-Child'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 125
FROM playlist p
JOIN song s
  ON s.title = 'All of The Freedoms'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 126
FROM playlist p
JOIN song s
  ON s.title = 'TRAITOR'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 289
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 127
FROM playlist p
JOIN song s
  ON s.title = 'Night of The End'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 128
FROM playlist p
JOIN song s
  ON s.title = 'From You, 2,000 Years Ago'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 416
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 129
FROM playlist p
JOIN song s
  ON s.title = 'The Global Allied Fleet'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 236
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 130
FROM playlist p
JOIN song s
  ON s.title = 'MICHI'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 285
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 131
FROM playlist p
JOIN song s
  ON s.title = 'THAW'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 259
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 132
FROM playlist p
JOIN song s
  ON s.title = 'Into the Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 133
FROM playlist p
JOIN song s
  ON s.title = 'EL'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 134
FROM playlist p
JOIN song s
  ON s.title = 'YouSee-Power'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 135
FROM playlist p
JOIN song s
  ON s.title = 'tæk 0N ttn (TFSv)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 136
FROM playlist p
JOIN song s
  ON s.title = 'An Ordinary Day'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 345
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 137
FROM playlist p
JOIN song s
  ON s.title = 'Aim of the Fate'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 221
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 138
FROM playlist p
JOIN song s
  ON s.title = 'Liar'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 139
FROM playlist p
JOIN song s
  ON s.title = 't''aek till we are Ashes'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 415
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 140
FROM playlist p
JOIN song s
  ON s.title = 'Vanishment'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 141
FROM playlist p
JOIN song s
  ON s.title = 'The Reason'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 142
FROM playlist p
JOIN song s
  ON s.title = 'Friendships'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 143
FROM playlist p
JOIN song s
  ON s.title = 'Memory Lane (Vln ver.)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 144
FROM playlist p
JOIN song s
  ON s.title = 'Liberio at Night (Pf & Vln ver.)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 178
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 145
FROM playlist p
JOIN song s
  ON s.title = 'Atonement'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 146
FROM playlist p
JOIN song s
  ON s.title = 'Footsteps of Doom'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 147
FROM playlist p
JOIN song s
  ON s.title = 'Into the Night Acoustic ver.'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 132
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 148
FROM playlist p
JOIN song s
  ON s.title = 'Ashes on The Fire -PTV-'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 149
FROM playlist p
JOIN song s
  ON s.title = 'MAN-Child'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 150
FROM playlist p
JOIN song s
  ON s.title = 'All of The Freedoms'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 151
FROM playlist p
JOIN song s
  ON s.title = 'TRAITOR'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 288
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 152
FROM playlist p
JOIN song s
  ON s.title = 'Night of The End'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 153
FROM playlist p
JOIN song s
  ON s.title = 'From You, 2,000 Years Ago'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 416
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 154
FROM playlist p
JOIN song s
  ON s.title = 'The Global Allied Fleet'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 235
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 155
FROM playlist p
JOIN song s
  ON s.title = 'MICHI'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 285
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 156
FROM playlist p
JOIN song s
  ON s.title = 'THAW'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 157
FROM playlist p
JOIN song s
  ON s.title = 'Into the Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KOHTA YAMAMOTO official')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 158
FROM playlist p
JOIN song s
  ON s.title = 'EL'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 159
FROM playlist p
JOIN song s
  ON s.title = 'YouSee-Power'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 160
FROM playlist p
JOIN song s
  ON s.title = 'tæk 0N ttnTFSv'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SawanoHiroyuki[nZk]')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'AOT Soundtrack';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Eric Clapton - Layla (Live at Royal Albert Hall, 1991) (Orchestral Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eric Clapton')
 AND s.duration_seconds = 489
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'Eric Clapton - Wonderful Tonight [Official Live]'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eric Clapton')
 AND s.duration_seconds = 371
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'John Lennon - Imagine - 1971'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'luciano pinto')
 AND s.duration_seconds = 195
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'Lynyrd Skynyrd - Simple Man - Live At The Florida Theatre / 2015'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Lynyrd Skynyrd')
 AND s.duration_seconds = 434
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'Freddie Mercury - Love Me Like There''s No Tomorrow (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury Solo')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'Steven Tyler, Slash, and Train ''Dream On'' at the Howard Stern Birthday Bash (2014)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Steven Tyler, Slash & Train')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'Queen - Somebody To Love (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 310
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'Queen - I Was Born To Love You (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 296
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'I Was Made For Lovin'' You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'KISS')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Fortunate Son'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Creedence Clearwater Revival')
 AND s.duration_seconds = 141
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Queen - Too Much Love Will Kill You (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Queen - I Want To Break Free ( Live At Wembley 1986 )'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants to Live Forever (Live at Wembley 11-07-1986)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 327
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'The Rolling Stones - Paint It, Black (Official Lyric Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The Rolling Stones')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - Livin'' On A Prayer'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - It''s My Life (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 267
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'The Police - Every Breath You Take (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The Police')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Alphaville - Forever Young (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Alphaville')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'Africa'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Toto')
 AND s.duration_seconds = 296
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Tears in Heaven'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eric Clapton')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'Starman (2012 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'David Bowie')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'Bad Moon Rising'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Creedence Clearwater Revival')
 AND s.duration_seconds = 142
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'I Don''t Want to Miss a Thing (From "Armageddon" Soundtrack)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Aerosmith')
 AND s.duration_seconds = 299
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'Take Me Home, Country Roads (Original Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'John Denver')
 AND s.duration_seconds = 191
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'Somewhere Only We Know'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Keane')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'Everybody Wants To Rule The World (Single Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Tears For Fears')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'Sweet Caroline'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Neil Diamond')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'She''s Gone'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Steelheart')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 29
FROM playlist p
JOIN song s
  ON s.title = 'Wind Of Change'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 313
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 30
FROM playlist p
JOIN song s
  ON s.title = 'Scorpions - Send Me An Angel'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 31
FROM playlist p
JOIN song s
  ON s.title = 'Still Loving You (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 389
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 32
FROM playlist p
JOIN song s
  ON s.title = 'Hold the Line'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Toto')
 AND s.duration_seconds = 236
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 33
FROM playlist p
JOIN song s
  ON s.title = 'Cocaine'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eric Clapton')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 34
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 35
FROM playlist p
JOIN song s
  ON s.title = 'You & I'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 376
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 36
FROM playlist p
JOIN song s
  ON s.title = 'Beautiful Boy (Darling Boy) (Remastered 2010)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'John Lennon')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 37
FROM playlist p
JOIN song s
  ON s.title = '[I Just] Died In Your Arms'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Cutting Crew')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 38
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 395
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 39
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - You Give Love A Bad Name'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 40
FROM playlist p
JOIN song s
  ON s.title = 'Kansas - Dust in the Wind (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Kansas')
 AND s.duration_seconds = 200
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 41
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - Bed Of Roses (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 403
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 42
FROM playlist p
JOIN song s
  ON s.title = 'Hard to Say I''m Sorry'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Chicago')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 43
FROM playlist p
JOIN song s
  ON s.title = 'Richard Marx - Right Here Waiting (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Richard Marx')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 44
FROM playlist p
JOIN song s
  ON s.title = 'Free Bird'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Lynyrd Skynyrd')
 AND s.duration_seconds = 559
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 45
FROM playlist p
JOIN song s
  ON s.title = 'Europe - Carrie (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 46
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - Never Say Goodbye (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 287
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 47
FROM playlist p
JOIN song s
  ON s.title = 'Firehouse - When I Look Into Your Eyes'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'FireHouse')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 48
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - Always (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 366
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 49
FROM playlist p
JOIN song s
  ON s.title = 'Europe - I''ll Cry For You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 280
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 50
FROM playlist p
JOIN song s
  ON s.title = 'Bryan Adams - (Everything I Do) I Do It For You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bryan Adams')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 51
FROM playlist p
JOIN song s
  ON s.title = 'Bon Jovi - I''ll Be There For You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 345
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 52
FROM playlist p
JOIN song s
  ON s.title = 'Firehouse - Love Of A Lifetime'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'FireHouse')
 AND s.duration_seconds = 288
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 53
FROM playlist p
JOIN song s
  ON s.title = 'Scorpions - No One Like You (Official Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 235
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 54
FROM playlist p
JOIN song s
  ON s.title = 'Air Supply - Making Love Out Of Nothing At All (Official HD Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Air Supply')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 55
FROM playlist p
JOIN song s
  ON s.title = 'The Winner Takes It All'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'ABBA')
 AND s.duration_seconds = 295
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 56
FROM playlist p
JOIN song s
  ON s.title = 'Back In Black'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'AC/DC')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 57
FROM playlist p
JOIN song s
  ON s.title = 'Wanted Dead Or Alive'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 309
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 58
FROM playlist p
JOIN song s
  ON s.title = 'Hotel California (2013 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eagles')
 AND s.duration_seconds = 392
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 59
FROM playlist p
JOIN song s
  ON s.title = 'When the Smoke Is Going Down (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 60
FROM playlist p
JOIN song s
  ON s.title = 'The Final Countdown'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 61
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 62
FROM playlist p
JOIN song s
  ON s.title = 'Follow Your Heart'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 63
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 64
FROM playlist p
JOIN song s
  ON s.title = 'Believe in Love (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 324
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 65
FROM playlist p
JOIN song s
  ON s.title = 'Woman (Remastered 2010)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'John Lennon')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 66
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 67
FROM playlist p
JOIN song s
  ON s.title = 'I Want to Know What Love Is (1999 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Foreigner')
 AND s.duration_seconds = 305
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 68
FROM playlist p
JOIN song s
  ON s.title = 'Thunderstruck'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'AC/DC')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 69
FROM playlist p
JOIN song s
  ON s.title = 'This Ain''t A Love Song'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 70
FROM playlist p
JOIN song s
  ON s.title = 'I Will Always Love You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Whitney Houston')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 71
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 180
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 72
FROM playlist p
JOIN song s
  ON s.title = 'Piano Man'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Billy Joel')
 AND s.duration_seconds = 339
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 73
FROM playlist p
JOIN song s
  ON s.title = 'Innuendo (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 394
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 74
FROM playlist p
JOIN song s
  ON s.title = 'Open Your Heart'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 244
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 75
FROM playlist p
JOIN song s
  ON s.title = 'In the End'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Linkin Park')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 76
FROM playlist p
JOIN song s
  ON s.title = 'Prisoners In Paradise'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 337
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 77
FROM playlist p
JOIN song s
  ON s.title = 'Superstitious'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 78
FROM playlist p
JOIN song s
  ON s.title = 'Let the Good Times Rock'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 245
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 79
FROM playlist p
JOIN song s
  ON s.title = 'T.N.T.'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'AC/DC')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 80
FROM playlist p
JOIN song s
  ON s.title = 'Knockin'' On Heaven''s Door'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Guns N'' Roses')
 AND s.duration_seconds = 336
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 81
FROM playlist p
JOIN song s
  ON s.title = 'Stand By Me (Ultimate Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'John Lennon')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 82
FROM playlist p
JOIN song s
  ON s.title = 'Still Loving You (Live at Taratata, April 28th 1996)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 379
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 83
FROM playlist p
JOIN song s
  ON s.title = 'Seven Nation Army'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The White Stripes')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 84
FROM playlist p
JOIN song s
  ON s.title = 'Careless Whisper'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'George Michael')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 85
FROM playlist p
JOIN song s
  ON s.title = 'Sweet Dreams (Are Made of This)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eurythmics')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 86
FROM playlist p
JOIN song s
  ON s.title = 'I''ll Never Let You Go'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Steelheart')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 87
FROM playlist p
JOIN song s
  ON s.title = 'Eye of the Tiger'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Survivor')
 AND s.duration_seconds = 244
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 88
FROM playlist p
JOIN song s
  ON s.title = 'More Than Meets the Eye'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 201
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 89
FROM playlist p
JOIN song s
  ON s.title = 'Paul McCartney, Eric Clapton - While My Guitar Gently Weeps (Taken from Concert For George)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Paul McCartney & Eric Clapton')
 AND s.duration_seconds = 362
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 90
FROM playlist p
JOIN song s
  ON s.title = 'X Japan   Tears with Lyrics Full Song Fan'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 469
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 91
FROM playlist p
JOIN song s
  ON s.title = 'Soldier Of Fortune (2009 Digital Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Deep Purple')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 92
FROM playlist p
JOIN song s
  ON s.title = 'Misirlou Pulp Fiction Theme'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Dick Dale')
 AND s.duration_seconds = 134
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 93
FROM playlist p
JOIN song s
  ON s.title = 'Bryan Adams - Heaven (Official Music Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bryan Adams')
 AND s.duration_seconds = 241
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 94
FROM playlist p
JOIN song s
  ON s.title = 'Jewel'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Marty Friedman')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 95
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 96
FROM playlist p
JOIN song s
  ON s.title = 'Queen & David Bowie - Under Pressure  live [1981] sounds better'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen & David Bowie')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 97
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 296
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 98
FROM playlist p
JOIN song s
  ON s.title = 'Angel'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 99
FROM playlist p
JOIN song s
  ON s.title = 'Lady Starlight (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 377
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 100
FROM playlist p
JOIN song s
  ON s.title = 'Love Me Like There''s No Tomorrow (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury Solo')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 101
FROM playlist p
JOIN song s
  ON s.title = 'Wonderful Tonight'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Eric Clapton')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 102
FROM playlist p
JOIN song s
  ON s.title = 'Happy Together'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The Turtles')
 AND s.duration_seconds = 177
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 103
FROM playlist p
JOIN song s
  ON s.title = 'Stand by Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Ben E. King')
 AND s.duration_seconds = 174
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 104
FROM playlist p
JOIN song s
  ON s.title = 'More Than Words'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Extreme')
 AND s.duration_seconds = 334
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 105
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 273
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 106
FROM playlist p
JOIN song s
  ON s.title = 'Dust in the Wind'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Kansas')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 107
FROM playlist p
JOIN song s
  ON s.title = 'Rock the Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 248
WHERE p.playlist_name = 'My Mix Rock';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Free Bird'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Lynyrd Skynyrd')
 AND s.duration_seconds = 559
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'She''s Gone'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Steelheart')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'Imagine (Remastered 2010)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'John Lennon')
 AND s.duration_seconds = 188
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'Soldier Of Fortune (2009 Digital Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Deep Purple')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'Forget-Me-Not'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yutaka Ozaki')
 AND s.duration_seconds = 315
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Brian May')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'A World Where the Sun Never Rises'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Aimer')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'Miracle'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'When the Smoke Is Going Down (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Mary On A Cross'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Ghost')
 AND s.duration_seconds = 245
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'The Winner Takes It All'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'ABBA')
 AND s.duration_seconds = 295
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Dream On'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Aerosmith')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 519
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'Knockin'' On Heaven''s Door'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Guns N'' Roses')
 AND s.duration_seconds = 336
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'How It Happened'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'David Buckley')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'Grand Escape (Movie Edit) (feat. Toko Miura)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'RADWIMPS')
 AND s.duration_seconds = 189
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'I Wanna Be Yours'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Arctic Monkeys')
 AND s.duration_seconds = 184
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Self Love (Spider-Man: Across the Spider-Verse)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Metro Boomin')
 AND s.duration_seconds = 190
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'The Rumbling'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'SiM')
 AND s.duration_seconds = 221
WHERE p.playlist_name = 'My Quick Picks';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (2011 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'Doing All Right (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'Great King Rat (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'My Fairy King (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'Liar (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 384
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'The Night Comes Down (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'Modern Times Rock ''n'' Roll (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 109
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 200
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'Jesus (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 225
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 77
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 356
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 216
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 180
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'Fat Bottomed Girls (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'Bicycle Race (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 181
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Stop Me Now (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Save Me (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 164
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 297
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 254
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'Good Old-Fashioned Lover Boy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 174
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'Play The Game (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'Flash (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 168
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 168
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 122
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'Death On Two Legs (Dedicated To...) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 224
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 29
FROM playlist p
JOIN song s
  ON s.title = 'Lazing On A Sunday Afternoon (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 68
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 30
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 185
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 31
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 32
FROM playlist p
JOIN song s
  ON s.title = '''39 (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 33
FROM playlist p
JOIN song s
  ON s.title = 'Sweet Lady (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 34
FROM playlist p
JOIN song s
  ON s.title = 'Seaside Rendezvous (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 135
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 35
FROM playlist p
JOIN song s
  ON s.title = 'The Prophet''s Song (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 501
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 36
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 37
FROM playlist p
JOIN song s
  ON s.title = 'Good Company (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 38
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 355
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 39
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 76
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 40
FROM playlist p
JOIN song s
  ON s.title = 'Staying Power (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 41
FROM playlist p
JOIN song s
  ON s.title = 'Dancer (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 42
FROM playlist p
JOIN song s
  ON s.title = 'Back Chat (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 43
FROM playlist p
JOIN song s
  ON s.title = 'Body Language (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 44
FROM playlist p
JOIN song s
  ON s.title = 'Action This Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 45
FROM playlist p
JOIN song s
  ON s.title = 'Put Out The Fire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 46
FROM playlist p
JOIN song s
  ON s.title = 'Life Is Real (Song For Lennon) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 47
FROM playlist p
JOIN song s
  ON s.title = 'Calling All Girls (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 48
FROM playlist p
JOIN song s
  ON s.title = 'Las Palabras De Amor (The Words Of Love) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 49
FROM playlist p
JOIN song s
  ON s.title = 'Cool Cat (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 50
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 51
FROM playlist p
JOIN song s
  ON s.title = 'Calling All Girls (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 52
FROM playlist p
JOIN song s
  ON s.title = 'The Night Comes Down (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 262
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 53
FROM playlist p
JOIN song s
  ON s.title = 'Funny How Love Is (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 170
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 54
FROM playlist p
JOIN song s
  ON s.title = '''39 (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 55
FROM playlist p
JOIN song s
  ON s.title = 'Who Needs You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 56
FROM playlist p
JOIN song s
  ON s.title = 'Some Day One Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 57
FROM playlist p
JOIN song s
  ON s.title = 'Misfire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 110
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 58
FROM playlist p
JOIN song s
  ON s.title = 'She Makes Me (Stormtrooper In Stilettos) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 59
FROM playlist p
JOIN song s
  ON s.title = 'Is This The World We Created...? (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 135
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 60
FROM playlist p
JOIN song s
  ON s.title = 'Leaving Home Ain''t Easy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 196
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 61
FROM playlist p
JOIN song s
  ON s.title = 'Procession (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 74
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 62
FROM playlist p
JOIN song s
  ON s.title = 'Father To Son (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 374
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 63
FROM playlist p
JOIN song s
  ON s.title = 'White Queen (As It Began) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 64
FROM playlist p
JOIN song s
  ON s.title = 'Some Day One Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 65
FROM playlist p
JOIN song s
  ON s.title = 'The Loser In The End (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 66
FROM playlist p
JOIN song s
  ON s.title = 'Ogre Battle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 67
FROM playlist p
JOIN song s
  ON s.title = 'The Fairy Feller''s Master-Stroke (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 161
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 68
FROM playlist p
JOIN song s
  ON s.title = 'Nevermore (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 79
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 69
FROM playlist p
JOIN song s
  ON s.title = 'The March Of The Black Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 70
FROM playlist p
JOIN song s
  ON s.title = 'Funny How Love Is (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 170
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 71
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 72
FROM playlist p
JOIN song s
  ON s.title = 'Reaching Out (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 69
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 73
FROM playlist p
JOIN song s
  ON s.title = 'I Want To Break Free (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 74
FROM playlist p
JOIN song s
  ON s.title = 'Tie Your Mother Down (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 75
FROM playlist p
JOIN song s
  ON s.title = 'Fat Bottomed Girls (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 76
FROM playlist p
JOIN song s
  ON s.title = 'Wishing Well (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 77
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 78
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 79
FROM playlist p
JOIN song s
  ON s.title = 'Say It''s Not True (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 80
FROM playlist p
JOIN song s
  ON s.title = '''39 (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 81
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 312
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 82
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 406
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 83
FROM playlist p
JOIN song s
  ON s.title = 'Feel Like Makin'' Love (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 381
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 84
FROM playlist p
JOIN song s
  ON s.title = 'Let There Be Drums (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 85
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 86
FROM playlist p
JOIN song s
  ON s.title = 'Guitar Solo (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 420
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 87
FROM playlist p
JOIN song s
  ON s.title = 'Last Horizon (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 285
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 88
FROM playlist p
JOIN song s
  ON s.title = 'These Are The Days Of Our Lives (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 89
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 360
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 90
FROM playlist p
JOIN song s
  ON s.title = 'Can''t Get Enough (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 91
FROM playlist p
JOIN song s
  ON s.title = 'A Kind Of Magic (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 368
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 92
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 310
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 93
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 379
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 94
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 95
FROM playlist p
JOIN song s
  ON s.title = 'All Right Now (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 415
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 96
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 156
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 97
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 98
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live In Sheffield / 2005)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 97
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 99
FROM playlist p
JOIN song s
  ON s.title = 'Ogre Battle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 100
FROM playlist p
JOIN song s
  ON s.title = 'Stone Cold Crazy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 137
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 101
FROM playlist p
JOIN song s
  ON s.title = 'The Hitman (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 297
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 102
FROM playlist p
JOIN song s
  ON s.title = 'Sheer Heart Attack (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 103
FROM playlist p
JOIN song s
  ON s.title = 'Princes Of The Universe (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 104
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 105
FROM playlist p
JOIN song s
  ON s.title = 'Dead On Time (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 106
FROM playlist p
JOIN song s
  ON s.title = 'Liar (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 387
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 107
FROM playlist p
JOIN song s
  ON s.title = 'White Man (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 299
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 108
FROM playlist p
JOIN song s
  ON s.title = 'Headlong (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 109
FROM playlist p
JOIN song s
  ON s.title = 'Innuendo (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 394
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 110
FROM playlist p
JOIN song s
  ON s.title = 'I''m Going Slightly Mad (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 111
FROM playlist p
JOIN song s
  ON s.title = 'Headlong (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 112
FROM playlist p
JOIN song s
  ON s.title = 'I Can''t Live With You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 113
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Try So Hard (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 114
FROM playlist p
JOIN song s
  ON s.title = 'Ride The Wild Wind (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 115
FROM playlist p
JOIN song s
  ON s.title = 'All God''s People (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 262
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 116
FROM playlist p
JOIN song s
  ON s.title = 'These Are The Days Of Our Lives (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 117
FROM playlist p
JOIN song s
  ON s.title = 'Delilah (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 118
FROM playlist p
JOIN song s
  ON s.title = 'The Hitman (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 297
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 119
FROM playlist p
JOIN song s
  ON s.title = 'Bijou (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 120
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 121
FROM playlist p
JOIN song s
  ON s.title = 'Procession (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 78
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 122
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 123
FROM playlist p
JOIN song s
  ON s.title = 'Ogre Battle (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 331
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 124
FROM playlist p
JOIN song s
  ON s.title = 'Father To Son (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 355
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 125
FROM playlist p
JOIN song s
  ON s.title = 'White Queen (As It Began) (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 334
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 126
FROM playlist p
JOIN song s
  ON s.title = 'Flick Of The Wrist (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 127
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 198
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 128
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 86
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 129
FROM playlist p
JOIN song s
  ON s.title = 'The March Of The Black Queen (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 96
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 130
FROM playlist p
JOIN song s
  ON s.title = 'Bring Back That Leroy Brown (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 101
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 131
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 225
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 132
FROM playlist p
JOIN song s
  ON s.title = 'Guitar Solo (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 133
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter (Reprise) (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 135
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 134
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 143
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 135
FROM playlist p
JOIN song s
  ON s.title = 'Drum Solo (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 52
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 136
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (Reprise) (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 85
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 137
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 138
FROM playlist p
JOIN song s
  ON s.title = 'Stone Cold Crazy (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 160
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 139
FROM playlist p
JOIN song s
  ON s.title = 'Liar (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 520
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 140
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods...Revisited (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 141
FROM playlist p
JOIN song s
  ON s.title = 'Big Spender (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 92
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 142
FROM playlist p
JOIN song s
  ON s.title = 'Modern Times Rock ''n'' Roll (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 192
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 143
FROM playlist p
JOIN song s
  ON s.title = 'Jailhouse Rock (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 248
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 144
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live At The Rainbow, London / November 1974)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 77
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 145
FROM playlist p
JOIN song s
  ON s.title = 'One Vision (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 312
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 146
FROM playlist p
JOIN song s
  ON s.title = 'A Kind Of Magic (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 265
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 147
FROM playlist p
JOIN song s
  ON s.title = 'One Year Of Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 148
FROM playlist p
JOIN song s
  ON s.title = 'Pain Is So Close To Pleasure (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 262
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 149
FROM playlist p
JOIN song s
  ON s.title = 'Friends Will Be Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 150
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 151
FROM playlist p
JOIN song s
  ON s.title = 'Gimme The Prize (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 152
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Lose Your Head (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 153
FROM playlist p
JOIN song s
  ON s.title = 'Princes Of The Universe (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 154
FROM playlist p
JOIN song s
  ON s.title = 'Ogre Battle (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 155
FROM playlist p
JOIN song s
  ON s.title = 'Stone Cold Crazy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 134
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 156
FROM playlist p
JOIN song s
  ON s.title = 'My Fairy King (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 157
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 186
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 158
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (2011 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 159
FROM playlist p
JOIN song s
  ON s.title = 'Long Away (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 160
FROM playlist p
JOIN song s
  ON s.title = 'The Millionaire Waltz (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 295
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 161
FROM playlist p
JOIN song s
  ON s.title = '''39 (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 162
FROM playlist p
JOIN song s
  ON s.title = 'Tenement Funster (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 167
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 163
FROM playlist p
JOIN song s
  ON s.title = 'Flick Of The Wrist (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 198
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 164
FROM playlist p
JOIN song s
  ON s.title = 'Lily Of The Valley (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 106
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 165
FROM playlist p
JOIN song s
  ON s.title = 'Good Company (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 166
FROM playlist p
JOIN song s
  ON s.title = 'The March Of The Black Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 399
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 167
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods... Revisited (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 168
FROM playlist p
JOIN song s
  ON s.title = 'Party (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 144
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 169
FROM playlist p
JOIN song s
  ON s.title = 'Khashoggi''s Ship (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 170
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 303
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 171
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 172
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 173
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 174
FROM playlist p
JOIN song s
  ON s.title = 'Rain Must Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 175
FROM playlist p
JOIN song s
  ON s.title = 'Scandal (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 176
FROM playlist p
JOIN song s
  ON s.title = 'My Baby Does Me (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 177
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 178
FROM playlist p
JOIN song s
  ON s.title = 'Party (Original Take)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 174
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 179
FROM playlist p
JOIN song s
  ON s.title = 'Khashoggi''s Ship (Original Take)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 188
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 180
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Original Take With John''s Ending)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 181
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Original Take)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 376
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 182
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (Early Version With Guide Vocal)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 304
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 183
FROM playlist p
JOIN song s
  ON s.title = 'When Love Breaks Up (Demo)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 104
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 184
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (Real Drums And Bass)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 299
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 185
FROM playlist p
JOIN song s
  ON s.title = 'Rain Must Fall (Demo)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 162
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 186
FROM playlist p
JOIN song s
  ON s.title = 'Scandal (Original Rough Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 280
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 187
FROM playlist p
JOIN song s
  ON s.title = 'My Baby Loves Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 188
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Original Take)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 303
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 189
FROM playlist p
JOIN song s
  ON s.title = 'You Know You Belong To Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 114
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 190
FROM playlist p
JOIN song s
  ON s.title = 'I Guess We''re All Falling Out (Demo)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 191
FROM playlist p
JOIN song s
  ON s.title = 'Dog With A Bone'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 192
FROM playlist p
JOIN song s
  ON s.title = 'Water (Demo)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 112
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 193
FROM playlist p
JOIN song s
  ON s.title = 'Face It Alone'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 248
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 194
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Single Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 195
FROM playlist p
JOIN song s
  ON s.title = 'Hang On In There (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 196
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (12" Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 345
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 197
FROM playlist p
JOIN song s
  ON s.title = 'Stealin'' (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 198
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (12" Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 330
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 199
FROM playlist p
JOIN song s
  ON s.title = 'Hijack My Heart (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 200
FROM playlist p
JOIN song s
  ON s.title = 'Scandal (12" Mix (Album Version))'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 396
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 201
FROM playlist p
JOIN song s
  ON s.title = 'My Life Has Been Saved (1989 B-Side Version / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 197
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 202
FROM playlist p
JOIN song s
  ON s.title = 'Stone Cold Crazy (Live At The Rainbow, London / ''74 / B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 131
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 203
FROM playlist p
JOIN song s
  ON s.title = 'My Melancholy Blues (Live In Houston, Texas / 1977 / B-Side Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 204
FROM playlist p
JOIN song s
  ON s.title = 'Chinese Torture (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 105
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 205
FROM playlist p
JOIN song s
  ON s.title = 'Party (Instrumental)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 144
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 206
FROM playlist p
JOIN song s
  ON s.title = 'Khashoggi''s Ship (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 207
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 303
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 208
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 209
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 210
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 211
FROM playlist p
JOIN song s
  ON s.title = 'Rain Must Fall (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 212
FROM playlist p
JOIN song s
  ON s.title = 'Scandal (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 213
FROM playlist p
JOIN song s
  ON s.title = 'My Baby Does Me (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 214
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Backing Track)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 345
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 215
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 216
FROM playlist p
JOIN song s
  ON s.title = 'Ogre Battle (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 320
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 217
FROM playlist p
JOIN song s
  ON s.title = 'White Queen (As It Began) (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 331
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 218
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 149
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 219
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 129
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 220
FROM playlist p
JOIN song s
  ON s.title = 'The March of the Black Queen (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 91
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 221
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Reprise / Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 63
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 222
FROM playlist p
JOIN song s
  ON s.title = 'Bring Back That Leroy Brown (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 93
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 223
FROM playlist p
JOIN song s
  ON s.title = 'Brighton Rock (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 144
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 224
FROM playlist p
JOIN song s
  ON s.title = 'Guitar Solo (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 398
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 225
FROM playlist p
JOIN song s
  ON s.title = 'Son and Daughter (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 105
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 226
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 273
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 227
FROM playlist p
JOIN song s
  ON s.title = 'Liar (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 526
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 228
FROM playlist p
JOIN song s
  ON s.title = 'In the Lap of the Gods... Revisited (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 324
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 229
FROM playlist p
JOIN song s
  ON s.title = 'Big Spender (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 84
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 230
FROM playlist p
JOIN song s
  ON s.title = 'Jailhouse Rock Medley (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 561
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 231
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas of Rhye (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 191
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 232
FROM playlist p
JOIN song s
  ON s.title = 'See What a Fool I''ve Been (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 262
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 233
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live At The Hammersmith Odeon, London / 1975)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 83
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 234
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 235
FROM playlist p
JOIN song s
  ON s.title = 'Let Me Entertain You (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 185
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 236
FROM playlist p
JOIN song s
  ON s.title = 'Death On Two Legs (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 237
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 120
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 238
FROM playlist p
JOIN song s
  ON s.title = 'Bicycle Race (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 89
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 239
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 122
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 240
FROM playlist p
JOIN song s
  ON s.title = 'Get Down, Make Love (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 241
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 128
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 242
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 523
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 243
FROM playlist p
JOIN song s
  ON s.title = 'Dreamer''s Ball (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 244
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 300
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 245
FROM playlist p
JOIN song s
  ON s.title = '''39 (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 246
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 247
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Stop Me Now (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 248
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 249
FROM playlist p
JOIN song s
  ON s.title = 'Brighton Rock (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 734
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 250
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 353
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 251
FROM playlist p
JOIN song s
  ON s.title = 'Tie Your Mother Down (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 252
FROM playlist p
JOIN song s
  ON s.title = 'Sheer Heart Attack (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 216
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 253
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 254
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 255
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live, European Tour / 1979)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 93
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 256
FROM playlist p
JOIN song s
  ON s.title = 'Cosmos Rockin'''
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 257
FROM playlist p
JOIN song s
  ON s.title = 'Time To Shine'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 258
FROM playlist p
JOIN song s
  ON s.title = 'Still Burnin'''
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 259
FROM playlist p
JOIN song s
  ON s.title = 'Small'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 280
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 260
FROM playlist p
JOIN song s
  ON s.title = 'Warboys'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 261
FROM playlist p
JOIN song s
  ON s.title = 'We Believe'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 368
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 262
FROM playlist p
JOIN song s
  ON s.title = 'Call Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 179
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 263
FROM playlist p
JOIN song s
  ON s.title = 'Voodoo'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 264
FROM playlist p
JOIN song s
  ON s.title = 'Some Things That Glitter'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 265
FROM playlist p
JOIN song s
  ON s.title = 'C-lebrity'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 266
FROM playlist p
JOIN song s
  ON s.title = 'Through The Night'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 267
FROM playlist p
JOIN song s
  ON s.title = 'Say It''s Not True'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 268
FROM playlist p
JOIN song s
  ON s.title = 'Surf''s Up...School''s Out'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 356
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 269
FROM playlist p
JOIN song s
  ON s.title = 'small reprise'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 126
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 270
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 141
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 271
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 272
FROM playlist p
JOIN song s
  ON s.title = 'Ay-Ohs (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 66
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 273
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 294
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 274
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 244
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 275
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 150
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 276
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Live At Fire Fight Australia, ANZ Stadium, Sydney, Australia, 2020)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 277
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 277
FROM playlist p
JOIN song s
  ON s.title = 'Mustapha (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 278
FROM playlist p
JOIN song s
  ON s.title = 'Sheer Heart Attack (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 279
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 280
FROM playlist p
JOIN song s
  ON s.title = 'Sleeping On The Sidewalk (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 188
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 281
FROM playlist p
JOIN song s
  ON s.title = 'It''s Late (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 388
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 282
FROM playlist p
JOIN song s
  ON s.title = 'Rock It (Prime Jive) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 283
FROM playlist p
JOIN song s
  ON s.title = 'Dead On Time (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 284
FROM playlist p
JOIN song s
  ON s.title = 'Sail Away Sweet Sister (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 285
FROM playlist p
JOIN song s
  ON s.title = 'Dragon Attack (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 259
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 286
FROM playlist p
JOIN song s
  ON s.title = 'Action This Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 287
FROM playlist p
JOIN song s
  ON s.title = 'Put Out The Fire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 288
FROM playlist p
JOIN song s
  ON s.title = 'Staying Power (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 289
FROM playlist p
JOIN song s
  ON s.title = 'Jealousy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 194
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 290
FROM playlist p
JOIN song s
  ON s.title = 'Battle Theme (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 141
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 291
FROM playlist p
JOIN song s
  ON s.title = 'A Kind Of Magic (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 292
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 237
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 293
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 344
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 294
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 295
FROM playlist p
JOIN song s
  ON s.title = 'I Want To Break Free (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 296
FROM playlist p
JOIN song s
  ON s.title = 'Innuendo (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 389
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 297
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Hard Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 298
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 299
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 296
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 300
FROM playlist p
JOIN song s
  ON s.title = 'Headlong (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 301
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 295
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 302
FROM playlist p
JOIN song s
  ON s.title = 'I''m Going Slightly Mad (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 303
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 304
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 305
FROM playlist p
JOIN song s
  ON s.title = 'Friends Will Be Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 306
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 307
FROM playlist p
JOIN song s
  ON s.title = 'One Vision (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 308
FROM playlist p
JOIN song s
  ON s.title = 'Intro (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 120
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 309
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Fast) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 310
FROM playlist p
JOIN song s
  ON s.title = 'Let Me Entertain You (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 311
FROM playlist p
JOIN song s
  ON s.title = 'Play The Game (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 312
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 474
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 313
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 120
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 314
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 124
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 315
FROM playlist p
JOIN song s
  ON s.title = 'Get Down, Make Love (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 316
FROM playlist p
JOIN song s
  ON s.title = 'Save Me (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 317
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 332
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 318
FROM playlist p
JOIN song s
  ON s.title = 'Dragon Attack (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 192
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 319
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Reprise) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 114
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 320
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 237
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 321
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 322
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 323
FROM playlist p
JOIN song s
  ON s.title = 'Drum And Tympani Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 181
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 324
FROM playlist p
JOIN song s
  ON s.title = 'Guitar Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 312
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 325
FROM playlist p
JOIN song s
  ON s.title = 'Flash (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 132
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 326
FROM playlist p
JOIN song s
  ON s.title = 'The Hero (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 112
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 327
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 328
FROM playlist p
JOIN song s
  ON s.title = 'Jailhouse Rock (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 153
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 329
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 329
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 330
FROM playlist p
JOIN song s
  ON s.title = 'Tie Your Mother Down (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 331
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 241
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 332
FROM playlist p
JOIN song s
  ON s.title = 'Sheer Heart Attack (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 234
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 333
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 130
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 334
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 335
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 88
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 336
FROM playlist p
JOIN song s
  ON s.title = 'Hang On In There (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 337
FROM playlist p
JOIN song s
  ON s.title = 'See What A Fool I''ve Been (B-Side Version / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 338
FROM playlist p
JOIN song s
  ON s.title = 'A Human Body (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 339
FROM playlist p
JOIN song s
  ON s.title = 'Hijack My Heart (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 340
FROM playlist p
JOIN song s
  ON s.title = 'Soul Brother (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 341
FROM playlist p
JOIN song s
  ON s.title = 'Rock In Rio Blues (Live / B-Side / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 342
FROM playlist p
JOIN song s
  ON s.title = 'My Life Has Been Saved (1989 B-Side Version / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 197
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 343
FROM playlist p
JOIN song s
  ON s.title = 'I Go Crazy (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 224
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 344
FROM playlist p
JOIN song s
  ON s.title = 'Stealin'' (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 345
FROM playlist p
JOIN song s
  ON s.title = 'Forever (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 346
FROM playlist p
JOIN song s
  ON s.title = 'Lost Opportunity (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 347
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Beautiful Day (B-Side Version / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 239
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 348
FROM playlist p
JOIN song s
  ON s.title = 'Mustapha (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 349
FROM playlist p
JOIN song s
  ON s.title = 'Fat Bottomed Girls (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 350
FROM playlist p
JOIN song s
  ON s.title = 'Jealousy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 194
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 351
FROM playlist p
JOIN song s
  ON s.title = 'Bicycle Race (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 181
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 352
FROM playlist p
JOIN song s
  ON s.title = 'If You Can''t Beat Them (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 353
FROM playlist p
JOIN song s
  ON s.title = 'Let Me Entertain You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 354
FROM playlist p
JOIN song s
  ON s.title = 'Dead On Time (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 355
FROM playlist p
JOIN song s
  ON s.title = 'In Only Seven Days (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 150
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 356
FROM playlist p
JOIN song s
  ON s.title = 'Dreamer''s Ball (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 357
FROM playlist p
JOIN song s
  ON s.title = 'Fun It (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 358
FROM playlist p
JOIN song s
  ON s.title = 'Leaving Home Ain''t Easy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 196
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 359
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Stop Me Now (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 360
FROM playlist p
JOIN song s
  ON s.title = 'More Of That Jazz (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 257
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 361
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 362
FROM playlist p
JOIN song s
  ON s.title = 'Doing All Right (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 251
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 363
FROM playlist p
JOIN song s
  ON s.title = 'Great King Rat (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 364
FROM playlist p
JOIN song s
  ON s.title = 'Mad The Swine (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 201
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 365
FROM playlist p
JOIN song s
  ON s.title = 'My Fairy King (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 366
FROM playlist p
JOIN song s
  ON s.title = 'Liar (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 387
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 367
FROM playlist p
JOIN song s
  ON s.title = 'The Night Comes Down (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 262
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 368
FROM playlist p
JOIN song s
  ON s.title = 'Modern Times Rock ''n'' Roll (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 109
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 369
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 370
FROM playlist p
JOIN song s
  ON s.title = 'Jesus (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 371
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 80
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 372
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 349
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 373
FROM playlist p
JOIN song s
  ON s.title = 'Tear It Up (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 374
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Hard Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 375
FROM playlist p
JOIN song s
  ON s.title = 'Man On The Prowl (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 376
FROM playlist p
JOIN song s
  ON s.title = 'Machines (or ''Back To Humans'') (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 308
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 377
FROM playlist p
JOIN song s
  ON s.title = 'I Want To Break Free (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 378
FROM playlist p
JOIN song s
  ON s.title = 'Keep Passing The Open Windows (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 322
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 379
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 380
FROM playlist p
JOIN song s
  ON s.title = 'Is This The World We Created...? (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 135
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 381
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 327
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 382
FROM playlist p
JOIN song s
  ON s.title = 'Machines (or ''Back To Humans'') (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 308
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 383
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Try So Hard (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 221
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 384
FROM playlist p
JOIN song s
  ON s.title = 'Tear It Up (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 385
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 291
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 386
FROM playlist p
JOIN song s
  ON s.title = 'A Winter''s Tale (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 387
FROM playlist p
JOIN song s
  ON s.title = 'Ride The Wild Wind (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 284
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 388
FROM playlist p
JOIN song s
  ON s.title = 'Bijou (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 389
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 390
FROM playlist p
JOIN song s
  ON s.title = 'One Year Of Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 391
FROM playlist p
JOIN song s
  ON s.title = 'Khashoggi''s Ship (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 173
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 392
FROM playlist p
JOIN song s
  ON s.title = 'Is This The World We Created...? (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 133
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 393
FROM playlist p
JOIN song s
  ON s.title = 'The Hitman (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 297
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 394
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Beautiful Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 395
FROM playlist p
JOIN song s
  ON s.title = 'Mother Love (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 289
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 396
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 397
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Stop Me Now (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 398
FROM playlist p
JOIN song s
  ON s.title = 'Teo Torriatte (Let Us Cling Together) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 355
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 399
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 400
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 401
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 273
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 402
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 356
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 403
FROM playlist p
JOIN song s
  ON s.title = '''39 (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 404
FROM playlist p
JOIN song s
  ON s.title = 'The March Of The Black Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 401
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 405
FROM playlist p
JOIN song s
  ON s.title = 'Good Old-Fashioned Lover Boy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 175
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 406
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (2011 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 407
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 348
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 408
FROM playlist p
JOIN song s
  ON s.title = 'One Vision (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 338
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 409
FROM playlist p
JOIN song s
  ON s.title = 'Tie Your Mother Down (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 282
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 410
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods... Revisited (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 137
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 411
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 101
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 412
FROM playlist p
JOIN song s
  ON s.title = 'Tear It Up (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 108
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 413
FROM playlist p
JOIN song s
  ON s.title = 'A Kind Of Magic (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 501
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 414
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 230
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 415
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 297
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 416
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 417
FROM playlist p
JOIN song s
  ON s.title = 'I Want To Break Free (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 418
FROM playlist p
JOIN song s
  ON s.title = 'Looks Like It''s Gonna Be A Good Night (Improv / Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 419
FROM playlist p
JOIN song s
  ON s.title = 'Guitar Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 444
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 420
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 361
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 421
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 422
FROM playlist p
JOIN song s
  ON s.title = 'Tavaszi Szel Vizet Araszt (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 136
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 423
FROM playlist p
JOIN song s
  ON s.title = 'Is This The World We Created...? (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 152
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 424
FROM playlist p
JOIN song s
  ON s.title = '(You''re So Square) Baby I Don''t Care (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 89
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 425
FROM playlist p
JOIN song s
  ON s.title = 'Hello Mary Lou (Goodbye Heart) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 144
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 426
FROM playlist p
JOIN song s
  ON s.title = 'Tutti Frutti (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 216
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 427
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 331
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 428
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 429
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 430
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 372
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 431
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 183
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 432
FROM playlist p
JOIN song s
  ON s.title = 'Friends Will Be Friends (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 122
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 433
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 232
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 434
FROM playlist p
JOIN song s
  ON s.title = 'God Save The Queen (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 84
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 435
FROM playlist p
JOIN song s
  ON s.title = 'Let Me In Your Heart Again (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 436
FROM playlist p
JOIN song s
  ON s.title = 'Love Kills (The Ballad)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 437
FROM playlist p
JOIN song s
  ON s.title = 'There Must Be More To Life Than This (William Orbit Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 438
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Hard Life (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 439
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 173
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 440
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 441
FROM playlist p
JOIN song s
  ON s.title = 'Drowse (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 442
FROM playlist p
JOIN song s
  ON s.title = 'Long Away (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 443
FROM playlist p
JOIN song s
  ON s.title = 'Lily Of The Valley (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 100
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 444
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Try So Hard (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 445
FROM playlist p
JOIN song s
  ON s.title = 'Bijou (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 446
FROM playlist p
JOIN song s
  ON s.title = 'These Are The Days Of Our Lives (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 447
FROM playlist p
JOIN song s
  ON s.title = 'Las Palabras De Amor (The Words Of Love) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 448
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 449
FROM playlist p
JOIN song s
  ON s.title = 'A Winter''s Tale (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 450
FROM playlist p
JOIN song s
  ON s.title = 'Play The Game (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 195
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 451
FROM playlist p
JOIN song s
  ON s.title = 'Save Me (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 452
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 453
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 454
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 164
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 455
FROM playlist p
JOIN song s
  ON s.title = 'Innuendo (Digital Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 392
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 456
FROM playlist p
JOIN song s
  ON s.title = 'My Fairy King (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 457
FROM playlist p
JOIN song s
  ON s.title = 'The Prophet''s Song (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 501
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 458
FROM playlist p
JOIN song s
  ON s.title = 'It''s Late (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 388
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 459
FROM playlist p
JOIN song s
  ON s.title = 'Father To Son (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 374
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 460
FROM playlist p
JOIN song s
  ON s.title = 'The March Of The Black Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 399
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 461
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 327
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 462
FROM playlist p
JOIN song s
  ON s.title = 'Great King Rat (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 463
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Digital Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 354
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 464
FROM playlist p
JOIN song s
  ON s.title = 'Brighton Rock (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 465
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 348
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 466
FROM playlist p
JOIN song s
  ON s.title = 'White Queen (As It Began) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 467
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 123
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 468
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 180
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 469
FROM playlist p
JOIN song s
  ON s.title = 'Sheer Heart Attack (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 470
FROM playlist p
JOIN song s
  ON s.title = 'All Dead, All Dead (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 190
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 471
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 472
FROM playlist p
JOIN song s
  ON s.title = 'Fight From The Inside (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 473
FROM playlist p
JOIN song s
  ON s.title = 'Get Down, Make Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 474
FROM playlist p
JOIN song s
  ON s.title = 'Sleeping On The Sidewalk (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 475
FROM playlist p
JOIN song s
  ON s.title = 'Who Needs You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 476
FROM playlist p
JOIN song s
  ON s.title = 'It''s Late (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 387
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 477
FROM playlist p
JOIN song s
  ON s.title = 'My Melancholy Blues (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 478
FROM playlist p
JOIN song s
  ON s.title = 'Party (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 145
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 479
FROM playlist p
JOIN song s
  ON s.title = 'Khashoggi''s Ship (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 168
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 480
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 302
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 481
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 482
FROM playlist p
JOIN song s
  ON s.title = 'The Invisible Man (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 483
FROM playlist p
JOIN song s
  ON s.title = 'Breakthru (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 484
FROM playlist p
JOIN song s
  ON s.title = 'Rain Must Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 485
FROM playlist p
JOIN song s
  ON s.title = 'Scandal (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 486
FROM playlist p
JOIN song s
  ON s.title = 'My Baby Does Me (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 487
FROM playlist p
JOIN song s
  ON s.title = 'Was It All Worth It (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 348
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 488
FROM playlist p
JOIN song s
  ON s.title = 'We Will Rock You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 123
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 489
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 355
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 490
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods... Revisited (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 491
FROM playlist p
JOIN song s
  ON s.title = 'Save Me (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 230
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 492
FROM playlist p
JOIN song s
  ON s.title = 'Fat Bottomed Girls (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 256
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 493
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Stop Me Now (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 494
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 495
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 496
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 497
FROM playlist p
JOIN song s
  ON s.title = 'We Are The Champions (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 498
FROM playlist p
JOIN song s
  ON s.title = 'Brighton Rock (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 499
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 180
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 500
FROM playlist p
JOIN song s
  ON s.title = 'Tenement Funster (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 167
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 501
FROM playlist p
JOIN song s
  ON s.title = 'Flick Of The Wrist (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 198
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 502
FROM playlist p
JOIN song s
  ON s.title = 'Lily Of The Valley (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 105
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 503
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 504
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 203
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 505
FROM playlist p
JOIN song s
  ON s.title = 'Stone Cold Crazy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 134
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 506
FROM playlist p
JOIN song s
  ON s.title = 'Dear Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 68
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 507
FROM playlist p
JOIN song s
  ON s.title = 'Misfire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 110
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 508
FROM playlist p
JOIN song s
  ON s.title = 'Bring Back That Leroy Brown (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 136
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 509
FROM playlist p
JOIN song s
  ON s.title = 'She Makes Me (Stormtrooper In Stilettos) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 510
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods... Revisited (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 511
FROM playlist p
JOIN song s
  ON s.title = 'The Show Must Go On (Live / Theatre National de Chaillot, Paris / 1997)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 512
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Rah Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 513
FROM playlist p
JOIN song s
  ON s.title = 'Barcelona'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 514
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 259
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 515
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (Live At The Freddie Mercury Tribute Concert For AIDS Awareness, Wembley / 1992)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 308
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 516
FROM playlist p
JOIN song s
  ON s.title = 'You Don''t Fool Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 323
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 517
FROM playlist p
JOIN song s
  ON s.title = 'Heaven For Everyone'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 518
FROM playlist p
JOIN song s
  ON s.title = 'Las Palabras De Amor (The Words Of Love)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 270
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 519
FROM playlist p
JOIN song s
  ON s.title = 'Driven By You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Brian May')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 520
FROM playlist p
JOIN song s
  ON s.title = 'Living on My Own (Julian Raymond Album Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 521
FROM playlist p
JOIN song s
  ON s.title = 'Let Me Live'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 522
FROM playlist p
JOIN song s
  ON s.title = 'The Great Pretender'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 523
FROM playlist p
JOIN song s
  ON s.title = 'Princes Of The Universe'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 524
FROM playlist p
JOIN song s
  ON s.title = 'Another One Bites The Dust (Remix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 261
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 525
FROM playlist p
JOIN song s
  ON s.title = 'No One But You (Only The Good Die Young)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 526
FROM playlist p
JOIN song s
  ON s.title = 'These Are The Days Of Our Lives'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 527
FROM playlist p
JOIN song s
  ON s.title = 'Thank God It''s Christmas'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 528
FROM playlist p
JOIN song s
  ON s.title = 'Flash''s Theme (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 529
FROM playlist p
JOIN song s
  ON s.title = 'In The Space Capsule (The Love Theme) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 163
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 530
FROM playlist p
JOIN song s
  ON s.title = 'Ming''s Theme (In The Court Of Ming The Merciless) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 161
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 531
FROM playlist p
JOIN song s
  ON s.title = 'The Ring (Hypnotic Seduction Of Dale) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 58
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 532
FROM playlist p
JOIN song s
  ON s.title = 'Football Fight (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 89
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 533
FROM playlist p
JOIN song s
  ON s.title = 'In The Death Cell (Love Theme Reprise) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 145
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 534
FROM playlist p
JOIN song s
  ON s.title = 'Execution Of Flash (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 66
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 535
FROM playlist p
JOIN song s
  ON s.title = 'The Kiss (Aura Resurrects Flash) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 105
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 536
FROM playlist p
JOIN song s
  ON s.title = 'Arboria (Planet Of The Tree Men) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 102
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 537
FROM playlist p
JOIN song s
  ON s.title = 'Escape From The Swamp (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 104
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 538
FROM playlist p
JOIN song s
  ON s.title = 'Flash To The Rescue (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 164
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 539
FROM playlist p
JOIN song s
  ON s.title = 'Vultan''s Theme (Attack Of The Hawk Men) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 73
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 540
FROM playlist p
JOIN song s
  ON s.title = 'Battle Theme (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 139
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 541
FROM playlist p
JOIN song s
  ON s.title = 'The Wedding March (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 56
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 542
FROM playlist p
JOIN song s
  ON s.title = 'Marriage Of Dale And Ming (And Flash Approaching) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 125
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 543
FROM playlist p
JOIN song s
  ON s.title = 'Crash Dive On Mingo City (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 61
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 544
FROM playlist p
JOIN song s
  ON s.title = 'Flash''s Theme Reprise (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 84
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 545
FROM playlist p
JOIN song s
  ON s.title = 'The Hero (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 546
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 165
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 547
FROM playlist p
JOIN song s
  ON s.title = 'Need Your Loving Tonight (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 170
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 548
FROM playlist p
JOIN song s
  ON s.title = 'Man On The Prowl (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 549
FROM playlist p
JOIN song s
  ON s.title = 'Rock It (Prime Jive) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 274
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 550
FROM playlist p
JOIN song s
  ON s.title = 'Put Out The Fire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 551
FROM playlist p
JOIN song s
  ON s.title = 'I Go Crazy (B-Side)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 224
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 552
FROM playlist p
JOIN song s
  ON s.title = 'Modern Times Rock ''n'' Roll (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 109
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 553
FROM playlist p
JOIN song s
  ON s.title = 'Sleeping On The Sidewalk (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 188
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 554
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Try Suicide (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 555
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 169
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 556
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 557
FROM playlist p
JOIN song s
  ON s.title = 'Sail Away Sweet Sister (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 558
FROM playlist p
JOIN song s
  ON s.title = 'Life Is Real (Song For Lennon) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 212
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 559
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 560
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 561
FROM playlist p
JOIN song s
  ON s.title = 'Jealousy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 194
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 562
FROM playlist p
JOIN song s
  ON s.title = 'Nevermore (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 79
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 563
FROM playlist p
JOIN song s
  ON s.title = 'You Take My Breath Away (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 564
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 565
FROM playlist p
JOIN song s
  ON s.title = 'Las Palabras De Amor (The Words Of Love) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 566
FROM playlist p
JOIN song s
  ON s.title = 'Let Me In Your Heart Again (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 567
FROM playlist p
JOIN song s
  ON s.title = 'Love Kills (The Ballad)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 253
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 568
FROM playlist p
JOIN song s
  ON s.title = 'There Must Be More To Life Than This (William Orbit Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 569
FROM playlist p
JOIN song s
  ON s.title = 'Play The Game (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 195
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 570
FROM playlist p
JOIN song s
  ON s.title = 'Dear Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 69
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 571
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 173
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 572
FROM playlist p
JOIN song s
  ON s.title = 'Love Of My Life (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 573
FROM playlist p
JOIN song s
  ON s.title = 'Drowse (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 574
FROM playlist p
JOIN song s
  ON s.title = 'You Take My Breath Away (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 575
FROM playlist p
JOIN song s
  ON s.title = 'Spread Your Wings (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 576
FROM playlist p
JOIN song s
  ON s.title = 'Long Away (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 577
FROM playlist p
JOIN song s
  ON s.title = 'Lily Of The Valley (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 100
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 578
FROM playlist p
JOIN song s
  ON s.title = 'Don''t Try So Hard (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 579
FROM playlist p
JOIN song s
  ON s.title = 'Bijou (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 217
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 580
FROM playlist p
JOIN song s
  ON s.title = 'These Are The Days Of Our Lives (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 581
FROM playlist p
JOIN song s
  ON s.title = 'Nevermore (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 79
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 582
FROM playlist p
JOIN song s
  ON s.title = 'Las Palabras De Amor (The Words Of Love) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 272
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 583
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 584
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 290
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 585
FROM playlist p
JOIN song s
  ON s.title = 'Somebody To Love (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 586
FROM playlist p
JOIN song s
  ON s.title = 'Crazy Little Thing Called Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 164
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 587
FROM playlist p
JOIN song s
  ON s.title = 'Friends Will Be Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 588
FROM playlist p
JOIN song s
  ON s.title = 'Jealousy (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 194
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 589
FROM playlist p
JOIN song s
  ON s.title = 'One Year Of Love (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 590
FROM playlist p
JOIN song s
  ON s.title = 'A Winter''s Tale (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 591
FROM playlist p
JOIN song s
  ON s.title = '''39 (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 211
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 592
FROM playlist p
JOIN song s
  ON s.title = 'Mother Love (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 288
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 593
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Hard Life (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 594
FROM playlist p
JOIN song s
  ON s.title = 'Save Me (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 595
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 326
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 596
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 261
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 597
FROM playlist p
JOIN song s
  ON s.title = 'Sail Away Sweet Sister (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 214
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 598
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 599
FROM playlist p
JOIN song s
  ON s.title = 'Is This The World We Created...? (2014 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 133
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 600
FROM playlist p
JOIN song s
  ON s.title = 'In The Lap Of The Gods... Revisited (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 601
FROM playlist p
JOIN song s
  ON s.title = 'Forever (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 202
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 602
FROM playlist p
JOIN song s
  ON s.title = 'Hammer To Fall (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 603
FROM playlist p
JOIN song s
  ON s.title = 'One Vision (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 312
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 604
FROM playlist p
JOIN song s
  ON s.title = 'I''m In Love With My Car (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 186
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 605
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive (2024 Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 606
FROM playlist p
JOIN song s
  ON s.title = 'Sweet Lady (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 607
FROM playlist p
JOIN song s
  ON s.title = 'The Loser In The End (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 242
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 608
FROM playlist p
JOIN song s
  ON s.title = 'Tie Your Mother Down (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 288
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 609
FROM playlist p
JOIN song s
  ON s.title = 'Now I''m Here (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 610
FROM playlist p
JOIN song s
  ON s.title = 'Put Out The Fire (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 611
FROM playlist p
JOIN song s
  ON s.title = 'Tear It Up (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 205
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 612
FROM playlist p
JOIN song s
  ON s.title = 'Keep Yourself Alive'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 228
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 613
FROM playlist p
JOIN song s
  ON s.title = 'Doing All Right'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 614
FROM playlist p
JOIN song s
  ON s.title = 'Great King Rat'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 615
FROM playlist p
JOIN song s
  ON s.title = 'My Fairy King'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 254
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 616
FROM playlist p
JOIN song s
  ON s.title = 'Liar'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 386
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 617
FROM playlist p
JOIN song s
  ON s.title = 'The Night Comes Down'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 618
FROM playlist p
JOIN song s
  ON s.title = 'Modern Times Rock ''n'' Roll'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 109
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 619
FROM playlist p
JOIN song s
  ON s.title = 'Son And Daughter'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 620
FROM playlist p
JOIN song s
  ON s.title = 'Jesus'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 225
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 621
FROM playlist p
JOIN song s
  ON s.title = 'Seven Seas Of Rhye'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 77
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 622
FROM playlist p
JOIN song s
  ON s.title = 'Radio Ga Ga (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 349
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 623
FROM playlist p
JOIN song s
  ON s.title = 'I Want To Break Free (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 624
FROM playlist p
JOIN song s
  ON s.title = 'A Kind Of Magic (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 265
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 625
FROM playlist p
JOIN song s
  ON s.title = 'Killer Queen (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 185
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 626
FROM playlist p
JOIN song s
  ON s.title = 'Bicycle Race (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 627
FROM playlist p
JOIN song s
  ON s.title = 'The Miracle (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 302
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 628
FROM playlist p
JOIN song s
  ON s.title = 'Friends Will Be Friends (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 629
FROM playlist p
JOIN song s
  ON s.title = 'Under Pressure (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 249
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 630
FROM playlist p
JOIN song s
  ON s.title = 'Coming Soon (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 631
FROM playlist p
JOIN song s
  ON s.title = 'You''re My Best Friend (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 173
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 632
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Beautiful Day (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 155
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 633
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 325
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 634
FROM playlist p
JOIN song s
  ON s.title = 'Let Me Live (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 635
FROM playlist p
JOIN song s
  ON s.title = 'My Life Has Been Saved (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 196
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 636
FROM playlist p
JOIN song s
  ON s.title = 'Mother Love (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 287
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 637
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 290
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 638
FROM playlist p
JOIN song s
  ON s.title = 'Heaven For Everyone (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 337
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 639
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 640
FROM playlist p
JOIN song s
  ON s.title = 'You Don''t Fool Me (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 325
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 641
FROM playlist p
JOIN song s
  ON s.title = 'A Winter''s Tale (2011 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 231
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 642
FROM playlist p
JOIN song s
  ON s.title = 'It''s A Beautiful Day (Reprise) (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 181
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 643
FROM playlist p
JOIN song s
  ON s.title = 'Yeah (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 5
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 644
FROM playlist p
JOIN song s
  ON s.title = 'Untitled (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 1355
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 645
FROM playlist p
JOIN song s
  ON s.title = 'Let''s Turn It On (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 223
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 646
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 647
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 648
FROM playlist p
JOIN song s
  ON s.title = 'Foolin'' Around (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 210
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 649
FROM playlist p
JOIN song s
  ON s.title = 'Your Kind Of Lover (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 215
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 650
FROM playlist p
JOIN song s
  ON s.title = 'Mr. Bad Guy (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 651
FROM playlist p
JOIN song s
  ON s.title = 'Man Made Paradise (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 250
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 652
FROM playlist p
JOIN song s
  ON s.title = 'There Must Be More To Life Than This (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 182
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 653
FROM playlist p
JOIN song s
  ON s.title = 'Living On My Own (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 204
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 654
FROM playlist p
JOIN song s
  ON s.title = 'My Love Is Dangerous (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 224
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 655
FROM playlist p
JOIN song s
  ON s.title = 'Love Me Like There''s No Tomorrow (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 656
FROM playlist p
JOIN song s
  ON s.title = 'Living on My Own (Single Edit)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 186
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 657
FROM playlist p
JOIN song s
  ON s.title = 'The Great Pretender'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 658
FROM playlist p
JOIN song s
  ON s.title = 'Love Kills'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 659
FROM playlist p
JOIN song s
  ON s.title = 'Barcelona'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 267
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 660
FROM playlist p
JOIN song s
  ON s.title = 'Made in Heaven (Single Remix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 251
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 661
FROM playlist p
JOIN song s
  ON s.title = 'Love Me Like There''s No Tomorrow'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 227
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 662
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born to Love You'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 663
FROM playlist p
JOIN song s
  ON s.title = 'The Golden Boy (Single Edit)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 316
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 664
FROM playlist p
JOIN song s
  ON s.title = 'I Can Hear Music'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Larry Lurex')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 665
FROM playlist p
JOIN song s
  ON s.title = 'How Can I Go On (Single Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 243
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 666
FROM playlist p
JOIN song s
  ON s.title = 'Living On My Own (No More Brothers Radio Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 222
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 667
FROM playlist p
JOIN song s
  ON s.title = 'Goin'' Back'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Larry Lurex')
 AND s.duration_seconds = 213
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 668
FROM playlist p
JOIN song s
  ON s.title = 'Let''s Turn It On'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 224
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 669
FROM playlist p
JOIN song s
  ON s.title = 'My Love Is Dangerous'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 221
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 670
FROM playlist p
JOIN song s
  ON s.title = 'She Blows Hot and Cold'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 220
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 671
FROM playlist p
JOIN song s
  ON s.title = 'Living on My Own (Julian Raymond Album Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 672
FROM playlist p
JOIN song s
  ON s.title = 'Stop All the Fighting'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 201
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 673
FROM playlist p
JOIN song s
  ON s.title = 'Exercises in Free Love (Freddie Vocal)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 241
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 674
FROM playlist p
JOIN song s
  ON s.title = 'Exercises in Free Love (Montserrat Vocal)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Montserrat Caballé')
 AND s.duration_seconds = 245
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 675
FROM playlist p
JOIN song s
  ON s.title = 'The Fallen Priest (B-Side Edit)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 178
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 676
FROM playlist p
JOIN song s
  ON s.title = 'Overture Piccante'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 401
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 677
FROM playlist p
JOIN song s
  ON s.title = 'Love Kills (Wolf Euro Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 208
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 678
FROM playlist p
JOIN song s
  ON s.title = 'Barcelona (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 679
FROM playlist p
JOIN song s
  ON s.title = 'La Japonaise (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 680
FROM playlist p
JOIN song s
  ON s.title = 'The Fallen Priest (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 347
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 681
FROM playlist p
JOIN song s
  ON s.title = 'Ensue''o (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 263
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 682
FROM playlist p
JOIN song s
  ON s.title = 'The Golden Boy (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 364
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 683
FROM playlist p
JOIN song s
  ON s.title = 'Guide Me Home (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 684
FROM playlist p
JOIN song s
  ON s.title = 'How Can I Go On (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 230
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 685
FROM playlist p
JOIN song s
  ON s.title = 'Exercises In Free Love (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 686
FROM playlist p
JOIN song s
  ON s.title = 'Overture Piccante (New Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 403
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 687
FROM playlist p
JOIN song s
  ON s.title = 'The Great Pretender (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 688
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 219
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 689
FROM playlist p
JOIN song s
  ON s.title = 'Barcelona (2012 Orchestrated Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 342
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 690
FROM playlist p
JOIN song s
  ON s.title = 'Love Kills (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 270
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 691
FROM playlist p
JOIN song s
  ON s.title = 'How Can I Go On (2012 Orchestrated Version / Single Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 239
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 692
FROM playlist p
JOIN song s
  ON s.title = 'Love Me Like There''s No Tomorrow (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 693
FROM playlist p
JOIN song s
  ON s.title = 'Living On My Own (No More Brothers Radio Mix)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 218
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 694
FROM playlist p
JOIN song s
  ON s.title = 'The Golden Boy (2012 Orchestrated Version / Single Edit)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 313
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 695
FROM playlist p
JOIN song s
  ON s.title = 'She Blows Hot And Cold (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 206
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 696
FROM playlist p
JOIN song s
  ON s.title = 'Made In Heaven (Special Edition)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Freddie Mercury')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 697
FROM playlist p
JOIN song s
  ON s.title = 'Queen - Nevermore (Official Lyric Video)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 84
WHERE p.playlist_name = 'Queen';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Prologue (World Anthem) (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 156
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'Blue Blood (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 303
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'Week End (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 364
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'Easy Fight Rambling (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 283
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'X (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 362
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 397
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'Kurenai (Intro strings)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 380
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'Xclamation'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 238
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 168
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Celebration (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Rose of Pain (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 711
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Unfinished (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'Kurenai (Long version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 415
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = '20th CENTURY BOY ((Live Take) [Remaster])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 175
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 395
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'X ((Live Version) [Remaster])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 581
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'Week End'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 346
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain (Live Version) (Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 419
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'Silent Jealousy'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 440
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Sadistic Desire'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 364
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'Standing Sex'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 264
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'Joker'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 296
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 521
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'Silent Jealousy ((Live Version) [Remaster])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 470
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'A Piano String in Es Dur'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 114
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'Silent Jealousy'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 439
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'Miscast'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 314
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'Desperate Angel'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 354
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 29
FROM playlist p
JOIN song s
  ON s.title = 'White Wind from Mr. Martin -Pata''s Nap-'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 63
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 30
FROM playlist p
JOIN song s
  ON s.title = 'Voiceless Screaming'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 377
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 31
FROM playlist p
JOIN song s
  ON s.title = 'Stab Me In The Back'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 32
FROM playlist p
JOIN song s
  ON s.title = 'Love Replica'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 33
FROM playlist p
JOIN song s
  ON s.title = 'Joker'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 332
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 34
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 523
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 35
FROM playlist p
JOIN song s
  ON s.title = 'DAHLIA'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 477
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 36
FROM playlist p
JOIN song s
  ON s.title = 'SCARS'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 307
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 37
FROM playlist p
JOIN song s
  ON s.title = 'Longingtogireta melody'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 459
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 38
FROM playlist p
JOIN song s
  ON s.title = 'Rusty Nail'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 328
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 39
FROM playlist p
JOIN song s
  ON s.title = 'WHITE POEM I'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 40
FROM playlist p
JOIN song s
  ON s.title = 'CRUCIFY MY LOVE'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 277
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 41
FROM playlist p
JOIN song s
  ON s.title = 'Tears'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 628
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 42
FROM playlist p
JOIN song s
  ON s.title = 'WRIGGLE'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 86
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 43
FROM playlist p
JOIN song s
  ON s.title = 'DRAIN'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 44
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love (Acoustic Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 474
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 45
FROM playlist p
JOIN song s
  ON s.title = 'La Venus (Acoustic Version - Studio)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 46
FROM playlist p
JOIN song s
  ON s.title = 'Kurenai (Live - from The Last Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 339
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 47
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 519
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 48
FROM playlist p
JOIN song s
  ON s.title = 'Dahlia (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 479
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 49
FROM playlist p
JOIN song s
  ON s.title = 'Crucify My Love (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 273
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 50
FROM playlist p
JOIN song s
  ON s.title = 'Standing Sex (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 51
FROM playlist p
JOIN song s
  ON s.title = 'Tears (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 433
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 52
FROM playlist p
JOIN song s
  ON s.title = 'Longing ~Setsubou no Yoru~ (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 313
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 53
FROM playlist p
JOIN song s
  ON s.title = 'Art of Life (Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 280
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 54
FROM playlist p
JOIN song s
  ON s.title = 'Endless Rain (From The Last Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 427
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 55
FROM playlist p
JOIN song s
  ON s.title = 'X (From The Last Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 396
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 56
FROM playlist p
JOIN song s
  ON s.title = 'Without You (Unplugged - Studio Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 362
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 57
FROM playlist p
JOIN song s
  ON s.title = 'BLUE BLOOD (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 358
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 58
FROM playlist p
JOIN song s
  ON s.title = 'SADISTIC DESIRE (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 442
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 59
FROM playlist p
JOIN song s
  ON s.title = 'Standing Sex (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 512
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 60
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 369
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 61
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI Drum solo (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 62
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI piano solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 246
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 63
FROM playlist p
JOIN song s
  ON s.title = 'ART OF LIFE (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 64
FROM playlist p
JOIN song s
  ON s.title = 'JOKER (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 65
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 66
FROM playlist p
JOIN song s
  ON s.title = 'Tears (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 67
FROM playlist p
JOIN song s
  ON s.title = 'X (Count down 1993-1994 Version) (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 68
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 69
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything (SE) (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 70
FROM playlist p
JOIN song s
  ON s.title = 'Amethyst (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 371
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 71
FROM playlist p
JOIN song s
  ON s.title = 'X (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 356
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 72
FROM playlist p
JOIN song s
  ON s.title = 'JOKER (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 252
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 73
FROM playlist p
JOIN song s
  ON s.title = 'DAHLIA (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 448
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 74
FROM playlist p
JOIN song s
  ON s.title = 'SCARS ON MELODY (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 305
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 75
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 350
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 76
FROM playlist p
JOIN song s
  ON s.title = 'Standing SEX (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 269
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 77
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI Drum Solo (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 496
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 78
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 404
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 79
FROM playlist p
JOIN song s
  ON s.title = 'ROSE OF PAIN (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 366
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 80
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI Piano Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 430
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 81
FROM playlist p
JOIN song s
  ON s.title = '#NAME?'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 432
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 82
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 83
FROM playlist p
JOIN song s
  ON s.title = 'CELEBRATION (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 300
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 84
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 85
FROM playlist p
JOIN song s
  ON s.title = 'Rusty Nail (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 86
FROM playlist p
JOIN song s
  ON s.title = 'Longing (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 572
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 87
FROM playlist p
JOIN song s
  ON s.title = 'Tears(SE) (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 88
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything(SE) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 400
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 89
FROM playlist p
JOIN song s
  ON s.title = 'Amethyst (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 90
FROM playlist p
JOIN song s
  ON s.title = 'Rusty Nail (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 336
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 91
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 361
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 92
FROM playlist p
JOIN song s
  ON s.title = 'DAHLIA (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 456
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 93
FROM playlist p
JOIN song s
  ON s.title = 'SCARS ON MELODY (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 311
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 94
FROM playlist p
JOIN song s
  ON s.title = 'Standing SEX (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 95
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI Drum Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 581
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 96
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 414
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 97
FROM playlist p
JOIN song s
  ON s.title = 'ROSE OF PAIN (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 363
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 98
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI Piano Solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 462
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 99
FROM playlist p
JOIN song s
  ON s.title = 'KURENAI- (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 460
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 100
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 495
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 101
FROM playlist p
JOIN song s
  ON s.title = 'JOKER (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 314
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 102
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 103
FROM playlist p
JOIN song s
  ON s.title = 'X (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 276
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 104
FROM playlist p
JOIN song s
  ON s.title = 'Longing (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 105
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything(SE) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 488
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 106
FROM playlist p
JOIN song s
  ON s.title = 'Tears(SE) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 597
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 107
FROM playlist p
JOIN song s
  ON s.title = 'Amethyst (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 380
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 108
FROM playlist p
JOIN song s
  ON s.title = 'Rusty Nail (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 329
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 109
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 369
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 110
FROM playlist p
JOIN song s
  ON s.title = 'SCARS (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 299
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 111
FROM playlist p
JOIN song s
  ON s.title = 'DAHLIA (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 478
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 112
FROM playlist p
JOIN song s
  ON s.title = 'DRAIN (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 258
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 113
FROM playlist p
JOIN song s
  ON s.title = 'CRUCIFY MY LOVE (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 312
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 114
FROM playlist p
JOIN song s
  ON s.title = 'Longing-togireta melody- (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 499
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 115
FROM playlist p
JOIN song s
  ON s.title = 'KURENAI- (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 379
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 116
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 117
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 469
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 118
FROM playlist p
JOIN song s
  ON s.title = 'Prologue (WORLD ANTHEM) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 171
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 119
FROM playlist p
JOIN song s
  ON s.title = 'X (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 597
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 120
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 121
FROM playlist p
JOIN song s
  ON s.title = 'THE LAST SONG (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 122
FROM playlist p
JOIN song s
  ON s.title = 'Amethyst (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 390
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 123
FROM playlist p
JOIN song s
  ON s.title = 'Rusty Nail (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 465
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 124
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 404
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 125
FROM playlist p
JOIN song s
  ON s.title = 'SCARS (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 278
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 126
FROM playlist p
JOIN song s
  ON s.title = 'DAHLIA (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 488
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 127
FROM playlist p
JOIN song s
  ON s.title = 'DRAIN (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 537
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 128
FROM playlist p
JOIN song s
  ON s.title = 'CRUCIFY MY LOVE (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 540
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 129
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 600
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 130
FROM playlist p
JOIN song s
  ON s.title = 'KURENAI- (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 467
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 131
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 132
FROM playlist p
JOIN song s
  ON s.title = 'White Poem I (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 368
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 133
FROM playlist p
JOIN song s
  ON s.title = 'FOREVER LOVE (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 471
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 134
FROM playlist p
JOIN song s
  ON s.title = 'X (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 596
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 135
FROM playlist p
JOIN song s
  ON s.title = 'Prologue(WORLD ANTHEM) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 187
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 136
FROM playlist p
JOIN song s
  ON s.title = 'Silent Jealousy (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 473
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 137
FROM playlist p
JOIN song s
  ON s.title = 'SADISTIC DESIRE (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 420
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 138
FROM playlist p
JOIN song s
  ON s.title = 'Standing Sex (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 486
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 139
FROM playlist p
JOIN song s
  ON s.title = 'WEEK END (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 433
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 140
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI piano solo (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 259
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 141
FROM playlist p
JOIN song s
  ON s.title = 'ART OF LIFE (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 142
FROM playlist p
JOIN song s
  ON s.title = 'CELEBRATION (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 373
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 143
FROM playlist p
JOIN song s
  ON s.title = 'Orgasm (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 144
FROM playlist p
JOIN song s
  ON s.title = 'Tears (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 557
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 145
FROM playlist p
JOIN song s
  ON s.title = 'KURENAI- (Short Version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 146
FROM playlist p
JOIN song s
  ON s.title = 'X (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 147
FROM playlist p
JOIN song s
  ON s.title = 'ENDLESS RAIN (Short version) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 599
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 148
FROM playlist p
JOIN song s
  ON s.title = 'Say Anything (SE) (Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 517
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 149
FROM playlist p
JOIN song s
  ON s.title = '''Red Swan'' by YOSHIKI (feat. HYDE & SUGIZO) from "YOSHIKI: Under the Sky"'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 291
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 150
FROM playlist p
JOIN song s
  ON s.title = 'X Japan   Tears with Lyrics Full Song Fan'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 469
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 151
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI sings 1st time on TV for his Mother ''Angel YOSHIKI ver'' New Single "X JAPAN ver" out July 28'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 126
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 152
FROM playlist p
JOIN song s
  ON s.title = 'Miracle'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 293
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 153
FROM playlist p
JOIN song s
  ON s.title = 'Seize The Light (Classical Version [Live])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 393
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 154
FROM playlist p
JOIN song s
  ON s.title = 'Golden Globe Theme (Theme for the Golden Globe Awards)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 230
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 155
FROM playlist p
JOIN song s
  ON s.title = 'Tears (Classical Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 306
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 156
FROM playlist p
JOIN song s
  ON s.title = 'Red Christmas (Classical Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 442
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 157
FROM playlist p
JOIN song s
  ON s.title = 'Anniversary [Theme for the Emperor of Japan 10 Year Anniversary]'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 439
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 158
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love (Classical Version [Live])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 501
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 159
FROM playlist p
JOIN song s
  ON s.title = 'I''ll Be Your Love[Theme for the World Expo Japan] (Classical Version))'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 544
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 160
FROM playlist p
JOIN song s
  ON s.title = 'Amethyst'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 380
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 161
FROM playlist p
JOIN song s
  ON s.title = 'The Last Song (Classical Version [Live])'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 488
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 162
FROM playlist p
JOIN song s
  ON s.title = 'Golden Globe Theme (Quartet Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 229
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 163
FROM playlist p
JOIN song s
  ON s.title = 'BREATHING'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 334
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 164
FROM playlist p
JOIN song s
  ON s.title = 'NOTHING'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 339
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 165
FROM playlist p
JOIN song s
  ON s.title = 'LOVE OF TENDER'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 207
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 166
FROM playlist p
JOIN song s
  ON s.title = 'BELLE'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 199
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 167
FROM playlist p
JOIN song s
  ON s.title = 'DEBT'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 168
FROM playlist p
JOIN song s
  ON s.title = 'BREATHING (reprise)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 239
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 169
FROM playlist p
JOIN song s
  ON s.title = 'NOTHING'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'BLUEBYRDS')
 AND s.duration_seconds = 339
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 170
FROM playlist p
JOIN song s
  ON s.title = 'Butterfly (Acoustic Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Be-ray')
 AND s.duration_seconds = 290
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 171
FROM playlist p
JOIN song s
  ON s.title = 'Butterfly'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Be-ray')
 AND s.duration_seconds = 279
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 172
FROM playlist p
JOIN song s
  ON s.title = 'Psycho Love'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'THE LAST ROCKSTARS')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 173
FROM playlist p
JOIN song s
  ON s.title = 'THE LAST ROCKSTARS (PARIS MIX)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'THE LAST ROCKSTARS')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 174
FROM playlist p
JOIN song s
  ON s.title = 'Angel'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 175
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - Forever Love (Vocal Only/Acapella)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 373
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 176
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN '' Without you [LIVE 2008.03.30 Souzou no Yoru | Night of Creation]'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 362
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 177
FROM playlist p
JOIN song s
  ON s.title = '#XJAPAN  X  [ X JAPAN SP SONGS ,TV LIVE 2016.12.17 ]'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 288
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 178
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN / MC'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 483
WHERE p.playlist_name = 'X Japan';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'Forever Love by X JAPAN - Official Music Video'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 287
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - Say Anything'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 543
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - Joker'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 289
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - WEEK END'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 374
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - ENDLESS RAIN (Live at NIPPON BUDOKAN ,1990)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 392
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - X (Live at Hibiya Open-Air Concert Hall,1989'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 577
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN '' KURENAI (Live at Hibiya Open-Air Concert Hall,1989'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 408
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'ART OF LIFE - X JAPAN (Full ver 30 min)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 1844
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - TEARS - composed by YOSHIKI'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 396
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Rusty Nail from "The Last Live" HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 343
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN ENDLESS RAINHD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 422
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN Silent JealousyHD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 477
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'X Japan "Kurenai" from The Last Live (HD)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 433
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Jade (PG Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 384
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'Yoshiki X Japan Drum Diving'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 15
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'X Japan World Tour Volume I'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 160
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Born To Be Free at Nissan Stadium'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 387
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Yoshiki Wembley Solo in UK | WE ARE X Now Available on Amazon Prime Video in the U.S.!'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 192
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'WEEKEND - No Audience - X JAPAN 2018- Live Broadcast -  Line Cut'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 381
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'X Japan "Angel" First Single in 8 Years; Music & Lyrics by YOSHIKI - Now Streaming Worldwide'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 275
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Endless Rain from "The Last Live" HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 657
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI - DRUM SOLO after 2 neck surgeries - No Audience Live - X JAPAN (LINE CUT)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 561
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Live @ Wembley Arena March 4, 2017 - London'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 89
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Rusty Nail (Anime Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 329
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Forever Love from The Last Live - HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 494
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - I.V. (Official Music Video) HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 301
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Hero (lyric video trailer)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 42
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'X Japan The Last Song - Tears - UNFINISHED from "The Last Live" HD'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 1801
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 29
FROM playlist p
JOIN song s
  ON s.title = 'Last Knights Trailer (Featuring X Japan Single "Born To Be Free")'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 26
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 30
FROM playlist p
JOIN song s
  ON s.title = 'We Are All "Born To Be Free" - X Japan and Fans'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 377
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 31
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Wembley Arena - March 4, 2017'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 103
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 32
FROM playlist p
JOIN song s
  ON s.title = 'X Japan is Finally Coming to Wembley Arena March 4, 2017 - London'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 175
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 33
FROM playlist p
JOIN song s
  ON s.title = 'X Japan SSE Arena, Wembley - March 4, 2017 (announcement)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 119
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 34
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Madison Square Garden - Oct 11, 2014 (announcement)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 133
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 35
FROM playlist p
JOIN song s
  ON s.title = 'X Japan Japan Tour 2015 in NAGOYA - Live Viewing'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 59
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 36
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Madison Square Garden - Oct 11, 2014'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 31
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 37
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN - MADISON SQUARE GARDEN 10.11.14'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 31
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 38
FROM playlist p
JOIN song s
  ON s.title = 'Yoshiki''s return to drums! X Japan to perform at Coachella 2018'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 70
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 39
FROM playlist p
JOIN song s
  ON s.title = 'X JAPAN "No Audience" Concert'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 30
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 40
FROM playlist p
JOIN song s
  ON s.title = 'X Japan "WITHOUT YOU" (rough cut) - TOKYO DOME 2009'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 502
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 41
FROM playlist p
JOIN song s
  ON s.title = 'X Japan - Endless Rain (French Lyrics HD version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 68
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 42
FROM playlist p
JOIN song s
  ON s.title = 'NOW AVAILABLE ON PRIME VIDEO IN THE US: AWARD-WINNING X JAPAN DOCUMENTARY "WE ARE X"'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 142
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 43
FROM playlist p
JOIN song s
  ON s.title = 'YOSHIKI ANNOUNCES X JAPAN- DOCUMENTARY "WE ARE X" ON PRIME VIDEO-  AVAILABLE NOW in the US!'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'X Japan')
 AND s.duration_seconds = 30
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 44
FROM playlist p
JOIN song s
  ON s.title = 'Yoshiki Foundation America'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 341
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 45
FROM playlist p
JOIN song s
  ON s.title = '''WE ARE X'' JAPAN BLU-RAY RELEASE DECEMBER 13, 2017!'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Yoshiki')
 AND s.duration_seconds = 109
WHERE p.playlist_name = 'X Japan - Yoshiki';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 1
FROM playlist p
JOIN song s
  ON s.title = 'You & I'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 376
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 2
FROM playlist p
JOIN song s
  ON s.title = 'Wind Of Change'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 313
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 3
FROM playlist p
JOIN song s
  ON s.title = 'Never Say Goodbye'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 289
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 4
FROM playlist p
JOIN song s
  ON s.title = 'Bohemian Rhapsody (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 355
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 5
FROM playlist p
JOIN song s
  ON s.title = 'Sign of the Times'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 255
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 6
FROM playlist p
JOIN song s
  ON s.title = 'Little Wing (Live in Japan)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Uli Jon Roth - Topic')
 AND s.duration_seconds = 505
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 7
FROM playlist p
JOIN song s
  ON s.title = 'Send Me An Angel (Coming Home Live)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 271
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 8
FROM playlist p
JOIN song s
  ON s.title = 'Forever Young (2019 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Alphaville')
 AND s.duration_seconds = 226
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 9
FROM playlist p
JOIN song s
  ON s.title = 'I Was Born To Love You (Vocals & Piano Version / Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 176
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 10
FROM playlist p
JOIN song s
  ON s.title = 'Dream On'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Aerosmith')
 AND s.duration_seconds = 268
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 11
FROM playlist p
JOIN song s
  ON s.title = 'Hard to Say I''m Sorry / Get Away (2006 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Chicago')
 AND s.duration_seconds = 306
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 12
FROM playlist p
JOIN song s
  ON s.title = 'Right Here Waiting'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Richard Marx')
 AND s.duration_seconds = 265
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 13
FROM playlist p
JOIN song s
  ON s.title = 'When I Look Into Your Eyes'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'FireHouse')
 AND s.duration_seconds = 240
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 14
FROM playlist p
JOIN song s
  ON s.title = 'SCORPIONS - LIVING FOR TOMORROW (Lyrics)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 332
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 15
FROM playlist p
JOIN song s
  ON s.title = 'Who Wants To Live Forever'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 315
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 16
FROM playlist p
JOIN song s
  ON s.title = 'Thank You For Loving Me'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 309
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 17
FROM playlist p
JOIN song s
  ON s.title = 'Open Your Heart'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Europe')
 AND s.duration_seconds = 247
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 18
FROM playlist p
JOIN song s
  ON s.title = 'Always Somewhere (2015 - Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 298
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 19
FROM playlist p
JOIN song s
  ON s.title = 'Too Much Love Will Kill You (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 260
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 20
FROM playlist p
JOIN song s
  ON s.title = 'Every Breath You Take'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'The Police')
 AND s.duration_seconds = 254
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 21
FROM playlist p
JOIN song s
  ON s.title = 'You''re All I Need'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'White Lion')
 AND s.duration_seconds = 266
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 22
FROM playlist p
JOIN song s
  ON s.title = 'Under The Same Sun'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Scorpions')
 AND s.duration_seconds = 294
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 23
FROM playlist p
JOIN song s
  ON s.title = 'I Want It All (Remastered 2011)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Queen')
 AND s.duration_seconds = 281
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 24
FROM playlist p
JOIN song s
  ON s.title = 'Love Hurts (Single Edit)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Nazareth')
 AND s.duration_seconds = 233
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 25
FROM playlist p
JOIN song s
  ON s.title = 'Listen To Your Heart'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Roxette')
 AND s.duration_seconds = 329
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 26
FROM playlist p
JOIN song s
  ON s.title = 'Always'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bon Jovi')
 AND s.duration_seconds = 354
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 27
FROM playlist p
JOIN song s
  ON s.title = 'Straight From The Heart (Classic Version)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'Bryan Adams')
 AND s.duration_seconds = 209
WHERE p.playlist_name = 'You and I Mix';
INSERT IGNORE INTO playlist_song (playlist_id, song_id, position)
SELECT p.playlist_id, s.song_id, 28
FROM playlist p
JOIN song s
  ON s.title = 'Love of a Lifetime (2024 Remaster)'
 AND s.artist_id = (SELECT artist_id FROM artist WHERE artist_name = 'FireHouse')
 AND s.duration_seconds = 286
WHERE p.playlist_name = 'You and I Mix';

-- Verification queries
SELECT COUNT(*) AS artists FROM artist;
SELECT COUNT(*) AS songs FROM song;
SELECT COUNT(*) AS playlists FROM playlist;
SELECT COUNT(*) AS playlist_song_entries FROM playlist_song;

SELECT p.playlist_name, COUNT(ps.song_id) AS song_count
FROM playlist p
LEFT JOIN playlist_song ps ON p.playlist_id = ps.playlist_id
GROUP BY p.playlist_id, p.playlist_name
ORDER BY p.playlist_id;

SELECT p.playlist_name, ps.position, s.title, a.artist_name, s.duration_seconds
FROM playlist_song ps
JOIN playlist p ON p.playlist_id = ps.playlist_id
JOIN song s ON s.song_id = ps.song_id
JOIN artist a ON a.artist_id = s.artist_id
ORDER BY p.playlist_id, ps.position;