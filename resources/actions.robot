*** Settings ***
Documentation    Arquivo de execução dos processos para uso do ecommerce.

*** Keywords ***
#Validação de usuário
Pop-up Consentimento
    Wait Until Page Contains    text=Consentimento de Cookies            timeout=00:00:15
    Click Element               xpath=//button[@id="onetrust-accept-btn-handler"]

Login With
    [Arguments]    ${username}    ${pass}    

    Wait Until Page Contains    text=Identificação      timeout=00:00:15    
    Input Text                  id=inputUsuarioLogin    ${username}
    Input Text                  id=inputSenhaLogin      ${pass}

    Click Element    id=botaoLogin    

Should See Logged User
    [Arguments]    ${name}

    Wait Until Page Contains Element    xpath=(//div[@id="blocoInformacoesCliente"]//div)
    Page Should Contain                 Olá, ${name}

Invalid user
    Wait Until Page Contains    text=Não foi possivel realizar o login    timeout=00:00:15

