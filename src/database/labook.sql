
----------CREATE DAS TABLES (users; posts; like_dislikes)
CREATE TABLE IF NOT EXISTS users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE IF NOT EXISTS posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS likes_dislikes(
    user_id TEXT PRIMARY KEY UNIQUE NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER DEFAULT(0),
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (post_id) REFERENCES posts(id)
);
-------------------------------------------------------------

----------POPULANDO AS TABELAS
INSERT INTO users (id, name, email, password, role)
VALUES
	("u001", "Edipo", "edipo@email.com", "123", "dev"),
	("u002", "Pamela", "pamela@email.com", "456", "dev"),
    ("u003", "Antonio", "antonio@email.com", "789", "dev"),
    ("u004", "Aurora", "aurora@email.com", "321", "dev"),
    ("u005", "Mateus", "mateus@email.com", "654", "dev"),
    ("u006", "Nathalia", "nathalia@email.com", "987", "dev")
    ;

INSERT INTO posts (id, creator_id, content, likes, dislikes)
VALUES
    ("p001", "u001", "", 1, 1),
    ("p002", "u002", "", 1, 2),
    ("p003", "u003", "", 2, 0),
    ("p004", "u004", "", 2, 1),
    ("p005", "u005", "", 1, 0),
    ("p006", "u006", "", 1, 3)
    ;

INSERT INTO likes_dislike (user_id, post_id, like)
VALUES
    ("u001", "p001", 1),
    ("u002", "p002", 1),
    ("u003", "p003", 2),
    ("u004", "p004", 2),
    ("u005", "p005", 1),
    ("u006", "p006", 1)
    ;
-------------------------------------------------------------

----------VISUALIZAÇÃO DAS TABLES
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM likes_dislikes;
-------------------------------------------------------------

----------DELETE DAS TABLES
DROP TABLE users;
DROP TABLE posts;
DROP TABLE likes_dislikes;
-------------------------------------------------------------