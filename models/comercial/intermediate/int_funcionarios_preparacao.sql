with
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , joined as (
        select funcionarios.PK_FUNCIONARIO
        
             , funcionarios.DT_NASCIMENTO_FUNCIONARIO
             , funcionarios.DT_CONTRATACAO
             , funcionarios.NOME_FUNCIONARIO
             , funcionarios.CARGO_FUNCIONARIO
             , funcionarios.CIDADE_FUNCIONARIO
             , funcionarios.REGIAO_FUNCIONARIO
             , funcionarios.PAIS_FUNCIONARIO
             , gerentes.nome_funcionario as NOME_GERENTE
        from funcionarios
        left join funcionarios as gerentes on funcionarios.fk_gerente = gerentes.pk_funcionario
    )

    select *
    from joined
