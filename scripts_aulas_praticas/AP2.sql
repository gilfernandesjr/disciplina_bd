CREATE DATABASE IF NOT EXISTS teste
	DEFAULT CHARSET = utf8
	DEFAULT COLLATE = utf8_general_ci;
    
SHOW CREATE DATABASE teste;

ALTER DATABASE teste CHARSET = latin1;
SHOW CREATE DATABASE teste;

DROP DATABASE teste;

-- -------------------------------------------

CREATE DATABASE IF NOT EXISTS biblioteca
	DEFAULT CHARSET = utf8
	DEFAULT COLLATE = utf8_general_ci;
    
SHOW CREATE DATABASE biblioteca;