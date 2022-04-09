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

    Click Element               id=botaoLogin    

Should See Logged User
    [Arguments]    ${name}

    Wait Until Page Contains Element    xpath=(//div[@id="blocoInformacoesCliente"]//div)
    Page Should Contain                 Olá, ${name}

Invalid user
    Wait Until Page Contains    text=Não foi possivel realizar o login    timeout=00:00:15

#Validação de produtos
Search iPhone
    [Arguments]      ${apple_iPhone}

    Input Text       id=input-busca      ${apple_iPhone}

    Press Keys       xpath=//button[@type="submit"][@class="sc-kBjqcv Bmexq"]    ENTER

iPhone Returned
    Location Should Be      ${url}celular-smartphone/smartphones/iphone

#Adicionando produto no carrinho
Departaments
    Click Element                        xpath=//div[@id="menuExpansivelCategorias"]//button
    Wait Until Page Contains             text=Cadeiras                      timeout=00:00:15
    Wait Until Page Contains Element     xpath=//div[@id="menuExpansivelCategorias"]//a[@href="https://www.kabum.com.br/cadeiras"]
    Click Element                        xpath=//div[@id="menuExpansivelCategorias"]//a[@href="https://www.kabum.com.br/cadeiras"]
    Wait Until Page Contains             text=Você está em:                 timeout=00:00:15

Add Product
    Click Element     xpath=//a[@href="https://www.kabum.com.br/cadeiras/cadeiras-gamer"]
    Click Element     xpath=//button[@class="sc-cOFTSb BEGwX"]
    Click Element     xpath=//a[@href="https://www.kabum.com.br/cadeiras/cadeiras-gamer/havit"]      
    Click Element     xpath=//div[@class="sc-cZwWEu sc-jQHtVU kIPWYA hsqmIN availableFooterCard"]

Cart Check
    Wait Until Page Contains    text=PRODUTO ADICIONADO NO CARRINHO
