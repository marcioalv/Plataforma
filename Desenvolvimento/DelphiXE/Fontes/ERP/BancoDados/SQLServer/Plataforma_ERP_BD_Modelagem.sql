--
-- Seleciona banco de dados!
--
USE [PlataformaERP]
GO

--
-- Apaga foreign keys.
--
ALTER TABLE [tipo_usuario_log]  DROP CONSTRAINT [tipo_usuario_log_fk_log_usuario]
ALTER TABLE [numerador_licenca] DROP CONSTRAINT [numerador_licenca_fk_ins_usuario]
ALTER TABLE [numerador_licenca] DROP CONSTRAINT [numerador_licenca_fk_upd_usuario]

--
-- Apaga tabelas.
--
IF OBJECT_ID('usuario_log')       IS NOT NULL DROP TABLE [usuario_log]
IF OBJECT_ID('usuario')           IS NOT NULL DROP TABLE [usuario]
IF OBJECT_ID('tipo_usuario_log')  IS NOT NULL DROP TABLE [tipo_usuario_log]
IF OBJECT_ID('tipo_usuario')      IS NOT NULL DROP TABLE [tipo_usuario]
IF OBJECT_ID('numerador_licenca') IS NOT NULL DROP TABLE [numerador_licenca]
IF OBJECT_ID('licenca')           IS NOT NULL DROP TABLE [licenca]
IF OBJECT_ID('base')              IS NOT NULL DROP TABLE [base]
IF OBJECT_ID('registro_acao')     IS NOT NULL DROP TABLE [registro_acao]
IF OBJECT_ID('base_modelagem')    IS NOT NULL DROP TABLE [base_modelagem]
IF OBJECT_ID('log_ocorrencia')    IS NOT NULL DROP TABLE [log_ocorrencia]
GO

--
-- Log de ocorrências.
--
CREATE TABLE [dbo].[log_ocorrencia] (
  [base_id]             SMALLINT                                  NOT NULL,
  [log_ocorrencia_id]   BIGINT                                    NOT NULL,
  [log_licenca_id]      INT                                       NOT NULL,
  [log_local_dt_hr]     DATETIME                                  NOT NULL,
  [log_server_dt_hr]    DATETIME                                  NOT NULL,
  [registro_acao_id]    TINYINT                                   NOT NULL,
  [host_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id] SMALLINT                                  NOT NULL,
  [log_usuario_id]      INT                                       NOT NULL,
  [id]                  INT                                       NOT NULL,
  [mensagem]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]               VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [log_ocorrencia_pk] PRIMARY KEY CLUSTERED ([base_id], [log_ocorrencia_id]),
)
GO
CREATE INDEX [log_ocorrencia_ix_log_local_dt_hr] ON [log_ocorrencia] ([log_local_dt_hr], [log_usuario_base_id], [log_usuario_id], [base_id], [log_ocorrencia_id])
GO
CREATE INDEX [log_ocorrencia_ix_log_usuario] ON [log_ocorrencia] ([log_usuario_base_id], [log_usuario_id], [log_local_dt_hr], [base_id], [log_ocorrencia_id])
GO

