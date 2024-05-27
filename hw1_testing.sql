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


SELECT followee.username as userNAME, follower.username as followerName
FROM follows f JOIN users followee ON f.followee_id = followee.id
JOIN users follower ON f.follower_id = follower.id
ORDER BY userName, followerName;

SELECT t.tag_name as tagName, count(*)  as numPhotos
FROM tags t JOIN photo_tags pt ON t.id = pt.tag_id
GROUP BY tagName
ORDER by numPhotos DESC LIMIT 3;

SELECT u.username as mostActive
FROM users u JOIN comments c ON u.id = c.user_id
GROUP BY u.id
ORDER BY COUNT(*) DESC LIMIT 1;

SELECT p.id #, count(c.id), count(pt.tag_id)
FROM photos p JOIN comments c ON p.id = c.photo_id
JOIN photo_tags pt ON p.id = pt.photo_id
GROUP BY p.id
HAVING COUNT(c.id) >= 3 AND COUNT(pt.tag_id) >= 2

select * from photos;
select * from comments;

SELECT * #, count(c.id), count(pt.tag_id)
FROM photos p JOIN comments c ON p.id = c.photo_id
JOIN photo_tags pt ON p.id = pt.photo_id;

SELECT COUNT(*)
FROM (SELECT p.id
      FROM comments c
               JOIN photos p
                    ON c.photo_id = p.id
      GROUP BY p.id
      HAVING count(c.id) > 3
      INTERSECT
      SELECT p.id
      FROM photo_tags pt
               JOIN photos p
                    ON pt.photo_id = p.id
      GROUP BY p.id
      HAVING count(pt.tag_id) >= 2) AS pulled_photos;



