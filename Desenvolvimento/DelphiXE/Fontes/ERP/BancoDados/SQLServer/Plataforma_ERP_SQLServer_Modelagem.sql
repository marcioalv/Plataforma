--
-- Seleciona banco de dados!
--
USE [PlataformaERP]
GO

--
-- Apaga foreign keys.
--
IF OBJECT_ID('tipo_usuario_log_fk_log_usuario')    IS NOT NULL ALTER TABLE [tipo_usuario_log]    DROP CONSTRAINT [tipo_usuario_log_fk_log_usuario]
IF OBJECT_ID('perfil_usuario_log_fk_log_usuario')  IS NOT NULL ALTER TABLE [perfil_usuario_log]  DROP CONSTRAINT [perfil_usuario_log_fk_log_usuario]
IF OBJECT_ID('numerador_licenca_fk_ins_usuario')   IS NOT NULL ALTER TABLE [numerador_licenca]   DROP CONSTRAINT [numerador_licenca_fk_ins_usuario]
IF OBJECT_ID('numerador_licenca_fk_upd_usuario')   IS NOT NULL ALTER TABLE [numerador_licenca]   DROP CONSTRAINT [numerador_licenca_fk_upd_usuario]

--
-- Apaga tabelas.
--
IF OBJECT_ID('usuario_log')        IS NOT NULL DROP TABLE [usuario_log]
IF OBJECT_ID('usuario')            IS NOT NULL DROP TABLE [usuario]
IF OBJECT_ID('tipo_usuario_log')   IS NOT NULL DROP TABLE [tipo_usuario_log]
IF OBJECT_ID('tipo_usuario')       IS NOT NULL DROP TABLE [tipo_usuario]
IF OBJECT_ID('perfil_usuario_log') IS NOT NULL DROP TABLE [perfil_usuario_log]
IF OBJECT_ID('perfil_usuario')     IS NOT NULL DROP TABLE [perfil_usuario]
IF OBJECT_ID('numerador_licenca')  IS NOT NULL DROP TABLE [numerador_licenca]
IF OBJECT_ID('licenca')            IS NOT NULL DROP TABLE [licenca]
IF OBJECT_ID('base')               IS NOT NULL DROP TABLE [base]
IF OBJECT_ID('rotina_aplicacao')   IS NOT NULL DROP TABLE [rotina_aplicacao]
IF OBJECT_ID('registro_acao')      IS NOT NULL DROP TABLE [registro_acao]
IF OBJECT_ID('numerador')          IS NOT NULL DROP TABLE [numerador]
IF OBJECT_ID('log_ocorrencia')     IS NOT NULL DROP TABLE [log_ocorrencia]
GO

--
-- Log de ocorr�ncias.
--
CREATE TABLE [dbo].[log_ocorrencia] (
  [log_ocorrencia_base_id] SMALLINT                                  NOT NULL,
  [log_ocorrencia_id]      BIGINT                                    NOT NULL,
  [log_licenca_id]         INT                                       NOT NULL,
  [log_local_dt_hr]        DATETIME                                  NOT NULL,
  [log_server_dt_hr]       DATETIME                                  NOT NULL,
  [registro_acao_id]       TINYINT                                   NOT NULL,
  [host_name]              VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]              VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id]    SMALLINT                                  NOT NULL,
  [log_usuario_id]         INT                                       NOT NULL,
  [id]                     INT                                       NOT NULL,
  [codigo]                 VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [tabela]                 VARCHAR(50)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [mensagem]               VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]                  VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [log_ocorrencia_pk] PRIMARY KEY CLUSTERED ([log_ocorrencia_base_id], [log_ocorrencia_id]),
)
GO
CREATE INDEX [log_ocorrencia_ix_log_local_dt_hr] ON [log_ocorrencia] ([log_local_dt_hr], [log_usuario_base_id], [log_usuario_id], [id], [codigo], [log_ocorrencia_base_id], [log_ocorrencia_id])
GO
CREATE INDEX [log_ocorrencia_ix_log_usuario] ON [log_ocorrencia] ([log_usuario_base_id], [log_usuario_id], [log_local_dt_hr], [id], [codigo], [log_ocorrencia_base_id], [log_ocorrencia_id])
GO

