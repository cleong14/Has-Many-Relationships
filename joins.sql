-- consider doing line breaks between , and other things for better readability

-- kind of like requiring in a module
\c has_many_blogs;

-- 1. get all fields  from users
-- SELECT *
-- FROM users;

-- 2. get all fields from posts where user_id is 100
-- SELECT *
-- FROM posts
-- WHERE users_id = 100;

-- 3. get all posts fields, users first and last name from posts table where user id is 200
-- SELECT posts.*, users.first_name, users.last_name
-- FROM posts INNER JOIN users ON (posts.users_id = users.id)
-- WHERE users.id = 200;

-- 4. get all posts field, users username, from posts table where users first name is 'Norene' and last name is 'Schmitt'
-- SELECT posts.*, users.username
-- FROM posts INNER JOIN users ON (posts.users_id = users.id)
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- 5. get usernames from users table where user has created a post after jan 1, 2015
-- SELECT users.*
-- FROM users INNER JOIN posts ON (users.id = posts.users_id)
-- WHERE posts.created_at > date '2015-01-01';

-- 6. get post title, post content, and users username WHERE user who created post joined before jan 1, 2015
-- SELECT posts.title, posts.content, users.username
-- FROM posts INNER JOIN users ON (posts.users_id = users.id)
-- WHERE users.created_at < date '2015-01-01';

-- 7. get all rows in comments table, showing post title and all comments fields
-- SELECT comments.*, posts.title AS "Post Title"
-- FROM comments INNER JOIN posts ON (posts.id = comments.posts_id)

-- 8. get all rows in comments, showing post title, post url, and comment body where post created before jan 1, 2015
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments INNER JOIN posts ON (posts.id = comments.posts_id)
-- WHERE posts.created_at < date '2015-01-01';

-- 9. get all rows in comments, post title as post_title, post url as post_url, comment body as comment_body where body contains word 'USB'
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments INNER JOIN posts ON (posts.id = comments.posts_id)
-- WHERE posts.created_at > date '2015-01-01';

-- 10. get all rows in comments, post title as post_title, post url as post_url, comment body as comment_body, where comment body contains word 'USB'
-- SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments INNER JOIN posts ON (posts.id = comments.posts_id)
-- WHERE comments.body LIKE '%USB%';

-- 11. get post title as post_title, first name of the author of the post, last name of the author of the post, and comment body as comment_body, where body contains word 'matrix' (should have 855 results) (855)
-- SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
-- FROM comments
--   INNER JOIN posts ON (comments.posts_id = posts.id)
--   INNER JOIN users ON (comments.users_id = users.id)
-- WHERE comments.body LIKE '%matrix%';

-- 12. get first name of author of comment, last name of author of comment, comment body as comment_body, where comment body contains word 'SSL' and post content contains word 'dolorum' (102)
-- SELECT
--   users.first_name,
--   users.last_name,
--   comments.body AS comment_body
-- FROM comments
  -- INNER JOIN posts ON (comments.posts_id = posts.id)
  -- INNER JOIN users ON (comments.users_id = users.id)
-- WHERE 
--   comments.body LIKE '%SSL%'
--   AND
--   posts.content LIKE '%dolorum%';

-- 13. get first name of author of post as post_author_first_name, last name of post as post_author_last_name, post title as post_title, username of author of comment as comment_author_username, and comment body as comment_body, where comment body contains 'SSL' or 'firewall' and post content contains word 'nemo' (197)
-- SELECT 
--   users.first_name AS post_author_first_name,
--   users.last_name AS post_author_last_name,
--   posts.title AS post_title,
--   users.username AS comment_author_username,
--   comments.body AS comment_body
-- FROM comments
--   INNER JOIN posts ON (comments.posts_id = posts.id)
--   INNER JOIN users ON (comments.users_id = users.id)
-- WHERE
--   (comments.body LIKE '%SSL%'
--   OR
--   comments.body LIKE '%firewal%')
--   AND
--   posts.content LIKE '%nemo%';

-- Additional Queries
-- 1. find post id, post title, user id of all posts where post author commented on his/her own post. (2)