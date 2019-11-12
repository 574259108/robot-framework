*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shop}                 https://th.indeed.com/
${add_wo}                   //*[@id="text-input-what"]
${Click_text}               //*[@id="text-input-where"]
${add_lo}                   //*[@id="text-input-where"]
${input_wo}                 Selenium
${input_lo}                 กรุงเทพมหานคร
${go}                       //*[@class="icl-Button icl-Button--primary icl-Button--md icl-WhatWhere-button"]
${Close}                   //*[@id="popover-close-link"]
${ele_price_basket}         Page 1 of 54 jobs





*** Keywords ***

Input Item name
    [Arguments]                     ${xpath_item}  ${add_wo}     
    Wait Until Element Is Visible   ${xpath_item}
    Input Text                      ${xpath_item}  ${add_wo}

Click Button Click text
    [Arguments]                     ${Click_text}
    Wait Until Element Is Visible   ${Click_text}
    Click Element                   ${Click_text}

Input Item input_pass
    [Arguments]                     ${xpath_item2}  ${add_lo}    
    Wait Until Element Is Visible   ${xpath_item2}
    Input Text                      ${xpath_item2}  ${add_lo} 
    

Click Button go
    [Arguments]                     ${go}
    Wait Until Element Is Visible   ${go}
    Click Element                   ${go}

Click Button Close
    [Arguments]                     ${Close}
    Wait Until Element Is Visible   ${Close}
    Click Element                   ${Close} 


*** Test Cases ***
check 
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shop}

    Input Item name                 ${add_wo}  ${input_wo}
    Sleep                           5s

    Click Button Click text         ${Click_text}
    Sleep                           5s

    Clear Element Text              //*[@id="text-input-where"]
    Sleep                           5s

    Input Item name                 ${add_lo}  ${input_lo}
    Sleep                            5s

    Click Button go                 ${go}
    Sleep                           5s

    Click Button Close              ${Close}
    Sleep                           5s


เช็ค Text
    ${result}    get text           //*[@id="icl-Button icl-Button--primary icl-Button--md icl-WhatWhere-button"]
    Log To Console                  ${result}
    Should Be Equal                 ${result}  ${ele_price_basket}
    Sleep                            5s
    Close Browser

     