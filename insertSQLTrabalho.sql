INSERT INTO TAB_Users (email, password, role)
VALUES
    ('user1@example.com', 'password123', 'USER'),
    ('user2@example.com', 'pass456', 'USER'),
    ('user3@example.com', 'pass789', 'USER'),
    ('user4@example.com', 'passabc', 'USER'),
    ('user5@example.com', 'passdef', 'ABACAXI'),
    ('admin1@example.com', 'adminpass', 'ADMIN'),
    ('user6@example.com', 'userpass', 'USER'),
    ('user7@example.com', 'userpass', 'USER'),
    ('admin2@example.com', 'adminpass', 'ADMIN'),
    ('user8@example.com', 'userpass', 'ABACAXI');


INSERT INTO TAB_UserProfiles (id_user, full_name, birthday_date)
VALUES
    ((SELECT id FROM TAB_Users WHERE email = 'user1@example.com'), 'John Doe', '1990-05-15'),
    ((SELECT id FROM TAB_Users WHERE email = 'user2@example.com'), 'Jane Smith', '1985-08-22'),
    ((SELECT id FROM TAB_Users WHERE email = 'user3@example.com'), 'Alice Johnson', '1993-02-10'),
    ((SELECT id FROM TAB_Users WHERE email = 'user4@example.com'), 'Bob Anderson', '1980-11-30'),
    ((SELECT id FROM TAB_Users WHERE email = 'user5@example.com'), 'Eva Williams', '1995-07-05'),
    ((SELECT id FROM TAB_Users WHERE email = 'admin1@example.com'), 'Carlos Rodriguez', '1987-04-18'),
    ((SELECT id FROM TAB_Users WHERE email = 'user6@example.com'), 'Sophia Taylor', '1998-09-25'),
    ((SELECT id FROM TAB_Users WHERE email = 'user7@example.com'), 'David Brown', '1983-12-12'),
    ((SELECT id FROM TAB_Users WHERE email = 'admin2@example.com'), 'Emily Davis', '1992-06-08'),
    ((SELECT id FROM TAB_Users WHERE email = 'user8@example.com'), 'Michael Jackson', '1958-08-29');


INSERT INTO TAB_Artists (full_name)
VALUES
    ('Amanda Swift'),
    ('Lucas Sky'),
    ('Sophie Moon'),
    ('David Jazz'),
    ('Isabel Harmony'),
    ('Alex Thunder'),
    ('Lily Echo'),
    ('Nathan Blaze'),
    ('Mia Melody'),
    ('Oliver Star'),
    ('Emma Jazz'),
    ('Noah Harmony'),
    ('Chloe Storm'),
    ('Ethan Sound'),
    ('Grace Serenade');


INSERT INTO TAB_Albums (id_artist, album_name, release_date)
VALUES
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Amanda Swift'), 'Raios de Luar', '2022-03-15'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Lucas Sky'), 'Cidade dos Sonhos', '2021-07-28'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Sophie Moon'), 'Harmonia Celestial', '2023-01-10'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'David Jazz'), 'Sons da Natureza', '2022-09-05'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Isabel Harmony'), 'Notas da Alma', '2021-04-12'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Alex Thunder'), 'Melodias do Universo', '2023-06-20'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Lily Echo'), 'Vibrações Místicas', '2022-11-08'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Nathan Blaze'), 'Caminhos do Silêncio', '2021-12-03'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Mia Melody'), 'Ecos do Passado', '2023-04-25'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Oliver Star'), 'Aurora Sonora', '2022-08-17'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Emma Jazz'), 'Canções do Horizonte', '2021-10-30'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Noah Harmony'), 'Ritmos do Coração', '2023-02-18'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Chloe Storm'), 'Poesia Sonante', '2022-05-22'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Ethan Sound'), 'A Sinfonia das Estações', '2021-09-14'),
    ((SELECT id FROM TAB_Artists WHERE full_name = 'Grace Serenade'), 'Encontro de Acordes', '2023-03-08');


