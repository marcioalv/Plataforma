ALTER PROCEDURE Plataforma_ERP_SQLServer_RotinaAplicacao_Inserir AS
BEGIN
  --
  -- Declarção das variáveis de controle de erro!
  --
  DECLARE @_ErrorMessage      VARCHAR(MAX)
  DECLARE @_ErrorSeverity     INT
  DECLARE @_ErrorState        INT

  DECLARE @_BaseID            SMALLINT

  DECLARE @_NUMERADOR_CODIGO  VARCHAR(MAX) = 'rotina_aplicacao_id'
  DECLARE @_RotinaAplicacaoID INT
    
  DECLARE @_Cursor_Index      INT
  DECLARE @_Cursor_Rows       INT
  DECLARE @_Cursor_Codigo     VARCHAR(255)
  DECLARE @_Cursor_Chave      VARCHAR(255)
  DECLARE @_Cursor_Descricao  VARCHAR(255)

  --
  -- Se a tabela não existe então não faz nada!
  --
  IF OBJECT_ID('rotina_aplicacao') IS NULL
  BEGIN
    PRINT 'A tabela [rotina_aplicacao] não existe na modelagem do banco de dados!'
    RETURN
  END

  --
  -- Determina a base de dados da instalação da aplicação.
  --
  SET @_BaseID = (SELECT [aplicacao_base].[base_id] FROM [aplicacao_base])

  IF @_BaseID IS NULL
  BEGIN
    PRINT 'O ID da base dessa instalação da aplicação ainda não foi definido na tabela [aplicacao_base]!'
    RETURN
  END

  --
  -- Cria tabela temporária para não precisar tratar o ID da rotina da aplicação!
  --
  CREATE TABLE [#tmp_rotina_aplicacao] (
    [codigo]    VARCHAR(255) NOT NULL,
    [chave]     VARCHAR(255) NOT NULL,
    [descricao] VARCHAR(255) NOT NULL,
    PRIMARY KEY ([codigo]),
    UNIQUE ([chave])
  )

  --
  -- Rotinas da aplicação!
  --
  BEGIN TRY
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01',                 'ERP',                                          'Aplicativo ERP')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01',              'ERP_APLICACAO',                                'Módulo aplicação')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01',           'ERP_CONTROLE_ACESSO',                          'Controle de acesso')
                                                                                                                                                 
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01',        'ERP_NUMERADOR_GLOBAL',                         'Numerador global')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01',     'ERP_NUMERADOR_GLOBAL_LISTA',                   'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.01',  'ERP_NUMERADOR_GLOBAL_LISTA_LOCALIZAR',         'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.02',  'ERP_NUMERADOR_GLOBAL_LISTA_ATUALIZAR',         'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.03',  'ERP_NUMERADOR_GLOBAL_LISTA_NOVO',              'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.04',  'ERP_NUMERADOR_GLOBAL_LISTA_SELECIONAR',        'Selecionar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.05',  'ERP_NUMERADOR_GLOBAL_FILTRO_CADASTRO',         'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.01.06',  'ERP_NUMERADOR_GLOBAL_FILTRO_AUDITORIA',        'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02',     'ERP_NUMERADOR_GLOBAL_CADASTRO',                'Cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.01',  'ERP_NUMERADOR_GLOBAL_CADASTRO_ABA_CADASTRO',   'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.02',  'ERP_NUMERADOR_GLOBAL_CADASTRO_ABA_AUDITORIA',  'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.03',  'ERP_NUMERADOR_GLOBAL_CADASTRO_ATUALIZAR',      'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.04',  'ERP_NUMERADOR_GLOBAL_CADASTRO_LOCALIZAR',      'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.05',  'ERP_NUMERADOR_GLOBAL_CADASTRO_NOVO',           'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.06',  'ERP_NUMERADOR_GLOBAL_CADASTRO_EXCLUIR',        'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.01.02.07',  'ERP_NUMERADOR_GLOBAL_CADASTRO_ALTERAR',        'Alterar')
                                                                                                                                                 
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02',        'ERP_NUMERADOR_LICENCA',                        'Numerador por licença')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01',     'ERP_NUMERADOR_LICENCA_LISTA',                  'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.01',  'ERP_NUMERADOR_LICENCA_LISTA_LOCALIZAR',        'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.02',  'ERP_NUMERADOR_LICENCA_LISTA_ATUALIZAR',        'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.03',  'ERP_NUMERADOR_LICENCA_LISTA_NOVO',             'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.04',  'ERP_NUMERADOR_LICENCA_LISTA_SELECIONAR',       'Selecionar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.05',  'ERP_NUMERADOR_LICENCA_FILTRO_CADASTRO',        'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.01.06',  'ERP_NUMERADOR_LICENCA_FILTRO_AUDITORIA',       'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02',     'ERP_NUMERADOR_LICENCA_CADASTRO',               'Cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.01',  'ERP_NUMERADOR_LICENCA_CADASTRO_ABA_CADASTRO',  'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.02',  'ERP_NUMERADOR_LICENCA_CADASTRO_ABA_AUDITORIA', 'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.03',  'ERP_NUMERADOR_LICENCA_CADASTRO_ATUALIZAR',     'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.04',  'ERP_NUMERADOR_LICENCA_CADASTRO_LOCALIZAR',     'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.05',  'ERP_NUMERADOR_LICENCA_CADASTRO_NOVO',          'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.06',  'ERP_NUMERADOR_LICENCA_CADASTRO_EXCLUIR',       'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.02.02.07',  'ERP_NUMERADOR_LICENCA_CADASTRO_ALTERAR',       'Alterar')
                                                                                                                        
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03',        'ERP_ROTINA_APLICACAO',                         'Rotinas da aplicação')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01',     'ERP_ROTINA_APLICACAO_LISTA',                   'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.01',  'ERP_ROTINA_APLICACAO_LISTA_LOCALIZAR',         'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.02',  'ERP_ROTINA_APLICACAO_LISTA_ATUALIZAR',         'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.03',  'ERP_ROTINA_APLICACAO_LISTA_NOVO',              'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.04',  'ERP_ROTINA_APLICACAO_LISTA_SELECIONAR',        'Selecionar')          
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.05',  'ERP_ROTINA_APLICACAO_FILTRO_CADASTRO',         'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.01.06',  'ERP_ROTINA_APLICACAO_FILTRO_AUDITORIA',        'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02',     'ERP_ROTINA_APLICACAO_CADASTRO',                'Cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.01',  'ERP_ROTINA_APLICACAO_CADASTRO_ABA_CADASTRO',   'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.02',  'ERP_ROTINA_APLICACAO_CADASTRO_ABA_AUDITORIA',  'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.03',  'ERP_ROTINA_APLICACAO_CADASTRO_ATUALIZAR',      'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.04',  'ERP_ROTINA_APLICACAO_CADASTRO_LOCALIZAR',      'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.05',  'ERP_ROTINA_APLICACAO_CADASTRO_NOVO',           'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.06',  'ERP_ROTINA_APLICACAO_CADASTRO_EXCLUIR',        'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.03.02.07',  'ERP_ROTINA_APLICACAO_CADASTRO_ALTERAR',        'Alterar')
                                                                                                                                                 
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04',        'ERP_PERFIL_USUARIO',                           'Perfis de usuário')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01',     'ERP_PERFIL_USUARIO_LISTA',                     'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.01',  'ERP_PERFIL_USUARIO_LISTA_LOCALIZAR',           'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.02',  'ERP_PERFIL_USUARIO_LISTA_ATUALIZAR',           'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.03',  'ERP_PERFIL_USUARIO_LISTA_NOVO',                'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.04',  'ERP_PERFIL_USUARIO_LISTA_SELECIONAR',          'Selecionar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.05',  'ERP_PERFIL_USUARIO_FILTRO_CADASTRO',           'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.01.06',  'ERP_PERFIL_USUARIO_FILTRO_AUDITORIA',          'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02',     'ERP_PERFIL_USUARIO_CADASTRO',                  'Cadastro')            
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.01',  'ERP_PERFIL_USUARIO_CADASTRO_ABA_CADASTRO',     'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.02',  'ERP_PERFIL_USUARIO_CADASTRO_ABA_AUDITORIA',    'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.03',  'ERP_PERFIL_USUARIO_CADASTRO_LOG',              'Log')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.04',  'ERP_PERFIL_USUARIO_CADASTRO_ATUALIZAR',        'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.05',  'ERP_PERFIL_USUARIO_CADASTRO_LOCALIZAR',        'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.06',  'ERP_PERFIL_USUARIO_CADASTRO_NOVO',             'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.07',  'ERP_PERFIL_USUARIO_CADASTRO_EXCLUIR',          'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.04.02.08',  'ERP_PERFIL_USUARIO_CADASTRO_ALTERAR',          'Alterar')
                                                                                                                                                 
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05',        'ERP_TIPO_USUARIO',                             'Tipos de usuário')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01',     'ERP_TIPO_USUARIO_LISTA',                       'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.01',  'ERP_TIPO_USUARIO_LISTA_LOCALIZAR',             'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.02',  'ERP_TIPO_USUARIO_LISTA_ATUALIZAR',             'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.03',  'ERP_TIPO_USUARIO_LISTA_NOVO',                  'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.04',  'ERP_TIPO_USUARIO_LISTA_SELECIONAR',            'Selecionar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.05',  'ERP_TIPO_USUARIO_FILTRO_CADASTRO',             'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.01.06',  'ERP_TIPO_USUARIO_FILTRO_AUDITORIA',            'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02',     'ERP_TIPO_USUARIO_CADASTRO',                    'Cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.01',  'ERP_TIPO_USUARIO_CADASTRO_ABA_CADASTRO',       'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.02',  'ERP_TIPO_USUARIO_CADASTRO_ABA_AUDITORIA',      'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.03',  'ERP_TIPO_USUARIO_CADASTRO_LOG',                'Log')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.04',  'ERP_TIPO_USUARIO_CADASTRO_ATUALIZAR',          'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.05',  'ERP_TIPO_USUARIO_CADASTRO_LOCALIZAR',          'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.06',  'ERP_TIPO_USUARIO_CADASTRO_NOVO',               'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.07',  'ERP_TIPO_USUARIO_CADASTRO_EXCLUIR',            'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.05.02.08',  'ERP_TIPO_USUARIO_CADASTRO_ALTERAR',            'Alterar')
                                                                                                                                                   
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06',        'ERP_USUARIO',                                  'Usuários')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01',     'ERP_USUARIO_LISTA',                            'Lista')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.01',  'ERP_USUARIO_LISTA_LOCALIZAR',                  'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.02',  'ERP_USUARIO_LISTA_ATUALIZAR',                  'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.03',  'ERP_USUARIO_LISTA_NOVO',                       'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.04',  'ERP_USUARIO_LISTA_SELECIONAR',                 'Selecionar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.05',  'ERP_USUARIO_FILTRO_CADASTRO',                  'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.01.06',  'ERP_USUARIO_FILTRO_AUDITORIA',                 'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02',     'ERP_USUARIO_CADASTRO',                         'Cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.01',  'ERP_USUARIO_CADASTRO_ABA_CADASTRO',            'Aba de cadastro')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.02',  'ERP_USUARIO_CADASTRO_ABA_AUDITORIA',           'Aba de auditoria')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.03',  'ERP_USUARIO_CADASTRO_LOG',                     'Log')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.04',  'ERP_USUARIO_CADASTRO_SENHA',                   'Senha')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.05',  'ERP_USUARIO_CADASTRO_ATUALIZAR',               'Atualizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.06',  'ERP_USUARIO_CADASTRO_LOCALIZAR',               'Localizar')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.07',  'ERP_USUARIO_CADASTRO_NOVO',                    'Novo')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.08',  'ERP_USUARIO_CADASTRO_EXCLUIR',                 'Excluir')
    INSERT INTO [#tmp_rotina_aplicacao] VALUES ('01.01.01.06.02.09',  'ERP_USUARIO_CADASTRO_ALTERAR',                 'Alterar')
  END TRY
  BEGIN CATCH
    SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
    ROLLBACK TRANSACTION
    DROP TABLE [#tmp_rotina_aplicacao]
    RAISERROR ('Impossível inserir todas as linhas na tabela temporária [#tmp_rotina_aplicacao]: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
    RETURN
  END CATCH

  --
  -- Inicia uma transação com o banco de dados!
  --
  BEGIN TRY
    BEGIN TRANSACTION
  END TRY
  BEGIN CATCH
    SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
    DROP TABLE [#tmp_rotina_aplicacao]
    RAISERROR ('Impossível iniciar uma transação com o banco de dados: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
    RETURN
  END CATCH

  --
  -- Trunca tabela!
  --
  BEGIN TRY
    TRUNCATE TABLE [rotina_aplicacao]
  END TRY
  BEGIN CATCH
    SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
    ROLLBACK TRANSACTION
    DROP TABLE [#tmp_rotina_aplicacao]
    RAISERROR ('Impossível truncar a tabela [rotina_aplicacao]: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
    RETURN
  END CATCH

  --
  -- Declara cursor!
  --
  DECLARE c_Cursor CURSOR LOCAL STATIC FOR

  --
  -- Seleciona todas as rotinas da aplicação da tabela temporária!
  --
  SELECT
    [codigo],
    [chave],
    [descricao]
  FROM
    [#tmp_rotina_aplicacao]
  ORDER BY
    [codigo] ASC

  --
  -- Abre cursor!
  --
  OPEN c_Cursor

  --
  -- Determina a quantidade de registros no cursor!
  --
  SET @_Cursor_Rows = @@CURSOR_ROWS

  --
  -- Inicia processamento individual!
  --
  SET @_Cursor_Index = 1
  WHILE @_Cursor_Index <= @_Cursor_Rows
  BEGIN
    --
    -- Incrementa contador!
    --
    SET @_Cursor_Index = @_Cursor_Index + 1

    --
    -- Carrega campos em variáveis!
    --
    FETCH NEXT FROM
      c_Cursor
    INTO
      @_Cursor_Codigo,
      @_Cursor_Chave,
      @_Cursor_Descricao

    --
    -- Determina se a chave existe ou não!
    --
    IF NOT EXISTS (SELECT TOP 1
                     1
                   FROM
                     [rotina_aplicacao]
                   WHERE
                     [rotina_aplicacao].[rotina_aplicacao_base_id] = @_BaseID AND
                     [rotina_aplicacao].[chave]                    = @_Cursor_Chave)
    BEGIN
      --
      -- Se a chave não existe então determina o próximo ID para a inserção!
      --
      SET @_RotinaAplicacaoID = (SELECT
                                   MAX([rotina_aplicacao].[rotina_aplicacao_id])
                                 FROM
                                   [rotina_aplicacao]
                                 WHERE
                                   [rotina_Aplicacao].[rotina_aplicacao_base_id] = @_BaseID)

      SET @_RotinaAplicacaoID = ISNULL(@_RotinaAplicacaoID, 0) + 1

      --
      -- Insere dados na tabela!
      --
      BEGIN TRY
        INSERT INTO [rotina_aplicacao] (
          [rotina_aplicacao_base_id],
          [rotina_aplicacao_id],
          [codigo],
          [descricao],
          [chave],
          [bloqueado],
          [ativo],
          [ins_local_dt_hr],
          [ins_server_dt_hr],
          [upd_local_dt_hr],
          [upd_server_dt_hr],
          [upd_contador]
        )
        VALUES (
          @_BaseID,            --> [rotina_aplicacao_base_id].
          @_RotinaAplicacaoID, --> [rotina_aplicacao_id].
          @_Cursor_Codigo,     --> [codigo].
          @_Cursor_Descricao,  --> [descricao].
          @_Cursor_Chave,      --> [chave].
          'N',                 --> [bloqueado].
          'S',                 --> [ativo].
          GETDATE(),           --> [ins_local_dt_hr].
          GETDATE(),           --> [ins_server_dt_hr].
          NULL,                --> [upd_local_dt_hr].
          NULL,                --> [upd_server_dt_hr].
          0                    --> [upd_contador].
        )
      END TRY
      BEGIN CATCH
        SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
        ROLLBACK TRANSACTION
        DROP TABLE [#tmp_rotina_aplicacao]
        RAISERROR ('Impossível inserir dados na tabela [rotina_aplicacao]: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
        RETURN
      END CATCH
    END
    ELSE
    BEGIN
      --
      -- Se a chave existe então atualiza!
      --
      BEGIN TRY
        UPDATE
          [rotina_aplicacao]
        SET
          [codigo]           = @_Cursor_Codigo,
          [descricao]        = @_Cursor_Descricao,
          [upd_local_dt_hr]  = GETDATE(),
          [upd_server_dt_hr] = GETDATE(),
          [upd_contador]     = [upd_contador] + 1
        WHERE
          [rotina_aplicacao_base_id] = @_BaseID AND
          [chave]                    = @_Cursor_Chave
      END TRY
      BEGIN CATCH
        SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
        ROLLBACK TRANSACTION
        DROP TABLE [#tmp_rotina_aplicacao]
        RAISERROR ('Impossível inserir dados na tabela [rotina_aplicacao]: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
        RETURN
      END CATCH
    END
  END
    
  --
  -- Fecha e desaloca cursor!
  --
  CLOSE c_Cursor
  DEALLOCATE c_Cursor

  --
  -- Determina o maior ID da rotina aplicação para atualizar a tabela de numeradores!
  --
  BEGIN TRY
    SET @_RotinaAplicacaoID = (SELECT
                                 MAX([rotina_aplicacao].[rotina_aplicacao_id])
                               FROM
                                 [rotina_aplicacao]
                               WHERE
                                 [rotina_aplicacao].[rotina_aplicacao_base_id] = @_BaseID)

    SET @_RotinaAplicacaoID = ISNULL(@_RotinaAplicacaoID, 0)
    
    IF NOT EXISTS (SELECT TOP 1
                     1
                   FROM
                     [numerador_base]
                   WHERE
                     [numerador_base].[base_id] = @_BaseID AND
                     [numerador_base].[codigo]  = @_NUMERADOR_CODIGO)
    BEGIN
      INSERT INTO [numerador_base] (
        [base_id],
        [codigo],
        [atual_id],
        [bloqueado],
        [ativo],
        [ins_local_dt_hr],
        [ins_server_dt_hr],
        [upd_local_dt_hr],
        [upd_server_dt_hr],
        [upd_contador]
      )
      VALUES (
        @_BaseID,            --> [base_id].
        @_NUMERADOR_CODIGO,  --> [codigo].
        @_RotinaAplicacaoID, --> [atual_id].
        'N',                 --> [bloqueado].
        'S',                 --> [ativo].
        GETDATE(),           --> [ins_local_dt_hr].
        GETDATE(),           --> [ins_server_dt_hr].
        NULL,                --> [upd_local_dt_hr].
        NULL,                --> [upd_server_dt_hr].
        0                    --> [upd_contador].
      )
    END
    ELSE
    BEGIN
      UPDATE
        [numerador_base]
      SET
        [atual_id]         = @_RotinaAplicacaoID,
        [upd_local_dt_hr]  = GETDATE(),
        [upd_server_dt_hr] = GETDATE(),
        [upd_contador]     = [upd_contador] + 1
      WHERE
        [base_id] = @_BaseID AND
        [codigo]  = @_NUMERADOR_CODIGO        
    END
  END TRY
  BEGIN CATCH
    SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
    ROLLBACK TRANSACTION
    DROP TABLE [#tmp_rotina_aplicacao]
    RAISERROR ('Impossível atualizar o numerador [rotina_aplicacao_id] na tabela [numerador_base]: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
    RETURN
  END CATCH

  --
  -- Confirma a transação com o banco de dados!
  --
  BEGIN TRY
    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT @_ErrorMessage = ERROR_MESSAGE(), @_ErrorSeverity = ERROR_SEVERITY(), @_ErrorState = ERROR_STATE()
    DROP TABLE [#tmp_rotina_aplicacao]
    RAISERROR ('Impossível confirmar a transação com o banco de dados: %s!', @_ErrorSeverity, @_ErrorState, @_ErrorMessage)
    RETURN
  END CATCH
END