--
-- Numerador.
--
CREATE TABLE [dbo].[numerador] (
  [codigo]              VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [atual_id]            INT                                      NOT NULL,
  [bloqueado]           CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]               CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]     DATETIME                                 NOT NULL,
  [ins_server_dt_hr]    DATETIME                                 NOT NULL,
  [upd_local_dt_hr]     DATETIME                                 NULL,
  [upd_server_dt_hr]    DATETIME                                 NULL,
  [upd_contador]        INT                                      NOT NULL,
 
  CONSTRAINT [numerador_pk] PRIMARY KEY CLUSTERED ([codigo]),

  CONSTRAINT [numerador_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [numerador_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),
)
GO

--
-- Tipos de a��es com registros.
--
CREATE TABLE [dbo].[registro_acao] (
  [registro_acao_id] TINYINT                                  NOT NULL,
  [codigo]           VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
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
  [upd_contador]     INT                                      NOT NULL,
  
  CONSTRAINT [registro_acao_pk]        PRIMARY KEY CLUSTERED ([registro_acao_id]),
  CONSTRAINT [registro_acao_ix_codigo] UNIQUE ([codigo]),

  CONSTRAINT [registro_acao_ck_criacao]   CHECK ([criacao]   IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_consulta]  CHECK ([consulta]  IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_alteracao] CHECK ([alteracao] IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_exclusao]  CHECK ([exclusao]  IN ('S', 'N')),  
  CONSTRAINT [registro_acao_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [registro_acao_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Rotinas da aplica��o.
--
CREATE TABLE [dbo].[rotina_aplicacao] (
  [rotina_aplicacao_id] SMALLINT                                  NOT NULL,
  [codigo]              VARCHAR(25)                               NOT NULL,
  [descricao]           VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [chave]               VARCHAR(50)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]           CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]               CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]     DATETIME                                  NOT NULL,
  [ins_server_dt_hr]    DATETIME                                  NOT NULL,
  [upd_local_dt_hr]     DATETIME                                  NULL,
  [upd_server_dt_hr]    DATETIME                                  NULL,
  [upd_contador]        INT                                       NOT NULL,
  
  CONSTRAINT [rotina_aplicacao_pk]        PRIMARY KEY CLUSTERED ([rotina_aplicacao_id]),
  CONSTRAINT [rotina_aplicacao_ix_codigo] UNIQUE ([codigo]),
  CONSTRAINT [rotina_aplicacao_ix_chave]  UNIQUE ([chave]),

  CONSTRAINT [rotina_aplicacao_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [rotina_aplicacao_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
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
-- Licen�as de uso da aplica��o.
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
-- Numerador por licen�a.
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
-- Perfis de usu�rio.
--
CREATE TABLE [dbo].[perfil_usuario] (
  [licenca_id]             INT                                       NOT NULL,
  [perfil_usuario_base_id] SMALLINT                                  NOT NULL,
  [perfil_usuario_id]      TINYINT                                   NOT NULL,
  [codigo]                 VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]              VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]              CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                  CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]        DATETIME                                  NOT NULL,
  [ins_server_dt_hr]       DATETIME                                  NOT NULL,
  [upd_local_dt_hr]        DATETIME                                  NULL,
  [upd_server_dt_hr]       DATETIME                                  NULL,
  [upd_contador]           INT                                       NOT NULL,
 
  CONSTRAINT [perfil_usuario_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]),
  CONSTRAINT [perfil_usuario_ix_codigo] UNIQUE                ([licenca_id], [codigo],  [perfil_usuario_base_id]),

  CONSTRAINT [perfil_usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [perfil_usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [perfil_usuario_fk_base]    FOREIGN KEY ([perfil_usuario_base_id]) REFERENCES [base]    ([base_id]),
  CONSTRAINT [perfil_usuario_fk_licenca] FOREIGN KEY ([licenca_id])             REFERENCES [licenca] ([licenca_id])
)
GO

--
-- Log dos registros de perfis de usu�rio.
--
CREATE TABLE [dbo].[perfil_usuario_log] (
  [licenca_id]             INT                                       NOT NULL,
  [perfil_usuario_base_id] SMALLINT                                  NOT NULL,
  [perfil_usuario_id]      TINYINT                                   NOT NULL,
  [perfil_usuario_log_sq]  INT                                       NOT NULL,
  [log_base_id]            SMALLINT                                  NOT NULL,
  [log_local_dt_hr]        DATETIME                                  NOT NULL,
  [log_server_dt_hr]       DATETIME                                  NOT NULL,
  [registro_acao_id]       TINYINT                                   NOT NULL,
  [host_name]              VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]              VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id]    SMALLINT                                  NOT NULL,
  [log_usuario_id]         INT                                       NOT NULL,
  [mensagem]               VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]                  VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [perfil_usuario_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id], [perfil_usuario_log_sq]),

  CONSTRAINT [perfil_usuario_log_fk_perfil_usuario] FOREIGN KEY ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]) REFERENCES [perfil_usuario]  ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]),
  CONSTRAINT [perfil_usuario_log_fk_log_base]       FOREIGN KEY ([log_base_id])                                               REFERENCES [base]          ([base_id]),
  CONSTRAINT [perfil_usuario_log_fk_registro_acao]  FOREIGN KEY ([registro_acao_id])                                          REFERENCES [registro_acao] ([registro_acao_id]),
)
GO

