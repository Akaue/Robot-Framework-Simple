*** Settings ***

Resource    base.robot        

Test Setup       Nova sessão
Test Teardown    Encerra sessão


*** Test Cases ***
Verifica o valor ao informar o numero da linha
    Go To                                   ${url}/tables
    Table Row Should Contain                id:actors   1   $ 10.000.000
    sleep                                     5

Descobre a linha pelo texto chave e valida os demais valores
    Go To            ${url}/tables
   ${alvo}=          Get WebElement        xpath://tr[contains(.,'@vindiesel')]   
   Should contain    ${alvo.text}            $ 10.000.000
   Should contain    ${alvo.text}            Domic Toreto
   log               ${alvo.text}                    
   log to console    ${alvo.text}  