*** Settings ***

Resource    base.robot        

Test Setup       Nova sessão
Test Teardown    Encerra sessão


*** Test Cases ***
Login com Sucesso
    Go To           ${url}/login
    Input Text      css:input[name=username]       stark
    Input Text      css:input[name=password]       jarvis!
    Click Element   class:btn-login 

    
    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!


Login Inválido

    Go To           ${url}/login
    Input Text      css:input[name=username]       starks
    Input Text      css:input[name=password]       jarviss!   
    Click Element   class:btn-login 
      
    
    Page Should Contain     O usuário informado não está cadastrado!

Senha Inválida
    [tags]      wrong
    Go To           ${url}/login
    Input Text      css:input[name=username]       stark
    Input Text      css:input[name=password]       jarviss!   
    Click Element   class:btn-login 
      
     ${message}       Get WebElement                id:flash 
     Should Contain     ${message.text}             Senha é invalida!
     Log To Console     ${message.text}
    # Page Should Contain     Senha é invalida!

*** Keywords ***
Login With
  [Arguments]   uname      pass