CREATE DATABASE loja_moveis;
USE loja_moveis;

-- =========================
-- TABELA MORADIA
-- =========================
CREATE TABLE tb_moradia (
    CEP CHAR(8) PRIMARY KEY,
    endereco CHAR(30)
);

-- =========================
-- TABELA CLIENTE
-- =========================
CREATE TABLE tb_cliente (
    CPF CHAR(11) PRIMARY KEY,
    nome CHAR(30),
    dt_nascimento SMALLDATETIME,
    fk_tb_moradia_CEP CHAR(8),

    CONSTRAINT fk_cliente_moradia
    FOREIGN KEY (fk_tb_moradia_CEP)
    REFERENCES tb_moradia(CEP)
);

-- =========================
-- TABELA FUNCIONARIO
-- =========================
CREATE TABLE tb_funcionario (
    matricula INT PRIMARY KEY,
    nome CHAR(30),
    dt_nascimento SMALLDATETIME
);

-- =========================
-- TABELA TIPO
-- =========================
CREATE TABLE tb_tipo (
    tipo_do_movel INT PRIMARY KEY,
    movel CHAR(30)
);

-- =========================
-- TABELA MOVEL
-- =========================
CREATE TABLE tb_movel (
    cd_movel INT PRIMARY KEY,
    preco DECIMAL(10,2),
    fk_tb_tipo_tipo_do_movel INT,

    CONSTRAINT fk_movel_tipo
    FOREIGN KEY (fk_tb_tipo_tipo_do_movel)
    REFERENCES tb_tipo(tipo_do_movel)
);

-- =========================
-- TABELA FABRICA
-- =========================
CREATE TABLE tb_fabrica (
    cd_fabrica INT PRIMARY KEY,
    fabrica CHAR(30)
);

-- =========================
-- TABELA RELACIONAL
-- =========================
CREATE TABLE tb_rl_movel_fabrica (
    fk_tb_fabrica_cd_fabrica INT,
    fk_tb_movel_cd_movel INT,

    PRIMARY KEY (
        fk_tb_fabrica_cd_fabrica,
        fk_tb_movel_cd_movel
    ),

    CONSTRAINT fk_rl_fabrica
    FOREIGN KEY (fk_tb_fabrica_cd_fabrica)
    REFERENCES tb_fabrica(cd_fabrica),

    CONSTRAINT fk_rl_movel
    FOREIGN KEY (fk_tb_movel_cd_movel)
    REFERENCES tb_movel(cd_movel)
);

-- =========================
-- TABELA VENDA
-- =========================
CREATE TABLE tb_venda (
    nr_venda INT PRIMARY KEY,
    dt_venda SMALLDATETIME,
    preco_total DECIMAL(10,2),

    fk_tb_cliente_CPF CHAR(11),
    fk_tb_funcionario_matricula INT,
    fk_tb_movel_cd_movel INT,

    CONSTRAINT fk_venda_cliente
    FOREIGN KEY (fk_tb_cliente_CPF)
    REFERENCES tb_cliente(CPF),

    CONSTRAINT fk_venda_funcionario
    FOREIGN KEY (fk_tb_funcionario_matricula)
    REFERENCES tb_funcionario(matricula),

    CONSTRAINT fk_venda_movel
    FOREIGN KEY (fk_tb_movel_cd_movel)
    REFERENCES tb_movel(cd_movel)
);