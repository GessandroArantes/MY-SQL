CREATE DATABASE senai;

USE senai;

CREATE TABLE aluno (
ra_alun INT PRIMARY KEY AUTO_INCREMENT,
nome_alun VARCHAR(255) NOT NULL,
dt_nasc_alun DATE,
cpf_alun CHAR(14) UNIQUE NOT NULL,
sexo_alun CHAR(1) 
);

CREATE TABLE curso (
cod_curso INT PRIMARY KEY,
nome_curs VARCHAR(255) NOT NULL,
per_curs VARCHAR(20),
dur_curs INT,
valor_curso DECIMAL(10,2)
);

CREATE TABLE matricula (
    cod_mat INT PRIMARY KEY AUTO_INCREMENT,
    ra_alun INT NOT NULL,
    cod_curso INT NOT NULL,
    data_mat DATE,
    CONSTRAINT FK_AlunoMatricula FOREIGN KEY (ra_alun) REFERENCES aluno(ra_alun),
    CONSTRAINT FK_CursoMatricula FOREIGN KEY (cod_curso) REFERENCES curso(cod_curso)
);

INSERT INTO aluno (ra_alun, nome_alun, dt_nasc_alun, cpf_alun, sexo_alun)
VALUES (01, 'Ana Silva', '2000-05-15', '111.111.111-11', 'F'),
       (02, 'Bruno Costa', '1999-08-22', '222.222.222-22', 'M'),
       (03, 'Carla Souza', '2001-01-10', '333.333.333-33', 'F'),
       (04, 'Diego Oliveira', '1998-12-05', '444.444.444-44', 'M'),
       (05, 'Elena Pires', '2002-03-30', '555.555.555-55', 'F'),
       (06, 'Fabio Santos', '2000-07-12', '666.666.666-66', 'M'),
       (07, 'Gisele Lima', '1997-11-25', '777.777.777-77', 'F'),
       (08, 'Hugo Rocha', '2001-09-09', '888.888.888-88', 'M'),
       (09, 'Iara Mendes', '1999-04-18', '999.999.999-99', 'F'),
       (10, 'João Vitor', '2002-06-21', '123.456.789-10', 'M');

INSERT INTO curso (cod_curso, nome_curs, per_curs, dur_curs, valor_curso)
VALUES (1, 'Engenharia de Software', 'Noturno', 10, 1200.00),
       (2, 'Administração', 'Matutino', 8, 850.00),
       (3, 'Direito', 'Integral', 10, 1500.00),
       (4, 'Medicina', 'Integral', 12, 8500.00),
       (5, 'Design Gráfico', 'Vespertino', 4, 700.00);

INSERT INTO matricula (cod_mat, ra_alun, cod_curso, data_mat)
VALUES (01, 01, 1, '2024-02-01'), (02, 02, 1, '2024-02-01'),
       (03, 03, 2, '2024-02-02'), (04, 04, 2, '2024-02-02'),
       (05, 05, 3, '2024-02-03'), (06, 06, 3, '2024-02-03'),
       (07, 07, 4, '2024-02-04'), (08, 08, 4, '2024-02-04'),
       (09, 09, 5, '2024-02-05'), (10, 10, 5, '2024-02-05'),
       (11, 01, 2, '2024-02-06'), (12, 03, 1, '2024-02-06'),
       (13, 05, 5, '2024-02-07'), (14, 07, 2, '2024-02-07'),
       (15, 09, 3, '2024-02-08'), (16, 02, 4, '2024-02-08'),
       (17, 04, 1, '2024-02-09'), (18, 06, 5, '2024-02-09'),
       (19, 08, 3, '2024-02-10'), (20, 10, 1, '2024-02-10'); 
		
SELECT * FROM aluno;
               
SELECT * FROM curso;

SELECT * FROM matricula;

               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               