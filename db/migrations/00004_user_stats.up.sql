BEGIN;

CREATE TABLE user_stats (
  id serial primary key,
  user_id varchar,
  games int DEFAULT 0,
  wins int DEFAULT 0,
  top5 int DEFAULT 0,
  kills int DEFAULT 0,
  created_at timestamptz DEFAULT current_timestamp,
  updated_at timestamptz DEFAULT NULL,
  CONSTRAINT user_stats_user_id FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TRIGGER user_stats_updated_at
  BEFORE UPDATE OR INSERT ON user_stats
  FOR EACH ROW
  EXECUTE PROCEDURE set_updated_at();

COMMIT;
