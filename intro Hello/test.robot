*** Settings ***
Library         app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=        Welcome       Akaue
    Should Be Equal     ${result}   Ola Akaue, Bem vindo