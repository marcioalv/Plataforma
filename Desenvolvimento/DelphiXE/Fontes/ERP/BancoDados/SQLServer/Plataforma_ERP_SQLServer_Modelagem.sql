--
-- Seleciona banco de dados!
--
USE [PlataformaERP]
GO

--
-- Apaga foreign keys.
--
IF OBJECT_ID('tipo_usuario_log_fk_log_usuario')   IS NOT NULL ALTER TABLE [tipo_usuario_log]    DROP CONSTRAINT [tipo_usuario_log_fk_log_usuario]
IF OBJECT_ID('perfil_usuario_log_fk_log_usuario') IS NOT NULL ALTER TABLE [perfil_usuario_log]  DROP CONSTRAINT [perfil_usuario_log_fk_log_usuario]
IF OBJECT_ID('numerador_licenca_fk_ins_usuario')  IS NOT NULL ALTER TABLE [numerador_licenca]   DROP CONSTRAINT [numerador_licenca_fk_ins_usuario]
IF OBJECT_ID('numerador_licenca_fk_upd_usuario')  IS NOT NULL ALTER TABLE [numerador_licenca]   DROP CONSTRAINT [numerador_licenca_fk_upd_usuario]
GO

--
-- Apaga tabelas.
--
IF OBJECT_ID('local_log')                       IS NOT NULL DROP TABLE [local_log]
IF OBJECT_ID('local')                           IS NOT NULL DROP TABLE [local]
IF OBJECT_ID('coligada_log')                    IS NOT NULL DROP TABLE [coligada_log]
IF OBJECT_ID('coligada')                        IS NOT NULL DROP TABLE [coligada]
IF OBJECT_ID('filial_endereco_log')             IS NOT NULL DROP TABLE [filial_endereco_log]
IF OBJECT_ID('filial_endereco')                 IS NOT NULL DROP TABLE [filial_endereco]
IF OBJECT_ID('filial_log')                      IS NOT NULL DROP TABLE [filial_log]
IF OBJECT_ID('filial')                          IS NOT NULL DROP TABLE [filial]
IF OBJECT_ID('empresa_log')                     IS NOT NULL DROP TABLE [empresa_log]
IF OBJECT_ID('empresa')                         IS NOT NULL DROP TABLE [empresa]
IF OBJECT_ID('regime_tributario')               IS NOT NULL DROP TABLE [regime_tributario]
IF OBJECT_ID('pessoa')                          IS NOT NULL DROP TABLE [pessoa]
IF OBJECT_ID('usuario_perfil')                  IS NOT NULL DROP TABLE [usuario_perfil]
IF OBJECT_ID('usuario_log')                     IS NOT NULL DROP TABLE [usuario_log]
IF OBJECT_ID('usuario')                         IS NOT NULL DROP TABLE [usuario]
IF OBJECT_ID('tipo_usuario_log')                IS NOT NULL DROP TABLE [tipo_usuario_log]
IF OBJECT_ID('tipo_usuario')                    IS NOT NULL DROP TABLE [tipo_usuario]
IF OBJECT_ID('perfil_usuario_rotina_aplicacao') IS NOT NULL DROP TABLE [perfil_usuario_rotina_aplicacao]
IF OBJECT_ID('perfil_usuario_log')              IS NOT NULL DROP TABLE [perfil_usuario_log]
IF OBJECT_ID('perfil_usuario')                  IS NOT NULL DROP TABLE [perfil_usuario]
IF OBJECT_ID('numerador_licenca')               IS NOT NULL DROP TABLE [numerador_licenca]
IF OBJECT_ID('licenca')                         IS NOT NULL DROP TABLE [licenca]
IF OBJECT_ID('rotina_aplicacao')                IS NOT NULL DROP TABLE [rotina_aplicacao]
IF OBJECT_ID('registro_acao')                   IS NOT NULL DROP TABLE [registro_acao]
IF OBJECT_ID('numerador_base')                  IS NOT NULL DROP TABLE [numerador_base]
IF OBJECT_ID('base')                            IS NOT NULL DROP TABLE [base]
IF OBJECT_ID('aplicacao_base')                  IS NOT NULL DROP TABLE [aplicacao_base]
IF OBJECT_ID('log_ocorrencia')                  IS NOT NULL DROP TABLE [log_ocorrencia]
GO

