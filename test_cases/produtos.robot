*** Settings ***
Documentation    Testes de validação de produtos
Resource         ${EXECDIR}/../resources/base_page.robot

Test Setup       Nova Sessão
Test Teardown    Encerra Sessão


*** Test Cases ***
Buscar iPhone no site KaBuM!
    [tags]    search_product
    
    Pop-up Consentimento
    Search iPhone             iPhone
    iPhone Returned

Selecionar produto no departamento escolhido e adicioná-lo ao carrinho de compras
    [tags]    shopping_cart

    Pop-up Consentimento
    Departaments
    Add Product
    Cart Check

    
      