--
-- Tipos de usu�rio.
--
CREATE TABLE [dbo].[tipo_usuario] (
  [licenca_id]           INT                                       NOT NULL,
  [tipo_usuario_base_id] SMALLINT                                  NOT NULL,
  [tipo_usuario_id]      TINYINT                                   NOT NULL,
  [codigo]               VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]            VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_contador]         INT                                       NOT NULL,
 
  CONSTRAINT [tipo_usuario_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_ix_codigo] UNIQUE                ([licenca_id], [codigo],  [tipo_usuario_base_id]),

  CONSTRAINT [tipo_usuario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [tipo_usuario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [tipo_usuario_fk_base]    FOREIGN KEY ([tipo_usuario_base_id]) REFERENCES [base]    ([base_id]),
  CONSTRAINT [tipo_usuario_fk_licenca] FOREIGN KEY ([licenca_id])           REFERENCES [licenca] ([licenca_id])
)
GO

--
-- Log dos registros de tipos de usu�rio.
--
CREATE TABLE [dbo].[tipo_usuario_log] (
  [licenca_id]           INT                                       NOT NULL,
  [tipo_usuario_base_id] SMALLINT                                  NOT NULL,
  [tipo_usuario_id]      TINYINT                                   NOT NULL,
  [tipo_usuario_log_sq]  INT                                       NOT NULL,
  [log_base_id]          SMALLINT                                  NOT NULL,
  [log_local_dt_hr]      DATETIME                                  NOT NULL,
  [log_server_dt_hr]     DATETIME                                  NOT NULL,
  [registro_acao_id]     TINYINT                                   NOT NULL,
  [host_name]            VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [user_name]            VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI  NOT NULL,
  [log_usuario_base_id]  SMALLINT                                  NOT NULL,
  [log_usuario_id]       INT                                       NOT NULL,
  [mensagem]             VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [dados]                VARCHAR(MAX) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
 
  CONSTRAINT [tipo_usuario_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id], [tipo_usuario_log_sq]),

  CONSTRAINT [tipo_usuario_log_fk_tipo_usuario]  FOREIGN KEY ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]) REFERENCES [tipo_usuario]  ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]),
  CONSTRAINT [tipo_usuario_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                           REFERENCES [base]          ([base_id]),
  CONSTRAINT [tipo_usuario_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                      REFERENCES [registro_acao] ([registro_acao_id]),
)
GO

--
-- Usu�rios.
--
CREATE TABLE [dbo].[usuario] (
  [licenca_id]           INT                                       NOT NULL,
  [usuario_base_id]      SMALLINT                                  NOT NULL,
  [usuario_id]           INT                                       NOT NULL,
  [codigo]               VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [nome]                 VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [logon]                VARCHAR(50)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [tipo_usuario_base_id] SMALLINT                                  NOT NULL,
  [tipo_usuario_id]      TINYINT                                   NOT NULL,
  [senha_exigir]         CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [senha_trocar]         CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [senha]                VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [automato]             CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [administrador]        CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_contador]         INT                                       NOT NULL,
 
  CONSTRAINT [usuario_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [usuario_ix_codigo] UNIQUE                ([licenca_id], [codigo],          [usuario_base_id]),

  CONSTRAINT [usuario_ck_exigir_senha]  CHECK ([senha_exigir]  IN ('S', 'N')),
  CONSTRAINT [usuario_ck_trocar_senha]  CHECK ([senha_trocar]  IN ('S', 'N')),
  CONSTRAINT [usuario_ck_automato]      CHECK ([automato]      IN ('S', 'N')),
  CONSTRAINT [usuario_ck_administrador] CHECK ([administrador] IN ('S', 'N')),
  CONSTRAINT [usuario_ck_bloqueado]     CHECK ([bloqueado]     IN ('S', 'N')),
  CONSTRAINT [usuario_ck_ativo]         CHECK ([ativo]         IN ('S', 'N')),

  CONSTRAINT [usuario_fk_tipo_usuario] FOREIGN KEY ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]) REFERENCES [tipo_usuario] ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id])
)
GO

