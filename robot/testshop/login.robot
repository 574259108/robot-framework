*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shop}              http://localhost/5510096596/index.html
${ele_user}                //*[@type="text"]
${ele_pass}                //*[@type="password"]
${username}                somchai
${password}                5555
${btn_login}               //*[@type="submit"]
${btn_gotoadddata}         //*[@href="http://localhost/5510096596/formtest.html"]
${type_male}               //*[@value="male"]
${add_name}                //*[@type="text"]
${input_name}              wisanu
${input_province}          //*[@value="กาญจนบุรี"]
${add_tel}                 //*[@type="number"]
${input_tel}               0987654321
${add_pass}                //*[@type="password"]
${input_pass}              5555
${add_introduce}           //*[@name="intro"]
${input_introduce}         สวัสด..ดีครับ
${btn_submit}              //*[@type="submit"]


*** Keywords ***
Input Login
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Wait Until Element Is Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}
Click Button btn_gotoadddata
    [Arguments]                     ${btn_gotoadddata}
    Wait Until Element Is Visible   ${btn_gotoadddata}
    Click Element                   ${btn_gotoadddata}
Click Button type_male
    [Arguments]                     ${type_male}
    Wait Until Element Is Visible   ${type_male}
    Click Element                   ${type_male}
Input Item name
    [Arguments]                     ${xpath_item}  ${add_name}     
    Wait Until Element Is Visible   ${xpath_item}
    Input Text                      ${xpath_item}  ${add_name} 
Click Button input_province 
    [Arguments]                     ${input_province}
    Wait Until Element Is Visible   ${input_province}
    Click Element                   ${input_province}
Input Item input_tel
    [Arguments]                     ${xpath_item2}  ${add_tel}    
    Wait Until Element Is Visible   ${xpath_item2}
    Input Text                      ${xpath_item2}  ${add_tel}
Input Item input_pass
    [Arguments]                     ${xpath_item3}  ${add_pass}    
    Wait Until Element Is Visible   ${xpath_item3}
    Input Text                      ${xpath_item3}  ${add_pass}
Input Item input_introduce
    [Arguments]                     ${xpath_item4}  ${add_introduce}    
    Wait Until Element Is Visible   ${xpath_item4}
    Input Text                      ${xpath_item4}  ${add_introduce}

*** Test Cases ***
Login shop - success
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shop}
    Input Login                     ${ele_user}     ${ele_pass}       ${username}      ${password}
    Sleep                           5s
    Click Button                    ${btn_login}
    Sleep                           5s
    Click Button btn_gotoadddata    ${btn_gotoadddata}
    Sleep                           5s
    Click Button type_male          ${type_male}
    Sleep                           5s
    Input Item name                 ${add_name}  ${input_name}
    Sleep                           5s
    Click Button input_province     ${input_province}
    Sleep                           5s
    Input Item input_tel            ${add_tel}  ${input_tel}
    Sleep                           5s
    Input Item input_pass           ${add_pass}  ${input_pass}
    Sleep                           5s
    Input Item input_introduce      ${add_introduce}  ${input_introduce}
    Sleep                           5s
    Click Button                    ${btn_submit}
    Sleep                           5s
    Close Browser