--
-- Log de ocorrências.
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
-- Configurações da base de dados instalada.
--
CREATE TABLE [dbo].[aplicacao_base] (
  [base_id]          SMALLINT NOT NULL,
  [ins_local_dt_hr]  DATETIME NOT NULL,
  [ins_server_dt_hr] DATETIME NOT NULL,
  [upd_local_dt_hr]  DATETIME NULL,
  [upd_server_dt_hr] DATETIME NULL,
  [upd_contador]     INT      NOT NULL,
  CONSTRAINT [aplicacao_base_pk] PRIMARY KEY CLUSTERED ([base_id])
)

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
-- Numerador por base.
--
CREATE TABLE [dbo].[numerador_base] (
  [codigo]           VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [atual_id]         INT                                      NOT NULL,
  [bloqueado]        CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                 NOT NULL,
  [ins_server_dt_hr] DATETIME                                 NOT NULL,
  [upd_local_dt_hr]  DATETIME                                 NULL,
  [upd_server_dt_hr] DATETIME                                 NULL,
  [upd_contador]     INT                                      NOT NULL,
 
  CONSTRAINT [numerador_base_pk] PRIMARY KEY CLUSTERED ([codigo]),

  CONSTRAINT [numerador_base_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [numerador_base_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),
)
GO

--
-- Tipos de ações com registros.
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
  CONSTRAINT [registro_acao_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),
)
GO

--
-- Rotinas da aplicação.
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
  CONSTRAINT [rotina_aplicacao_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),
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
-- Perfis de usuário.
--
CREATE TABLE [dbo].[perfil_usuario] (
  [licenca_id]             INT                                       NOT NULL,
  [perfil_usuario_base_id] SMALLINT                                  NOT NULL,
  [perfil_usuario_id]      SMALLINT                                  NOT NULL,
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
-- Log dos registros de perfis de usuário.
--
CREATE TABLE [dbo].[perfil_usuario_log] (
  [licenca_id]             INT                                       NOT NULL,
  [perfil_usuario_base_id] SMALLINT                                  NOT NULL,
  [perfil_usuario_id]      SMALLINT                                  NOT NULL,
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
-- Rotinas dos perfis de usuário.
--
CREATE TABLE [dbo].[perfil_usuario_rotina_aplicacao] (
  [licenca_id]                         INT      NOT NULL,
  [perfil_usuario_base_id]             SMALLINT NOT NULL,
  [perfil_usuario_id]                  SMALLINT NOT NULL,
  [perfil_usuario_rotina_aplicacao_sq] SMALLINT NOT NULL,
  [rotina_aplicacao_id]                SMALLINT NOT NULL,
 
  CONSTRAINT [perfil_usuario_rotina_aplicacao_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id], [perfil_usuario_rotina_aplicacao_sq]),
  CONSTRAINT [perfil_usuario_rotina_aplicacao_ix_codigo] UNIQUE                ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id], [rotina_aplicacao_id]),

  CONSTRAINT [perfil_usuario_rotina_aplicacao_fk_perfil_usuario]   FOREIGN KEY ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]) REFERENCES [perfil_usuario]   ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]),
  CONSTRAINT [perfil_usuario_rotina_aplicacao_fk_rotina_aplicacao] FOREIGN KEY ([rotina_aplicacao_id])                                       REFERENCES [rotina_aplicacao] ([rotina_aplicacao_id])
)
GO

