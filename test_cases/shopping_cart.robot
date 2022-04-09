*** Settings ***
Documentation    Testes de validação de departamento e carrinho de compras
Resource         ${EXECDIR}/../resources/base_page.robot

Test Setup       Nova Sessão
Test Teardown    Encerra Sessão

*** Test Cases ***
Selecionar produto no departamento escolhido e adicioná-lo ao carrinho de compras
    [tags]    shopping_cart

    Pop-up Consentimento
    Departaments
    Add Product
    Cart Check