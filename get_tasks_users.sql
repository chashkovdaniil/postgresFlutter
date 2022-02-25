WITH creators AS (
        SELECT project_user.id AS pu_creator_id, 
          users.id AS creator_id,
          users.name AS creator_name,
          users.last_name AS creator_last_name,
          users.patronymic AS creator_patronymic,
          users.email AS creator_email,
          users.phone AS creator_phone,
          users.photo AS creator_photo,
          roles.name AS creator_role
          FROM project_user INNER JOIN users ON project_user.user_id = users.id
                    INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = 61
      ), performers AS (
        SELECT project_user.id AS pu_performer_id, 
          users.id AS performer_id,
          users.name AS performer_name,
          users.last_name AS performer_last_name,
          users.patronymic AS performer_patronymic,
          users.email AS performer_email,
          users.phone AS performer_phone,
          users.photo AS performer_photo,
          roles.name AS performer_role
        FROM project_user INNER JOIN users ON project_user.user_id = users.id 
                    INNER JOIN roles ON project_user.role_id = roles.id WHERE project_id = 61
      )
      SELECT * FROM tasks JOIN creators ON tasks.creator_id = creators.pu_creator_id JOIN performers ON tasks.performer_id = performers.pu_performer_id