--
-- Tipos de usuário.
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
-- Log dos registros de tipos de usuário.
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
-- Usuários.
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
  [vigencia]             CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [vigencia_ini_dt_hr]   DATETIME                                  NULL,
  [vigencia_fim_dt_hr]   DATETIME                                  NULL,
  [senha_exigir]         CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [senha_trocar]         CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [senha]                VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
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
  CONSTRAINT [usuario_ck_administrador] CHECK ([administrador] IN ('S', 'N')),
  CONSTRAINT [usuario_ck_bloqueado]     CHECK ([bloqueado]     IN ('S', 'N')),
  CONSTRAINT [usuario_ck_ativo]         CHECK ([ativo]         IN ('S', 'N')),

  CONSTRAINT [usuario_fk_tipo_usuario] FOREIGN KEY ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id]) REFERENCES [tipo_usuario] ([licenca_id], [tipo_usuario_base_id], [tipo_usuario_id])
)
GO

--
-- Log dos registros de usuário.
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
-- Perfis de usuário.
--
CREATE TABLE [dbo].[usuario_perfil] (
  [licenca_id]             INT      NOT NULL,
  [usuario_base_id]        SMALLINT NOT NULL,
  [usuario_id]             INT      NOT NULL,
  [usuario_perfil_sq]      SMALLINT NOT NULL,
  [perfil_usuario_base_id] SMALLINT NOT NULL,
  [perfil_usuario_id]      SMALLINT NOT NULL,
 
  CONSTRAINT [usuario_perfil_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [usuario_base_id], [usuario_id], [usuario_perfil_sq]),
  CONSTRAINT [usuario_perfil_ix_perfil] UNIQUE NONCLUSTERED ([licenca_id], [usuario_base_id], [usuario_id], [perfil_usuario_base_id], [perfil_usuario_id]),

  CONSTRAINT [usuario_perfil_fk_usuario]        FOREIGN KEY ([licenca_id], [usuario_base_id],        [usuario_id])        REFERENCES [usuario]        ([licenca_id], [usuario_base_id],        [usuario_id]),
  CONSTRAINT [usuario_perfil_fk_perfil_usuario] FOREIGN KEY ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id]) REFERENCES [perfil_usuario] ([licenca_id], [perfil_usuario_base_id], [perfil_usuario_id])
)
GO

--
-- Pessoa.
--
CREATE TABLE [pessoa] (
  [pessoa_id]        TINYINT                                  NOT NULL,
  [codigo]           VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]        VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [fisica]           CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [juridica]         CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [governo]          CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]        CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]  DATETIME                                 NOT NULL,
  [ins_server_dt_hr] DATETIME                                 NOT NULL,
  [upd_local_dt_hr]  DATETIME                                 NULL,
  [upd_server_dt_hr] DATETIME                                 NULL,
  [upd_contador]     INT                                      NOT NULL,
  
  CONSTRAINT [pessoa_pk]        PRIMARY KEY CLUSTERED ([pessoa_id]),
  CONSTRAINT [pessoa_ix_codigo] UNIQUE ([codigo]),

  CONSTRAINT [pessoa_ck_fisica]    CHECK ([fisica]    IN ('S', 'N')),
  CONSTRAINT [pessoa_ck_juridica]  CHECK ([juridica]  IN ('S', 'N')),
  CONSTRAINT [pessoa_ck_governo]   CHECK ([governo]   IN ('S', 'N')),
  CONSTRAINT [pessoa_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [pessoa_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Regime tributário.
--
CREATE TABLE [regime_tributario] (
  [regime_tributario_id] TINYINT                                  NOT NULL,
  [codigo]               VARCHAR(25) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]            VARCHAR(50) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [simples]              CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [real]                 CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [presumido]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [arbitrado]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]            CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)     COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                 NOT NULL,
  [ins_server_dt_hr]     DATETIME                                 NOT NULL,
  [upd_local_dt_hr]      DATETIME                                 NULL,
  [upd_server_dt_hr]     DATETIME                                 NULL,
  [upd_contador]         INT                                      NOT NULL,
  
  CONSTRAINT [regime_tributario_pk]        PRIMARY KEY CLUSTERED ([regime_tributario_id]),
  CONSTRAINT [regime_tributario_ix_codigo] UNIQUE ([codigo]),

  CONSTRAINT [regime_tributario_ck_simples]   CHECK ([simples]   IN ('S', 'N')),
  CONSTRAINT [regime_tributario_ck_real]      CHECK ([real]      IN ('S', 'N')),
  CONSTRAINT [regime_tributario_ck_presumido] CHECK ([presumido] IN ('S', 'N')),
  CONSTRAINT [regime_tributario_ck_arbitrado] CHECK ([arbitrado] IN ('S', 'N')),
  CONSTRAINT [regime_tributario_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [regime_tributario_ck_ativo]     CHECK ([ativo]     IN ('S', 'N'))
)
GO

