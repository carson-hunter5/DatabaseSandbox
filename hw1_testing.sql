USE HuskyGram;

SELECT count(c.id) as num_of_comments, p.id,p.image_url
FROM photos p LEFT OUTER JOIN comments c
ON c.photo_id = p.id
GROUP BY p.id, p.created_at
ORDER BY p.created_at DESC;

SELECT DISTINCT u.username
FROM (SELECT p.user_id
      FROM photos p
               JOIN comments c ON p.id = c.photo_id
               LEFT OUTER JOIN likes l ON p.id = l.photo_id
      WHERE l.photo_id IS NULL) AS results
         JOIN users u on u.id = results.user_id
ORDER BY u.username;

SELECT COUNT(*) as num_photos
	FROM
	(SELECT p.id
		FROM photos p JOIN photo_tags pt ON p.id = pt.photo_id
		JOIN  tags t on pt.tag_id = t.id
		WHERE t.tag_name = '#NEU'
INTERSECT
    SELECT p.id
		FROM photos p JOIN photo_tags pt ON p.id = pt.photo_id
		JOIN  tags t on pt.tag_id = t.id
		WHERE t.tag_name = '#BU') as bu_and_nu ;

SELECT u.username, c.comment_text
             FROM users u JOIN comments c
             ON u.id = c.user_id
             WHERE UPPER(c.comment_text) LIKE '%COLLEGE%'
ORDER BY c.created_at;

SELECT u.username AS username, u.created_at AS created_on
FROM photos p RIGHT OUTER JOIN users u ON p.user_id = u.id
WHERE p.id IS NULL
ORDER BY u.username;
