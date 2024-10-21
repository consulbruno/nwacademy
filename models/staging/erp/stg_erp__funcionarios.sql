with
    fonte_funcionarios as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )


    , renomeacao as (
        select
            cast (ID as int) as PK_FUNCIONARIO
            ,cast (REPORTSTO as varchar) as FK_GERENTE
            ,cast (BIRTHDATE as date) as DT_NASCIMENTO_FUNCIONARIO
            ,cast (HIREDATE as date) as DT_CONTRATACAO
            ,cast (FIRSTNAME || ' ' || LASTNAME as varchar) as NOME_FUNCIONARIO
            ,cast (TITLE as varchar) as CARGO_FUNCIONARIO
            ,cast (CITY as varchar) as CIDADE_FUNCIONARIO
            ,cast (REGION as varchar) as REGIAO_FUNCIONARIO
            ,cast (COUNTRY as varchar) as PAIS_FUNCIONARIO
--          ,POSTALCODE
--          ,TITLEOFCOURTESY
--          ,ADDRESS
--          ,HOMEPHONE
--          ,EXTENSION
--          ,PHOTO
--          ,NOTES
--          ,PHOTOPATH
        from fonte_funcionarios
    )


select *
from renomeacao