--
-- Empresa.
--
CREATE TABLE [empresa] (
  [licenca_id]           INT                                       NOT NULL,
  [empresa_base_id]      SMALLINT                                  NOT NULL,
  [empresa_id]           SMALLINT                                  NOT NULL,
  [codigo]               VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [regime_tributario_id] TINYINT                                   NOT NULL,
  [bloqueado]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [ins_usuario_base_id]  SMALLINT                                  NOT NULL,
  [ins_usuario_id]       INT                                       NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_usuario_base_id]  SMALLINT                                  NULL,
  [upd_usuario_id]       INT                                       NULL,
  [upd_contador]         INT                                       NOT NULL,
  
  CONSTRAINT [empresa_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [empresa_base_id], [empresa_id]),
  CONSTRAINT [empresa_ix_codigo] UNIQUE ([licenca_id], [codigo], [empresa_base_id]),

  CONSTRAINT [empresa_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [empresa_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [empresa_fk_lincenca]          FOREIGN KEY ([licenca_id])                                          REFERENCES [licenca]           ([licenca_id]),
  CONSTRAINT [empresa_fk_base]              FOREIGN KEY ([empresa_base_id])                                     REFERENCES [base]              ([base_id]),
  CONSTRAINT [empresa_fk_regime_tributario] FOREIGN KEY ([regime_tributario_id])                                REFERENCES [regime_tributario] ([regime_tributario_id]),
  CONSTRAINT [empresa_fk_usuario_ins]       FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [empresa_fk_usuario_upd]       FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Log das empresas.
--
CREATE TABLE [dbo].[empresa_log] (
  [licenca_id]          INT                                       NOT NULL,
  [empresa_base_id]     SMALLINT                                  NOT NULL,
  [empresa_id]          SMALLINT                                  NOT NULL,
  [empresa_log_sq]      INT                                       NOT NULL,
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
 
  CONSTRAINT [empresa_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [empresa_base_id], [empresa_id], [empresa_log_sq]),

  CONSTRAINT [empresa_log_fk_empresa]       FOREIGN KEY ([licenca_id], [empresa_base_id], [empresa_id])         REFERENCES [empresa]       ([licenca_id], [empresa_base_id], [empresa_id]),
  CONSTRAINT [empresa_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [empresa_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [empresa_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Filial.
--
CREATE TABLE [filial] (
  [licenca_id]           INT                                       NOT NULL,
  [filial_base_id]       SMALLINT                                  NOT NULL,
  [filial_id]            SMALLINT                                  NOT NULL,
  [codigo]               VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]            VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [razao_social]         VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [fantasia]             VARCHAR(100) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [cpf_cnpj]             VARCHAR(20)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [empresa_base_id]      SMALLINT                                  NOT NULL,
  [empresa_id]           SMALLINT                                  NOT NULL,
  [regime_tributario_id] TINYINT                                   NOT NULL,
  [bloqueado]            CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]                CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [ins_usuario_base_id]  SMALLINT                                  NOT NULL,
  [ins_usuario_id]       INT                                       NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_usuario_base_id]  SMALLINT                                  NULL,
  [upd_usuario_id]       INT                                       NULL,
  [upd_contador]         INT                                       NOT NULL,
  
  CONSTRAINT [filial_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [filial_base_id], [filial_id]),
  CONSTRAINT [filial_ix_codigo] UNIQUE ([licenca_id], [codigo], [filial_base_id]),

  CONSTRAINT [filial_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [filial_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [filial_fk_lincenca]          FOREIGN KEY ([licenca_id])                                          REFERENCES [licenca]           ([licenca_id]),
  CONSTRAINT [filial_fk_base]              FOREIGN KEY ([filial_base_id])                                      REFERENCES [base]              ([base_id]),
  CONSTRAINT [filial_fk_empresa]           FOREIGN KEY ([licenca_id], [empresa_base_id], [empresa_id])         REFERENCES [empresa]           ([licenca_id], [empresa_base_id], [empresa_id]),
  CONSTRAINT [filial_fk_regime_tributario] FOREIGN KEY ([regime_tributario_id])                                REFERENCES [regime_tributario] ([regime_tributario_id]),
  CONSTRAINT [filial_fk_usuario_ins]       FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [filial_fk_usuario_upd]       FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Log das filiais.
--
CREATE TABLE [dbo].[filial_log] (
  [licenca_id]          INT                                       NOT NULL,
  [filial_base_id]      SMALLINT                                  NOT NULL,
  [filial_id]           SMALLINT                                  NOT NULL,
  [filial_log_sq]       INT                                       NOT NULL,
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
 
  CONSTRAINT [filial_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [filial_base_id], [filial_id], [filial_log_sq]),

  CONSTRAINT [filial_log_fk_empresa]       FOREIGN KEY ([licenca_id], [filial_base_id], [filial_id]  )         REFERENCES [filial]        ([licenca_id], [filial_base_id], [filial_id]),
  CONSTRAINT [filial_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [filial_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [filial_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Endereço da filial.
--
CREATE TABLE [filial_endereco] (
  [licenca_id]           INT                                       NOT NULL,
  [filial_base_id]       SMALLINT                                  NOT NULL,
  [filial_id]            SMALLINT                                  NOT NULL,
  [filial_endereco_sq]   SMALLINT                                  NOT NULL,
  [vigencia_ini_dt]      DATETIME                                  NOT NULL,
  [vigencia_fim_dt]      DATETIME                                  NOT NULL,
  [ins_local_dt_hr]      DATETIME                                  NOT NULL,
  [ins_server_dt_hr]     DATETIME                                  NOT NULL,
  [ins_usuario_base_id]  SMALLINT                                  NOT NULL,
  [ins_usuario_id]       INT                                       NOT NULL,
  [upd_local_dt_hr]      DATETIME                                  NULL,
  [upd_server_dt_hr]     DATETIME                                  NULL,
  [upd_usuario_base_id]  SMALLINT                                  NULL,
  [upd_usuario_id]       INT                                       NULL,
  [upd_contador]         INT                                       NOT NULL,
  
  CONSTRAINT [filial_endereco_pk]          PRIMARY KEY CLUSTERED ([licenca_id], [filial_base_id], [filial_id], [filial_endereco_sq]),
  CONSTRAINT [filial_endereco_ix_vigencia] UNIQUE ([licenca_id], [filial_base_id], [filial_id], [vigencia_ini_dt], [vigencia_fim_dt]),

  CONSTRAINT [filial_endereco_fk_filial]      FOREIGN KEY ([licenca_id], [filial_base_id], [filial_id])           REFERENCES [filial]  ([licenca_id], [filial_base_id],  [filial_id]),
  CONSTRAINT [filial_endereco_fk_usuario_ins] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [filial_endereco_fk_usuario_upd] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Log do endereço da filial.
--
CREATE TABLE [filial_endereco_log] (
  [licenca_id]          INT                                       NOT NULL,
  [filial_base_id]      SMALLINT                                  NOT NULL,
  [filial_id]           SMALLINT                                  NOT NULL,
  [filial_endereco_log_sq]       INT                              NOT NULL,
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
 
  CONSTRAINT [filial_endereco_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [filial_base_id], [filial_id], [filial_endereco_log_sq]),

  CONSTRAINT [filial_endereco_log_fk_empresa]       FOREIGN KEY ([licenca_id], [filial_base_id], [filial_id])           REFERENCES [filial]        ([licenca_id], [filial_base_id], [filial_id]),
  CONSTRAINT [filial_endereco_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [filial_endereco_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [filial_endereco_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Coligada.
--
CREATE TABLE [coligada] (
  [licenca_id]          INT                                       NOT NULL,
  [coligada_base_id]    SMALLINT                                  NOT NULL,
  [coligada_id]         SMALLINT                                  NOT NULL,
  [codigo]              VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]           VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]           CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]               CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]     DATETIME                                  NOT NULL,
  [ins_server_dt_hr]    DATETIME                                  NOT NULL,
  [ins_usuario_base_id] SMALLINT                                  NOT NULL,
  [ins_usuario_id]      INT                                       NOT NULL,
  [upd_local_dt_hr]     DATETIME                                  NULL,
  [upd_server_dt_hr]    DATETIME                                  NULL,
  [upd_usuario_base_id] SMALLINT                                  NULL,
  [upd_usuario_id]      INT                                       NULL,
  [upd_contador]        INT                                       NOT NULL,
  
  CONSTRAINT [coligada_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [coligada_base_id], [coligada_id]),
  CONSTRAINT [coligada_ix_codigo] UNIQUE ([licenca_id], [codigo], [coligada_base_id]),

  CONSTRAINT [coligada_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [coligada_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [coligada_fk_lincenca]    FOREIGN KEY ([licenca_id])                                          REFERENCES [licenca]           ([licenca_id]),
  CONSTRAINT [coligada_fk_base]        FOREIGN KEY ([coligada_base_id])                                    REFERENCES [base]              ([base_id]),
  CONSTRAINT [coligada_fk_usuario_ins] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [coligada_fk_usuario_upd] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Log das coligadas.
--
CREATE TABLE [dbo].[coligada_log] (
  [licenca_id]          INT                                       NOT NULL,
  [coligada_base_id]    SMALLINT                                  NOT NULL,
  [coligada_id]         SMALLINT                                  NOT NULL,
  [coligada_log_sq]     INT                                       NOT NULL,
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
 
  CONSTRAINT [coligada_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [coligada_base_id], [coligada_id], [coligada_log_sq]),

  CONSTRAINT [coligada_log_fk_coligada]      FOREIGN KEY ([licenca_id], [coligada_base_id], [coligada_id])       REFERENCES [coligada]      ([licenca_id], [coligada_base_id], [coligada_id]),
  CONSTRAINT [coligada_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [coligada_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [coligada_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Local.
--
CREATE TABLE [local] (
  [licenca_id]          INT                                       NOT NULL,
  [local_base_id]       SMALLINT                                  NOT NULL,
  [local_id]            SMALLINT                                  NOT NULL,
  [codigo]              VARCHAR(25)  COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [descricao]           VARCHAR(250) COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [bloqueado]           CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ativo]               CHAR(1)      COLLATE LATIN1_GENERAL_CI_AI NOT NULL,
  [ins_local_dt_hr]     DATETIME                                  NOT NULL,
  [ins_server_dt_hr]    DATETIME                                  NOT NULL,
  [ins_usuario_base_id] SMALLINT                                  NOT NULL,
  [ins_usuario_id]      INT                                       NOT NULL,
  [upd_local_dt_hr]     DATETIME                                  NULL,
  [upd_server_dt_hr]    DATETIME                                  NULL,
  [upd_usuario_base_id] SMALLINT                                  NULL,
  [upd_usuario_id]      INT                                       NULL,
  [upd_contador]        INT                                       NOT NULL,
  
  CONSTRAINT [local_pk]        PRIMARY KEY CLUSTERED ([licenca_id], [local_base_id], [local_id]),
  CONSTRAINT [local_ix_codigo] UNIQUE ([licenca_id], [codigo], [local_base_id]),

  CONSTRAINT [local_ck_bloqueado] CHECK ([bloqueado] IN ('S', 'N')),
  CONSTRAINT [local_ck_ativo]     CHECK ([ativo]     IN ('S', 'N')),

  CONSTRAINT [local_fk_lincenca]    FOREIGN KEY ([licenca_id])                                          REFERENCES [licenca]           ([licenca_id]),
  CONSTRAINT [local_fk_base]        FOREIGN KEY ([local_base_id])                                       REFERENCES [base]              ([base_id]),
  CONSTRAINT [local_fk_usuario_ins] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id]),
  CONSTRAINT [local_fk_usuario_upd] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario]           ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

--
-- Log dos locais.
--
CREATE TABLE [dbo].[local_log] (
  [licenca_id]          INT                                       NOT NULL,
  [local_base_id]       SMALLINT                                  NOT NULL,
  [local_id]            SMALLINT                                  NOT NULL,
  [local_log_sq]        INT                                       NOT NULL,
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
 
  CONSTRAINT [local_log_pk] PRIMARY KEY CLUSTERED ([licenca_id], [local_base_id], [local_id], [local_log_sq]),

  CONSTRAINT [local_log_fk_empresa]       FOREIGN KEY ([licenca_id], [local_base_id], [local_id])             REFERENCES [local]         ([licenca_id], [local_base_id], [local_id]),
  CONSTRAINT [local_log_fk_log_base]      FOREIGN KEY ([log_base_id])                                         REFERENCES [base]          ([base_id]),
  CONSTRAINT [local_log_fk_registro_acao] FOREIGN KEY ([registro_acao_id])                                    REFERENCES [registro_acao] ([registro_acao_id]),
  CONSTRAINT [local_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario]       ([licenca_id], [usuario_base_id], [usuario_id])
)
GO

-------------------------------------------------------------------------------------------------------------
-- DADOS TESTE ----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

--
-- Base de dados da instalação da aplicação.
--
INSERT INTO [aplicacao_base] VALUES (1, GETDATE(), GETDATE(), NULL, NULL, 0)
GO

--
-- Bases de dados.
--
INSERT INTO [base] VALUES (1, '01', 'Base central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [base] VALUES (2, '02', 'Outra base',   'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador_base] VALUES ('base_id', 2, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Ações com registros.
--
INSERT INTO [registro_acao] VALUES (1, '01', 'Criação',   'S', 'N', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (2, '02', 'Consulta',  'N', 'S', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (3, '03', 'Alteração', 'N', 'N', 'S', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [registro_acao] VALUES (4, '04', 'Exclusão',  'N', 'N', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador_base] VALUES ('registro_acao_id', 4, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Rotinas da aplicação.
--
EXECUTE Plataforma_ERP_SQLServer_RotinaAplicacao_Inserir

--
-- Licença padrão.
--
INSERT INTO [licenca] VALUES (1, 'ABC.123.DEF.456', 'Licença central', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

INSERT INTO [numerador_base] VALUES ('licenca_id', 1, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)

--
-- Perfis de usuário.
--
INSERT INTO [perfil_usuario]     VALUES (1, 1, 1, '01', 'Tester da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [perfil_usuario_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca]  VALUES (1, 1, 'perfil_usuario_id', 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Tipos de usuário padrões.
--
INSERT INTO [tipo_usuario]      VALUES (1, 1, 1, '01', 'Administrador da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 2, '02', 'Consultor da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [tipo_usuario]      VALUES (1, 1, 3, '03', 'Gestor da aplicação', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [tipo_usuario_log]  VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'tipo_usuario_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Usuário.
--
INSERT INTO [usuario]     VALUES (1, 1, 1, '000.001', 'Administrador do sistema', 'administrador', 1, 1, 'N', NULL, NULL, 'S', 'N', '00311üûù§,ì', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [usuario]     VALUES (1, 1, 2, '000.002', 'Marcio Alves', 'marcio.alves', 1, 1, 'N', NULL, NULL, 'S', 'N', '00311üûù§,ì', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [usuario]     VALUES (1, 1, 3, '000.003', 'Fernanda Margarete Vieira', 'fernanda.vieira', 1, 1, 'N', NULL, NULL, 'S', 'N', '00311üûù§,ì', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [usuario_log] VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'usuario_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)

--
-- Chave estrangeira do tipo de usuário para o usuário.
--
ALTER TABLE [tipo_usuario_log]   ADD CONSTRAINT [tipo_usuario_log_fk_log_usuario]   FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
ALTER TABLE [perfil_usuario_log] ADD CONSTRAINT [perfil_usuario_log_fk_log_usuario] FOREIGN KEY ([licenca_id], [log_usuario_base_id], [log_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])

ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_ins_usuario] FOREIGN KEY ([licenca_id], [ins_usuario_base_id], [ins_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])
ALTER TABLE [numerador_licenca] ADD CONSTRAINT [numerador_licenca_fk_upd_usuario] FOREIGN KEY ([licenca_id], [upd_usuario_base_id], [upd_usuario_id]) REFERENCES [usuario] ([licenca_id], [usuario_base_id], [usuario_id])

--
-- Pessoa.
--
INSERT INTO [pessoa] VALUES (1, 'F', 'Física',   'S', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [pessoa] VALUES (2, 'J', 'Jurídica', 'N', 'S', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [pessoa] VALUES (3, 'G', 'Governo',  'N', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
GO
INSERT INTO [numerador_base] VALUES ('pessoa_id', 3, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
GO

--
-- Regime triburário.
--
INSERT INTO [regime_tributario] VALUES (1, '1', 'Simples nacional', 'S', 'N', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [regime_tributario] VALUES (2, '2', 'Lucro real',       'N', 'S', 'N', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [regime_tributario] VALUES (3, '3', 'Lucro resumido',   'N', 'N', 'S', 'N', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
INSERT INTO [regime_tributario] VALUES (4, '4', 'Lucro arbitrado',  'N', 'N', 'N', 'S', 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
GO
INSERT INTO [numerador_base] VALUES ('regime_tributario_id', 4, 'N', 'S', GETDATE(), GETDATE(), NULL, NULL, 0)
GO

--
-- Empresa.
--
INSERT INTO [empresa] VALUES (1, 1, 1, '01', 'Bergerson',   2, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [empresa_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [empresa] VALUES (1, 1, 2, '02', 'M. Campelli', 2, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [empresa_log] VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [empresa] VALUES (1, 1, 3, '03', 'MAB',         2, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [empresa_log] VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')
GO

INSERT INTO [numerador_licenca] VALUES (1, 1, 'empresa_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
GO

--
-- Filial.
--
INSERT INTO [filial] VALUES (1, 1, 1, '01', 'Prudente Moraes', 'Bergerson Joias e Relogios Ltda', 'Bergerson Joalheiros',  '76535111000164', 1, 1, 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [filial_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [filial] VALUES (1, 1, 2, '02', 'Venda Externa E1', 'Bergerson Joias e Relogios Ltda', 'Bergerson Joalheiros',  '76535111000299', 1, 1, 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [filial_log] VALUES (1, 1, 2, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [filial] VALUES (1, 1, 3, '03', 'Bergerson Pátio Batel', 'Bergerson Joias e Relogios Ltda', 'Bergerson Joalheiros',  '76535111000398', 1, 1, 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [filial_log] VALUES (1, 1, 3, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'filial_id', 3, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
GO

--
-- Coligada.
--
INSERT INTO [coligada] VALUES (1, 1, 1, '01', 'Bergerson Joalheiros', 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
INSERT INTO [coligada_log] VALUES (1, 1, 1, 1, 1, GETDATE(), GETDATE(), 1, @@SERVERNAME, 'Administrador', 1, 1, 'Registro criado na instalação!', '')

INSERT INTO [numerador_licenca] VALUES (1, 1, 'coligada_id', 1, 'N', 'S', GETDATE(), GETDATE(), 1, 1, NULL, NULL, NULL, NULL, 0)
GO