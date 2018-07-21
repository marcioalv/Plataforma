--
-- Seleciona banco de dados!
--
USE [PlataformaERP]
GO

--
-- Apaga tabelas.
--
IF OBJECT_ID('usuario')           IS NOT NULL DROP TABLE [usuario]
IF OBJECT_ID('tipo_usuario_log')  IS NOT NULL DROP TABLE [tipo_usuario_log]
IF OBJECT_ID('tipo_usuario')      IS NOT NULL DROP TABLE [tipo_usuario]
IF OBJECT_ID('numerador_licenca') IS NOT NULL DROP TABLE [numerador_licenca]
IF OBJECT_ID('licenca')           IS NOT NULL DROP TABLE [licenca]
IF OBJECT_ID('base')              IS NOT NULL DROP TABLE [base]
IF OBJECT_ID('registro_acao')     IS NOT NULL DROP TABLE [registro_acao]
GO

--
-- Tipos de ações com registros.
--
CREATE TABLE [dbo].[registro_acao] (
  [registro_acao_id] TINYINT                                  NOT NULL,
  [titulo]           VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [Criacao]          CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [Consulta]         CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [Alteracao]        CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [Exclusao]         CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
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
  [titulo]           VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [seq_upd]          INT                                       NOT NULL,

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
  [titulo]           VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [seq_upd]          INT                                       NOT NULL,

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
  [base_id]             SMALLINT                                 NOT NULL,
  [licenca_id]          INT                                      NOT NULL,
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
 
  CONSTRAINT [numerador_licenca_pk] PRIMARY KEY CLUSTERED ([base_id], [licenca_id], [codigo]),

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
  [base_id]          SMALLINT                                  NOT NULL,
  [licenca_id]       INT                                       NOT NULL,
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
 
  CONSTRAINT [tipo_usuario_pk]        PRIMARY KEY CLUSTERED ([base_id], [licenca_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_ix_codigo] UNIQUE                ([base_id], [licenca_id], [codigo]),

  CONSTRAINT [tipo_usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [tipo_usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [tipo_usuario_fk_base]    FOREIGN KEY ([base_id])    REFERENCES [base] ([base_id]),
  CONSTRAINT [tipo_usuario_fk_licenca] FOREIGN KEY ([licenca_id]) REFERENCES [licenca] ([licenca_id])
)
GO

--
-- Log dos registros de tipos de usuário.
--
CREATE TABLE [dbo].[tipo_usuario_log] (
  [base_id]             SMALLINT                                  NOT NULL,
  [licenca_id]          INT                                       NOT NULL,
  [tipo_usuario_id]     TINYINT                                   NOT NULL,
  [tipo_usuario_log_sq] INT                                       NOT NULL,
  [log_base_id]         SMALLINT                                  NOT NULL,
  [log_local_dt_hr]     DATETIME                                  NOT NULL,
  [log_server_dt_hr]    DATETIME                                  NOT NULL,
  [registro_acao_id]    TINYINT                                   NOT NULL,
  [host_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]           VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [usuario_base_id]     SMALLINT                                  NOT NULL,
  [usuario_id]          INT                                       NOT NULL,
  [mensagem]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]               VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [tipo_usuario_log_pk] PRIMARY KEY CLUSTERED ([base_id], [licenca_id], [tipo_usuario_id], [tipo_usuario_log_sq]),

  CONSTRAINT [tipo_usuario_log_fk_usuario_log]   FOREIGN KEY ([base_id], [licenca_id], [tipo_usuario_id]) REFERENCES [tipo_usuario]  ([base_id], [licenca_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                         REFERENCES [registro_acao] ([registro_acao_id]),

  CONSTRAINT [tipo_usuario_log_fk_tipo_usuario]  FOREIGN KEY ([base_id], [licenca_id], [tipo_usuario_id]) REFERENCES [tipo_usuario] ([base_id], [licenca_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_log_fk_tipo_log_base] FOREIGN KEY ([log_base_id])                              REFERENCES [base]         ([base_id])
)
GO

--
-- Usuários.
--
CREATE TABLE [dbo].[usuario] (
  [base_id]          SMALLINT                                  NOT NULL,
  [licenca_id]       INT                                       NOT NULL,
  [usuario_id]       INT                                       NOT NULL,
  [codigo]           VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [nome]             VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                  NOT NULL,
  [ins_server_dt_hr] DATETIME                                  NOT NULL,
  [upd_local_dt_hr]  DATETIME                                  NULL,
  [upd_server_dt_hr] DATETIME                                  NULL,
  [upd_contador]     INT                                       NOT NULL,
 
  CONSTRAINT [usuario_pk]        PRIMARY KEY CLUSTERED ([base_id], [licenca_id], [usuario_id]),
  CONSTRAINT [usuario_ix_codigo] UNIQUE                ([base_id], [licenca_id], [codigo]),

  CONSTRAINT [usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [usuario_fk_base]    FOREIGN KEY ([base_id])    REFERENCES [base] ([base_id]),
  CONSTRAINT [usuario_fk_licenca] FOREIGN KEY ([licenca_id]) REFERENCES [licenca] ([licenca_id])
)
GO

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
-- Licençã padrão.
--
INSERT INTO [licenca] VALUES (1, 'ABC.123.DEF.456', 'Licença central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Tipos de usuário padrões.
--
INSERT INTO [tipo_usuario]      VALUES (1, 1, 1, '01', 'Administrador da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (2, 1, 1, '01', 'Outra base', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (2, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 2, '02', 'Gestor da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, 'ws049', 'chokito', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'tipo_usuario_id', 2, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Usuário.
--
INSERT INTO [usuario] VALUES (1, 1, 1, '000.001', 'Administrador do sistema', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Chave estrangeira do tipo de usuário para o usuário.
--
--> ALTER TABLE [tipo_usuario_log]  ADD CONSTRAINT [tipo_usuario_log_fk_usuario]  FOREIGN KEY ([usuario_base_id], [licenca_id], [usuario_id]) REFERENCES [usuario] ([base_id], [licenca_id], ,[usuario_id])
--> ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_ins_usuario] FOREIGN KEY ([ins_usuario_base_id], [licenca_id], [ins_usuario_id]) REFERENCES [usuario] ([base_id], [licenca_id], ,[usuario_id])
--> ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_upd_usuario] FOREIGN KEY ([upd_usuario_base_id], [licenca_id], [upd_usuario_id]) REFERENCES [usuario] ([base_id], [licenca_id], ,[usuario_id])