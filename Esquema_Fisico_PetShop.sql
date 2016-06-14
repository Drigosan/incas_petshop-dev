CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
    cpf VARCHAR(50) NOT NULL UNIQUE,
    rg VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    tel_res VARCHAR(50) NOT NULL,
    tel_cel VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    data_nascimento VARCHAR(50)
);

CREATE TABLE usuario (
    id_usuario INT NOT NULL PRIMARY KEY,
    usuario_nome VARCHAR(35) NOT NULL,
    usuario_senha VARCHAR(35),
    usuario_tipo VARCHAR(50)
);

CREATE TABLE veterinario (
    id_veterinario INT NOT NULL PRIMARY KEY,
    nome_veterinario VARCHAR(50) NOT NULL,
    data_nascimento VARCHAR(25),
    especialidade VARCHAR(50)
);

CREATE TABLE fornecedor (
    id_fornecedor INT NOT NULL PRIMARY KEY,
    nome_fornecedor VARCHAR(50),
    endereco VARCHAR(100),
    cnpj VARCHAR(25) NOT NULL
);

CREATE TABLE animal (
    id_animal INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    raca VARCHAR(50) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    id_cliente INT NOT NULL,
    data_nascimento VARCHAR(50),
    sexo VARCHAR(3),
    peso VARCHAR(20),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE agenda_banho_tosa (
    id_servico INT NOT NULL PRIMARY KEY,
	servico_idanimal INT NOT NULL,
    turno VARCHAR(50),
    data_servico DATE,
    transporte VARCHAR(100),
    servico VARCHAR(50),
	FOREIGN KEY (servico_idanimal) REFERENCES animal (id_animal)
    
);

CREATE TABLE agenda (
    id_consulta INT NOT NULL PRIMARY KEY,
    consulta_idanimal INT NOT NULL,
    turno VARCHAR(50),
    consulta_idvet INT NOT NULL,
    data_consulta DATE,
    motivo_consulta VARCHAR(100),
    status_consulta VARCHAR(25),
    transporte VARCHAR(50) NOT NULL,
	FOREIGN KEY (consulta_idanimal) REFERENCES animal (id_animal),
	FOREIGN KEY (consulta_idvet) REFERENCES veterinario (id_veterinario)
);

CREATE TABLE venda (
    id_venda INT NOT NULL PRIMARY KEY,
    data_venda VARCHAR(25),
    valor_venda NUMERIC NOT NULL,
    id_cliente INT,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE produto (
    id_produto INT NOT NULL PRIMARY KEY,
    nome_produto VARCHAR(50),
    preco_compra NUMERIC NOT NULL,
    preco_venda NUMERIC NOT NULL,
    quantidade INT NOT NULL,
    id_fornecedor INT NOT NULL,
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE itens_venda_produto (
    id_venda INT,
    id_produto INT,
    quantidade_produto INT,
	FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
	FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);