
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

CREATE TABLE IF NOT EXISTS like_dislikes(
    user_id TEXT PRIMARY KEY UNIQUE NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER DEFAULT(0),
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (post_id) REFERENCES users(id)
);



-------------------------------------------------------------

----------POPULANDO AS TABELAS
INSERT INTO users (id, name, email, password, role)
VALUES
	("u001", "Fulano", "fulano@email.com", "fulano123"),
	("u002", "Beltrana", "beltrana@email.com", "beltrana00");







-------------------------------------------------------------

----------VISUALIZAÇÃO DAS TABLES
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM likes_dislikes;
-------------------------------------------------------------

----------DELETE DAS TABLES
DROP TABLE users;
DROP TABLE posts;
DROP TABLE like_dislikes;
-------------------------------------------------------------