INSERT INTO TAB_Songs (song_name, song_url, id_artist, id_album)
VALUES
    ('Moonlight Serenade', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Amanda Swift'), (SELECT id FROM TAB_Albums WHERE album_name = 'Raios de Luar')),
    ('City of Dreams', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Lucas Sky'), (SELECT id FROM TAB_Albums WHERE album_name = 'Cidade dos Sonhos')),
    ('Celestial Harmony', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Sophie Moon'), (SELECT id FROM TAB_Albums WHERE album_name = 'Harmonia Celestial')),
    ('Natures Symphony', '', (SELECT id FROM TAB_Artists WHERE full_name = 'David Jazz'), (SELECT id FROM TAB_Albums WHERE album_name = 'Sons da Natureza')),
    ('Soulful Notes', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Isabel Harmony'), (SELECT id FROM TAB_Albums WHERE album_name = 'Notas da Alma')),
    ('Melodies of the Universe', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Alex Thunder'), (SELECT id FROM TAB_Albums WHERE album_name = 'Melodias do Universo')),
    ('Mystical Vibrations', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Lily Echo'), (SELECT id FROM TAB_Albums WHERE album_name = 'Vibrações Místicas')),
    ('Paths of Silence', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Nathan Blaze'), (SELECT id FROM TAB_Albums WHERE album_name = 'Caminhos do Silêncio')),
    ('Echoes of the Past', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Mia Melody'), (SELECT id FROM TAB_Albums WHERE album_name = 'Ecos do Passado')),
    ('Aurora Sounds', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Oliver Star'), (SELECT id FROM TAB_Albums WHERE album_name = 'Aurora Sonora')),
    ('Songs of the Horizon', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Emma Jazz'), (SELECT id FROM TAB_Albums WHERE album_name = 'Canções do Horizonte')),
    ('Rhythms of the Heart', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Noah Harmony'), (SELECT id FROM TAB_Albums WHERE album_name = 'Ritmos do Coração')),
    ('Sonorous Poetry', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Chloe Storm'), (SELECT id FROM TAB_Albums WHERE album_name = 'Poesia Sonante')),
    ('Symphony of Seasons', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Ethan Sound'), (SELECT id FROM TAB_Albums WHERE album_name = 'A Sinfonia das Estações')),
    ('Encounter of Chords', '', (SELECT id FROM TAB_Artists WHERE full_name = 'Grace Serenade'), (SELECT id FROM TAB_Albums WHERE album_name = 'Encontro de Acordes'));


INSERT INTO TAB_Playlists (id_user, playlist_name)
VALUES
    ((SELECT id FROM TAB_Users WHERE email = 'user1@example.com'),'Chill Vibes'),
    ((SELECT id FROM TAB_Users WHERE email = 'user2@example.com'), 'Epic Journeys'),
    ((SELECT id FROM TAB_Users WHERE email = 'user3@example.com'), 'Summer Serenade'),
    ((SELECT id FROM TAB_Users WHERE email = 'user4@example.com'), 'Acoustic Bliss' ),
    ((SELECT id FROM TAB_Users WHERE email = 'user5@example.com'), 'Midnight Grooves' ),
    ((SELECT id FROM TAB_Users WHERE email = 'admin1@example.com'), 'Feel Good Anthems'),
    ((SELECT id FROM TAB_Users WHERE email = 'user6@example.com'),  'Rainy Day Melodies' ),
    ((SELECT id FROM TAB_Users WHERE email = 'user7@example.com'), 'Road Trip Mix'),
    ((SELECT id FROM TAB_Users WHERE email = 'admin2@example.com'), 'Morning Inspiration'),
    ((SELECT id FROM TAB_Users WHERE email = 'user8@example.com'), 'Soulful Reflections'),
    ((SELECT id FROM TAB_Users WHERE email = 'user1@example.com'),'Dance Party Extravaganza'),
    ((SELECT id FROM TAB_Users WHERE email = 'user2@example.com'), 'Smooth Jazz Delight'),
    ((SELECT id FROM TAB_Users WHERE email = 'user3@example.com'), 'Golden Oldies Rewind'),
    ((SELECT id FROM TAB_Users WHERE email = 'user4@example.com'), 'Country Roads Collection'),
    ((SELECT id FROM TAB_Users WHERE email = 'user5@example.com'), 'Latin Rhythms Fiesta');


INSERT INTO TAB_Playlists_Songs (id_song, id_playlist)
VALUES
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Moonlight Serenade'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Chill Vibes')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'City of Dreams'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Epic Journeys')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Celestial Harmony'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Summer Serenade')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Natures Symphony'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Acoustic Bliss')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Soulful Notes'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Midnight Grooves')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Melodies of the Universe'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Feel Good Anthems')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Mystical Vibrations'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Rainy Day Melodies')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Paths of Silence'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Road Trip Mix')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Echoes of the Past'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Morning Inspiration')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Aurora Sounds'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Soulful Reflections')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Songs of the Horizon'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Dance Party Extravaganza')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Rhythms of the Heart'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Smooth Jazz Delight')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Sonorous Poetry'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Golden Oldies Rewind')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Symphony of Seasons'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Country Roads Collection')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Encounter of Chords'), (SELECT id FROM TAB_Playlists WHERE playlist_name = 'Latin Rhythms Fiesta'));


INSERT INTO TAB_Listen_History (id_song, id_user)
VALUES
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Moonlight Serenade'), (SELECT id FROM TAB_Users WHERE email = 'user1@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'City of Dreams'),(SELECT id FROM TAB_Users WHERE email = 'user2@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Celestial Harmony'),(SELECT id FROM TAB_Users WHERE email = 'user3@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Natures Symphony'), (SELECT id FROM TAB_Users WHERE email = 'user4@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Soulful Notes'), (SELECT id FROM TAB_Users WHERE email = 'user5@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Melodies of the Universe'),(SELECT id FROM TAB_Users WHERE email = 'admin1@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Mystical Vibrations'), (SELECT id FROM TAB_Users WHERE email = 'user6@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Paths of Silence'), (SELECT id FROM TAB_Users WHERE email = 'user7@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Echoes of the Past'), (SELECT id FROM TAB_Users WHERE email = 'admin2@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Aurora Sounds'), (SELECT id FROM TAB_Users WHERE email = 'user8@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Songs of the Horizon'), (SELECT id FROM TAB_Users WHERE email = 'user1@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Rhythms of the Heart'), (SELECT id FROM TAB_Users WHERE email = 'user2@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Sonorous Poetry'), (SELECT id FROM TAB_Users WHERE email = 'user3@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Symphony of Seasons'), (SELECT id FROM TAB_Users WHERE email = 'user4@example.com')),
    ((SELECT id FROM TAB_Songs WHERE song_name = 'Encounter of Chords'),(SELECT id FROM TAB_Users WHERE email = 'user5@example.com') );