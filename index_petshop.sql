

CREATE INDEX idx_usuario_login_senha ON usuario USING btree (usuario_nome,usuario_senha);