--
-- Log dos registros de usu�rio.
--
CREATE TABLE [dbo].[usuario_log] (
  [licenca_id]          INT                                       NOT NULL,
  [usuario_base_id]     SMALLINT                                  NOT NULL,
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
 
  CONSTRAINT [usuario_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [usuario_base_id], [usuario_id], [usuario_log_sq]),

  CONSTRAINT [usuario_log_fk_usuario]       FOREIGN KEY ([licenca_id], [usuario_base_id], [usuario_id])         REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [usuario_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [usuario_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [usuario_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- A��es com registros.
--
INSERT INTO [registro_acao] VALUES (1, '01', 'Cria��o',   'S', 'N', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (2, '02', 'Consulta',  'N', 'S', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (3, '03', 'Altera��o', 'N', 'N', 'S', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (4, '04', 'Exclus�o',  'N', 'N', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador] VALUES ('registro_acao_id', 4, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Rotinas da aplica��o.
--
EXECUTE Plataforma_ERP_SQLServer_RotinaAplicacao_Inserir

--
-- Base padr�o.
--
INSERT INTO [base] VALUES (1, '01', 'Base central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base] VALUES (2, '02', 'Outra base',   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador] VALUES ('base_id', 2, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Licen�a padr�o.
--
INSERT INTO [licenca] VALUES (1, 'ABC.123.DEF.456', 'Licen�a central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador] VALUES ('licenca_id', 1, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Perfis de usu�rio.
--
INSERT INTO [perfil_usuario]     VALUES (1, 1, 1, '01', 'Tester da aplica��o', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [perfil_usuario_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [numerador_licenca]  VALUES (1, 1, 'perfil_usuario_id', 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Tipos de usu�rio padr�es.
--
INSERT INTO [tipo_usuario]      VALUES (1, 1, 1, '01', 'Administrador da aplica��o', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 2, '02', 'Consultor da aplica��o', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 3, '03', 'Gestor da aplica��o', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'tipo_usuario_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Usu�rio.
--
INSERT INTO [usuario]     VALUES (1, 1, 1, '000.001', 'Administrador do sistema', 'administrador', 1, 1, 'S', 'N', '', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [usuario]     VALUES (1, 1, 2, '000.002', 'Marcio Alves', 'marcio.alves', 1, 1, 'S', 'N', '123', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [usuario]     VALUES (1, 1, 3, '000.003', 'Fernanda Margarete Vieira', 'fernanda.vieira', 1, 1, 'S', 'N', '123', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instala��o!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'usuario_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Chave estrangeira do tipo de usu�rio para o usu�rio.
--
ALTER TABLE [tipo_usuario_log]   ADD CONSTRAINT [tipo_usuario_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
ALTER TABLE [perfil_usuario_log] ADD CONSTRAINT [perfil_usuario_log_fk_log_usuario] FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])

ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_ins_usuario] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_upd_usuario] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
