CREATE TABLE IF NOT EXISTS fivemscript_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    value INT NOT NULL,
    UNIQUE KEY unique_player (player_id)
);

INSERT INTO fivemscript_data (player_id, value) VALUES (1, 100);