CREATE TABLE `Cursos` (
	`codigo` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`dia` DATE,
	`horario` DATETIME,
	`titulo` TEXT(65535),
	`tema` TEXT(65535),
	`id-prof` INTEGER NOT NULL,
	`id-curso` INTEGER NOT NULL,
	`id-sala` INTEGER NOT NULL,
	PRIMARY KEY(`id-curso`)
);


CREATE TABLE `patrocinador` (
	`cpnj` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` TEXT(65535),
	`tipo` VARCHAR(255),
	`id-patrocinador` INTEGER NOT NULL,
	PRIMARY KEY(`id-patrocinador`)
);


CREATE TABLE `professor` (
	`id-prof` INTEGER NOT NULL,
	`cpf` VARCHAR(255) NOT NULL UNIQUE,
	`telefone` TEXT(65535),
	`email` TEXT(65535),
	`endereço` TEXT(65535),
	`Qnt-Cursos` INTEGER,
	`nome` TEXT(65535),
	PRIMARY KEY(`id-prof`)
);


CREATE TABLE `participante` (
	`cpf` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`nome` TEXT(65535),
	`telefone` TEXT(65535),
	`email` TEXT(65535),
	`curso` TEXT(65535),
	`endereço` TEXT(65535),
	`id-participante` INTEGER NOT NULL,
	PRIMARY KEY(`id-participante`)
);


CREATE TABLE `sala` (
	`numero` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`Qtd-Lugares` INTEGER,
	`id-sala` INTEGER NOT NULL,
	PRIMARY KEY(`id-sala`)
);


CREATE TABLE `Curso_Sala` (
	`id-curso` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`id-sala` INTEGER NOT NULL
);


CREATE TABLE `Curso_Participante` (
	`id-participante` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`id-curso` INTEGER NOT NULL
);


CREATE TABLE `Curso_Patrocinador` (
	`id-curso` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`id-patrocinador` INTEGER NOT NULL
);


ALTER TABLE `professor`
ADD FOREIGN KEY(`id-prof`) REFERENCES `Cursos`(`id-prof`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `sala`
ADD FOREIGN KEY(`id-sala`) REFERENCES `Cursos`(`id-sala`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `sala`
ADD FOREIGN KEY(`id-sala`) REFERENCES `Curso_Sala`(`id-sala`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Cursos`
ADD FOREIGN KEY(`id-curso`) REFERENCES `Curso_Sala`(`id-curso`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `participante`
ADD FOREIGN KEY(`id-participante`) REFERENCES `Curso_Participante`(`id-participante`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Cursos`
ADD FOREIGN KEY(`id-curso`) REFERENCES `Curso_Participante`(`id-curso`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `patrocinador`
ADD FOREIGN KEY(`id-patrocinador`) REFERENCES `Curso_Patrocinador`(`id-patrocinador`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Cursos`
ADD FOREIGN KEY(`id-curso`) REFERENCES `Curso_Patrocinador`(`id-curso`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
