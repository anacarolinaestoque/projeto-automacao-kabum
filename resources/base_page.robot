*** Settings ***
Library          SeleniumLibrary
Documentation    Página base com os dados para execução do navegador
Resource         actions.robot

*** Variables ***
${url}           https://www.kabum.com.br/


*** Keywords ***
Nova Sessão        
    Open Browser        ${url}           chrome

Encerra Sessão  
    Capture Page Screenshot
    Close Browser