--
-- Modelagem da base de dados.
--
CREATE TABLE [dbo].[base_modelagem] (
  [tabela]           VARCHAR(50)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [tabela_sq]        TINYINT                                   NOT NULL,
  [coluna]           VARCHAR(50)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]        VARCHAR(255) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [seq_upd]          INT                                       NOT NULL,

  CONSTRAINT [base_modelagem_pk]        PRIMARY KEY CLUSTERED ([tabela], [tabela_sq]),
  CONSTRAINT [base_modelagem_ix_coluna] UNIQUE                ([tabela], [coluna]),

  CONSTRAINT [base_modelagem_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [base_modelagem_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)

--
-- Tipos de ações com registros.
--
CREATE TABLE [dbo].[registro_acao] (
  [registro_acao_id] TINYINT                                  NOT NULL,
  [descricao]        VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [criacao]          CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [consulta]         CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [alteracao]        CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [exclusao]         CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                 NOT NULL,
  [ins_server_dt_hr] DATETIME                                 NOT NULL,
  [upd_local_dt_hr]  DATETIME                                 NULL,
  [upd_server_dt_hr] DATETIME                                 NULL,
  [seq_upd]          INT                                      NOT NULL,
  
  CONSTRAINT [registro_acao_pk] PRIMARY KEY CLUSTERED ([registro_acao_id]),

  CONSTRAINT [registro_acao_ck_criacao]   CHECK ([criacao]   IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_consulta]  CHECK ([consulta]  IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_alteracao] CHECK ([alteracao] IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_exclusao]  CHECK ([exclusao]  IN ('S', 'N')),  
  CONSTRAINT [registro_acao_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Bases de dados.
--
CREATE TABLE [dbo].[base] (
  [base_id]          SMALLINT                                  NOT NULL,
  [codigo]           VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]        VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [upd_contador]     INT                                       NOT NULL,

  CONSTRAINT [base_pk] PRIMARY KEY CLUSTERED ([base_id]),
  CONSTRAINT [base_ix_codigo] UNIQUE         ([codigo]),

  CONSTRAINT [base_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [base_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Licenças de uso da aplicação.
--
CREATE TABLE [dbo].[licenca] (
  [licenca_id]       INT                                       NOT NULL,
  [codigo]           VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]        VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [upd_contador]     INT                                       NOT NULL,

  CONSTRAINT [licenca_pk]        PRIMARY KEY CLUSTERED ([licenca_id]),
  CONSTRAINT [licenca_ix_codigo] UNIQUE                ([codigo]),

  CONSTRAINT [licenca_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [licenca_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Numerador por licença.
--
CREATE TABLE [dbo].[numerador_licenca] (
  [licenca_id]          INT                                      NOT NULL,
  [base_id]             SMALLINT                                 NOT NULL,
  [codigo]              VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [atual_id]            INT                                      NOT NULL,
  [bloqueado]           CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]               CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]     DATETIME                                 NOT NULL,
  [ins_server_dt_hr]    DATETIME                                 NOT NULL,
  [ins_usuario_base_id] SMALLINT                                 NOT NULL,
  [ins_usuario_id]      INT                                      NOT NULL,
  [upd_local_dt_hr]     DATETIME                                 NULL,
  [upd_server_dt_hr]    DATETIME                                 NULL,
  [upd_usuario_base_id] SMALLINT                                 NULL,
  [upd_usuario_id]      INT                                      NULL,
  [upd_contador]        INT                                      NOT NULL,
 
  CONSTRAINT [numerador_licenca_pk] PRIMARY KEY CLUSTERED ([licenca_id], [base_id], [codigo]),

  CONSTRAINT [numerador_licenca_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [numerador_licenca_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [numerador_licenca_fk_base]    FOREIGN KEY ([base_id])    REFERENCES [base]    ([base_id]),
  CONSTRAINT [numerador_licenca_fk_licenca] FOREIGN KEY ([licenca_id]) REFERENCES [licenca] ([licenca_id])
)
GO

--
-- Tipos de usuário.
--
CREATE TABLE [dbo].[tipo_usuario] (
  [licenca_id]       INT                                       NOT NULL,
  [base_id]          SMALLINT                                  NOT NULL,
  [tipo_usuario_id]  TINYINT                                   NOT NULL,
  [codigo]           VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]        VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [upd_contador]     INT                                       NOT NULL,
 
  CONSTRAINT [tipo_usuario_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [base_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_ix_codigo] UNIQUE                ([licenca_id], [codigo],  [base_id]),

  CONSTRAINT [tipo_usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [tipo_usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [tipo_usuario_fk_base]    FOREIGN KEY ([base_id])    REFERENCES [base]    ([base_id]),
  CONSTRAINT [tipo_usuario_fk_licenca] FOREIGN KEY ([licenca_id]) REFERENCES [licenca] ([licenca_id])
)
GO

--
-- Log dos registros de tipos de usuário.
--
CREATE TABLE [dbo].[tipo_usuario_log] (
  [licenca_id]          INT                                       NOT NULL,
  [base_id]             SMALLINT                                  NOT NULL,
  [tipo_usuario_id]     TINYINT                                   NOT NULL,
  [tipo_usuario_log_sq] INT                                       NOT NULL,
  [log_base_id]         SMALLINT                                  NOT NULL,
  [log_local_dt_hr]     DATETIME                                  NOT NULL,
  [log_server_dt_hr]    DATETIME                                  NOT NULL,
  [registro_acao_id]    TINYINT                                   NOT NULL,
  [host_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id] SMALLINT                                  NOT NULL,
  [log_usuario_id]      INT                                       NOT NULL,
  [mensagem]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]               VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [tipo_usuario_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [base_id], [tipo_usuario_id], [tipo_usuario_log_sq]),

  CONSTRAINT [tipo_usuario_log_fk_tipo_usuario]  FOREIGN KEY ([licenca_id], [base_id], [tipo_usuario_id])            REFERENCES [tipo_usuario]  ([licenca_id], [base_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [tipo_usuario_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
)
GO

--
-- Usuários.
--
CREATE TABLE [dbo].[usuario] (
  [licenca_id]           INT                                       NOT NULL,
  [base_id]              SMALLINT                                  NOT NULL,
  [usuario_id]           INT                                       NOT NULL,
  [codigo]               VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [nome]                 VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [tipo_usuario_base_id] SMALLINT                                  NOT NULL,
  [tipo_usuario_id]      TINYINT                                   NOT NULL,
  [bloqueado]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_contador]         INT                                       NOT NULL,
 
  CONSTRAINT [usuario_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [base_id], [usuario_id]),
  CONSTRAINT [usuario_ix_codigo] UNIQUE                ([licenca_id], [codigo],  [base_id]),

  CONSTRAINT [usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [usuario_fk_base]         FOREIGN KEY ([base_id])                                               REFERENCES [base]         ([base_id]),
  CONSTRAINT [usuario_fk_licenca]      FOREIGN KEY ([licenca_id])                                            REFERENCES [licenca]      ([licenca_id]),
  CONSTRAINT [usuario_fk_tipo_usuario] FOREIGN KEY ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]) REFERENCES [tipo_usuario] ([licenca_id], [base_id], [tipo_usuario_id])
)
GO

--
-- Log dos registros de usuário.
--
CREATE TABLE [dbo].[usuario_log] (
  [licenca_id]          INT                                       NOT NULL,
  [base_id]             SMALLINT                                  NOT NULL,
  [usuario_id]          INT                                       NOT NULL,
  [usuario_log_sq]      INT                                       NOT NULL,
  [log_base_id]         SMALLINT                                  NOT NULL,
  [log_local_dt_hr]     DATETIME                                  NOT NULL,
  [log_server_dt_hr]    DATETIME                                  NOT NULL,
  [registro_acao_id]    TINYINT                                   NOT NULL,
  [host_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id] SMALLINT                                  NOT NULL,
  [log_usuario_id]      INT                                       NOT NULL,
  [mensagem]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]               VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [usuario_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [base_id], [usuario_id], [usuario_log_sq]),

  CONSTRAINT [usuario_log_fk_usuario]       FOREIGN KEY ([licenca_id], [base_id], [usuario_id])                 REFERENCES [usuario]       ([licenca_id], [base_id], [usuario_id]),
  CONSTRAINT [usuario_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [usuario_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [usuario_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [base_id], [usuario_id])
)
GO

--
-- Modelagem da base de dados.
--
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   1, 'licenca_id',       'ID da licença de uso da aplicação',                                       'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   2, 'base_id',          'ID da base dados da aplicação',                                           'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   3, 'tipo_usuario_id',  'ID do tipo de usuário da aplicação',                                      'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   4, 'codigo',           'Código do tipo de usuário da aplicação',                                  'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   5, 'descricao',        'Descrição do tipo de usuário da aplicação',                               'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   6, 'bloqueado',        'Flag S/N indicando se o tipo de usuário está bloqueado para novos dados', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   7, 'ativo',            'Flag S/N indicando se o tipo de usuário está ativo e pode ser utilizado', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   8, 'ins_local_dt_hr',  'Data e hora de insert do registro no computador do cliente',              'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',   9, 'ins_server_dt_hr', 'Data e hora de insert do registro no servidor da base de dados',          'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',  10, 'upd_local_dt_hr',  'Data e hora do último update no registro no computador do cliente',       'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',  11, 'upd_server_dt_hr', 'Data e hora do último update no servidor da base de dados',               'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario',  12, 'upd_contador',     'Contador da quantidade de updates que o registro sofreu',                 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   1, 'licenca_id',          'ID da licença de uso da aplicação',                                    'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   2, 'base_id',             'ID da base dados da aplicação',                                        'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   3, 'tipo_usuario_id',     'ID do tipo de usuário da aplicação',                                   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   4, 'tipo_usuario_log_sq', 'Sequencial do log para aquele tipo de usuário',                        'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   5, 'log_base_id',         'ID da base de dados onde o registro foi alterado e gerou o log',       'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   6, 'log_local_dt_hr',     'Data e hora de insert do registro no computador do cliente',           'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   7, 'log_server_dt_hr',    'Data e hora de insert do registro no servidor da base de dados',       'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   8, 'registro_acao_id',    'ID do tipo da ação ocorrida no registro',                              'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',   9, 'host_name',           'Nome do computador onde a aplicação foi executada',                    'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',  10, 'user_name',           'Nome do usuário de rede no computador onde a aplicação foi executada', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',  11, 'usuario_base_id',     'ID da base de dados onde o registro do usuário foi criado',            'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',  12, 'usuario_id',          'ID do usuário da aplicação que gerou o log',                           'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',  13, 'mensagem',            'Mensagem do log',                                                      'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('tipo_usuario_log',  14, 'dados',               'Dados manipulados pela operação que gerou o log',                      'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [base_modelagem] VALUES ('usuario',   1, 'licenca_id',           'ID da licença de uso da aplicação',                                 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   2, 'base_id',              'ID da base dados da aplicação',                                     'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   3, 'usuario_id',           'ID do usuário da aplicação',                                        'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   4, 'codigo',               'Código do usuário da aplicação',                                    'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   5, 'nome',                 'Nome do usuário da aplicação',                                      'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   6, 'tipo_usuario_base_id', 'ID da base dados do tipo de usuário',                               'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   7, 'tipo_usuario_id',      'ID do tipo de usuário',                                             'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   8, 'bloqueado',            'Flag S/N indicando se o usuário está bloqueado para novos dados',   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',   9, 'ativo',                'Flag S/N indicando se o usuário está ativo e pode ser utilizado',   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',  10, 'ins_local_dt_hr',      'Data e hora de insert do registro no computador do cliente',        'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',  11, 'ins_server_dt_hr',     'Data e hora de insert do registro no servidor da base de dados',    'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',  12, 'upd_local_dt_hr',      'Data e hora do último update no registro no computador do cliente', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',  13, 'upd_server_dt_hr',     'Data e hora do último update no servidor da base de dados',         'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base_modelagem] VALUES ('usuario',  14, 'upd_contador',         'Contador da quantidade de updates que o registro sofreu',           'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Ações com registros.
--
INSERT INTO [registro_acao] VALUES (1, 'Criação',   'S', 'N', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (2, 'Consulta',  'N', 'S', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (3, 'Alteração', 'N', 'N', 'S', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (4, 'Exclusão',  'N', 'N', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Base padrão.
--
INSERT INTO [base] VALUES (1, '01', 'Base central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base] VALUES (2, '02', 'Outra base',   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Licença padrão.
--
INSERT INTO [licenca] VALUES (1, 'ABC.123.DEF.456', 'Licença central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Tipos de usuário padrões.
--
INSERT INTO [tipo_usuario]      VALUES (1, 1, 1, '01', 'Administrador da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 2, 1, '01', 'Outra base', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 2, 1, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 2, '02', 'Gestor da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'tipo_usuario_id', 2, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Usuário.
--
INSERT INTO [usuario]     VALUES (1, 1, 1, '000.001', 'Administrador do sistema', 2, 1, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

--
-- Chave estrangeira do tipo de usuário para o usuário.
--
ALTER TABLE [tipo_usuario_log]  ADD CONSTRAINT [tipo_usuario_log_fk_log_usuario]  FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario] ([licenca_id], [base_id], [usuario_id])
ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_ins_usuario] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario] ([licenca_id], [base_id], [usuario_id])
ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_upd_usuario] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario] ([licenca_id], [base_id], [usuario_id])

