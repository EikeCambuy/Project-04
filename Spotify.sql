USE spotify;
ALTER TABLE base
MODIFY COLUMN track_id VARCHAR(250);
ALTER TABLE data
MODIFY COLUMN id VARCHAR(250);



CREATE VIEW artist_info AS(
							SELECT *
                            FROM base b
                            INNER JOIN data d
                            ON b.track_id= d.id);


SELECT artist_name, COUNT(id) AS total
FROM artist_info
GROUP BY artist_name
ORDER BY total DESC
LIMIT 10;

SELECT genre, COUNT(id) AS total
FROM artist_info
GROUP BY genre
ORDER BY total DESC
LIMIT 10;

SELECT artist_name, genre, COUNT(id) as total
FROM artist_info
GROUP BY artist_name, genre
ORDER BY total DESC
LIMIT 3;


