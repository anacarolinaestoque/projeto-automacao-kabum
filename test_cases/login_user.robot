*** Settings ***

Documentation    Testes de validação de login de usuário
Resource         ${EXECDIR}/../resources/base_page.robot

Test Setup       Nova Sessão
Test Teardown    Encerra Sessão

*** Test Cases ***
Login com sucesso
    [tags]    login_successful

    Pop-up Consentimento
    Go To                     ${url}/login
    Login With                anaprojetokabum@gmail.com    kabumproject!0
    Should See Logged User    Ana

Usuário inválido
    [tags]    login_error

    Pop-up Consentimento
    Go To                     ${url}/login
    Login With    anaprojetokabum@gmail.com    abc123
    Invalid user
