-- Listar músicas paginado
SELECT id, song_name, id_artist, row_number() OVER (ORDER BY song_name, id) AS rn
FROM tab_songs
ORDER BY song_name, id
OFFSET 0 LIMIT 10;

-- Pesquisar musica por nome
SELECT id, song_name, id_artist, row_number() OVER (ORDER BY song_name, id) AS rn
FROM tab_songs
WHERE song_name LIKE '%' || LOWER('rora') || '%'
ORDER BY song_name, id
OFFSET 0 LIMIT 10;

-- Criar playlist
-- No caso vou receber os IDs do back, mas para executar sem erros tem que ser feito assim...
INSERT INTO TAB_Playlists (id_user, playlist_name)
VALUES
    ((SELECT id FROM TAB_Users WHERE email = 'user1@example.com'),'Super playlist');
	
-- Inserir música na playlist
INSERT INTO TAB_Playlists_Songs (id_song, id_playlist)
VALUES
    ((SELECT id FROM TAB_Songs 
	  	WHERE song_name = 'City of Dreams'), 
	 (SELECT id FROM TAB_Playlists 
	  	WHERE playlist_name = 'Super playlist'));
		
-- Remover música da playlist
DELETE FROM TAB_Playlists_Songs
WHERE id_playlist = (SELECT id FROM TAB_Playlists 
	  	WHERE playlist_name = 'Super playlist')
AND id_song = (SELECT id FROM TAB_Songs 
	  	WHERE song_name = 'City of Dreams');
		
-- Editar detalhes da playlist
UPDATE TAB_Playlists
SET playlist_name = 'SUPER PLAYLIST',
	playlist_description = 'Agora com descrição'
WHERE id_user = (SELECT id FROM TAB_Users WHERE email = 'user1@example.com')
AND playlist_name = 'Super playlist';

-- Curtir música
INSERT INTO TAB_Playlists (id_user, playlist_name)
VALUES
    ((SELECT id FROM TAB_Users WHERE email = 'user1@example.com'),'Likes');

INSERT INTO TAB_Playlists_Songs (id_song, id_playlist)
VALUES
    ((SELECT id FROM TAB_Songs 
	  	WHERE song_name = 'City of Dreams'), 
	 (SELECT id FROM TAB_Playlists 
	  	WHERE playlist_name = 'Likes'));
		
-- Remover música curtida
DELETE FROM TAB_Playlists_Songs
WHERE id_playlist = (SELECT id FROM TAB_Playlists 
	  	WHERE playlist_name = 'Likes')
AND id_song = (SELECT id FROM TAB_Songs 
	  	WHERE song_name = 'City of Dreams');
		
-- Criar conta
INSERT INTO TAB_Users (email, password, role)
VALUES
    ('vitoria@atitus.edu.com', 'supersenha', 'USER');
	
-- Adicionar dados ao perfil
INSERT INTO TAB_UserProfiles (id_user, full_name, birthday_date)
VALUES
    ((SELECT id FROM TAB_Users WHERE email = 'vitoria@atitus.edu.com'), 'Prof Vitoria', '2000-01-01');
	
-- Editar dados perfil
UPDATE TAB_UserProfiles
SET full_name = 'super vitoria'
WHERE id_user = (SELECT id FROM TAB_Users WHERE email = 'vitoria@atitus.edu.com')
	
-- Deletar conta
DELETE FROM TAB_Users
WHERE id = (SELECT id FROM TAB_Users WHERE email = 'vitoria@atitus.edu.com')

