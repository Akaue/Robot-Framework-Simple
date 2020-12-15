*** Settings ***
# Library     SeleniumLibrary
Resource    base.robot        

Test Setup       Nova sessão
Test Teardown    Encerra sessão

*** Variables ***
${url}       https://training-wheels-protocol.herokuapp.com/
${check_thor}   id:thor 


*** Test Cases ***
Marcando Opção com Id
    # Open Browser                   ${url}           chrome
    Go To                          ${url}/checkboxes
    Select checkbox                ${check_thor}
    checkbox Should Be Selected    ${check_thor}  
    Sleep                           5
    # Close Browser

Marcando Opção com Css Selector 
    # [tags]  ironman
    # Open Browser                   ${url}           chrome
    Go To                          ${url}/checkboxes
    Select checkbox                css:input[value='iron-man'] 
    checkbox Should Be Selected    css:input[value='iron-man']   
    Sleep                           5
    # Close Browser


Marcando Opção com xpath
    [tags]  xpathiron
    # Open Browser                   ${url}           chrome
    Go To                          ${url}/checkboxes
    Select checkbox                xpath://*[@id='checkboxes']/input[7]
    checkbox Should Be Selected    xpath://*[@id='checkboxes']/input[7]   
    Sleep                           5
    # Close Browser

# *** Keywords ***
# Nova sessão
#     Open Browser                 ${url}           chrome   

# Encerra sessão
#     Close Browser





















#Executando com tag
#robot -d ./log -i ironman checkbox.robot