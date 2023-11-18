CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- USER
CREATE TYPE user_role AS ENUM ('ADMIN', 'USER','ABACAXI');

CREATE TABLE TAB_Users(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) not null, -- required Spring sec
	role user_role not null -- required Spring sec
);

CREATE TABLE TAB_UserProfiles(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    id_user UUID NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    birthday_date timestamp
);

ALTER TABLE TAB_UserProfiles 
    ADD CONSTRAINT FK_tabUsers_idUser FOREIGN KEY (id_user)
    REFERENCES TAB_Users(id)
    ON DELETE CASCADE;

--CREATE TABLE TAB_Authorities (
--	id UUID PRIMARY KEY,
--	name VARCHAR(100) UNIQUE NOT NULL
--);

--CREATE TABLE TAB_User_Authorities (
--	id_user UUID NOT NULL,
--	id_authotity UUID NOT NULL
--);

--ALTER TABLE TAB_User_Authorities 
--    ADD CONSTRAINT FK_tabUser_idUser FOREIGN KEY (id_user)
--    REFERENCES TAB_Users(id);

--ALTER TABLE TAB_User_Authorities 
--    ADD CONSTRAINT FK_tabAuthoties_idAuthotity FOREIGN KEY (id_authotity)
--    REFERENCES TAB_Authorities(id);

-- ARTIST
CREATE TABLE TAB_Artists(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    full_name VARCHAR(100) UNIQUE NOT NULL,
    image_url VARCHAR
);

-- ALBUM
CREATE TABLE TAB_Albums(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    id_artist UUID NOT NULL,
    album_name VARCHAR(100) NOT NULL,
    release_date timestamp NOT NULL,
    image_url VARCHAR
);

ALTER TABLE TAB_Albums 
    ADD CONSTRAINT FK_tabArtist_idArtist FOREIGN KEY (id_artist)
    REFERENCES TAB_Artists(id);

-- SONGS
CREATE TABLE TAB_Songs(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    song_name VARCHAR(100) UNIQUE NOT NULL,
    song_url VARCHAR NOT NULL,
    id_artist UUID NOT NULL,
    id_album UUID NOT NULL
);

ALTER TABLE TAB_Songs 
    ADD CONSTRAINT FK_tabArtistsId_idArtist FOREIGN KEY (id_artist)
    REFERENCES TAB_Artists(id)
    ON DELETE CASCADE;

ALTER TABLE TAB_Songs 
    ADD CONSTRAINT FK_tabAlbumsId_idAlbum FOREIGN KEY (id_album)
    REFERENCES TAB_Albums(id)
    ON DELETE CASCADE;

-- PLAYLISTS
CREATE TABLE TAB_Playlists(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    id_user UUID NOT NULL,
    playlist_name VARCHAR(100) NOT NULL,
    playlist_description VARCHAR(250),
    created_at timestamp NOT NULL DEFAULT CURRENT_DATE
);

ALTER TABLE TAB_Playlists 
    ADD CONSTRAINT FK_tabUsers_idUser FOREIGN KEY (id_user)
    REFERENCES TAB_Users(id)
    ON DELETE CASCADE;

CREATE TABLE TAB_Playlists_Songs(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
    id_playlist UUID NOT NULL,
    id_song UUID NOT NULL
);

ALTER TABLE TAB_Playlists_Songs 
    ADD CONSTRAINT FK_tabPlaylistId_idPlaylist FOREIGN KEY (id_playlist)
    REFERENCES TAB_Playlists(id)
    ON DELETE CASCADE;

ALTER TABLE TAB_Playlists_Songs 
    ADD CONSTRAINT FK_tabSongId_idSong FOREIGN KEY (id_song)
    REFERENCES TAB_Songs(id)
    ON DELETE CASCADE;

-- LISTEN HISTORY
CREATE TABLE TAB_Listen_History(
    id_song UUID NOT NULL,
    id_user UUID NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE TAB_Listen_History 
    ADD CONSTRAINT FK_tabSongId_idSong FOREIGN KEY (id_song)
    REFERENCES TAB_Songs(id)
    ON DELETE CASCADE;

ALTER TABLE TAB_Listen_History 
    ADD CONSTRAINT FK_tabUserId_idUser FOREIGN KEY (id_user)
    REFERENCES TAB_Users(id)
    ON DELETE CASCADE;