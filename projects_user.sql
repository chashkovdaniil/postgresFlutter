-- INSERT INTO roles (name) VALUES ('admin');
-- INSERT INTO roles (name) VALUES ('user');

-- WITH project AS (INSERT INTO projects (title) VALUES ('Project #2') RETURNING id, title, count_tasks, count_done_tasks)
-- INSERT INTO project_user (project_id, role_id, user_id) SELECT project.id, 1, 21 FROM project RETURNING project_id;

-- DELETE FROM projects WHERE id = 1;

-- INSERT INTO project_user (project_id, role_id, user_id) VALUES (9, 2, 20);

-- SELECT * FROM project_user WH

-- SELECT users.id AS user_id, users.name AS user_name, users.last_name AS user_last_name, users.patronymic AS user_patronymic, 
--  	   users.email AS user_email, users.phone AS user_phone, users.photo AS user_photo, roles.name AS user_role,
--  	   roles.id AS role_id ,roles.name AS role_name, 
--  	   projects.id AS project_id, projects.title AS project_title, 
--  	   projects.count_tasks AS project_count_tasks, projects.count_done_tasks AS project_count_done_tasks
-- 	   FROM project_user 
--  	   			INNER JOIN users ON project_user.user_id = users.id 
--  				INNER JOIN projects ON project_user.project_id = projects.id
--  				INNER JOIN roles ON project_user.role_id = roles.id 
-- 	   WHERE user_id = 20;

SELECT user_id, users.name AS user_name, users.last_name AS user_last_name, users.patronymic AS user_patronymic, 
	   roles.id AS role_id ,roles.name AS  role_name, 
	   project_id, projects.title AS project_title, 
	   projects.count_tasks AS project_count_tasks, projects.count_done_tasks AS project_count_done_tasks
FROM project_user INNER JOIN users ON project_user.user_id = users.id 
				  INNER JOIN projects ON project_user.project_id = projects.id
				  INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = 9