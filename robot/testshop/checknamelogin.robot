*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shop}                http://localhost/5510096596/index.html
${ele_user}                //*[@type="text"]
${ele_pass}                //*[@type="password"]
${username}                wisanu
${password}                5555
${btn_login}               //*[@type="submit"]
${ele_name}                wisanu



*** Keywords ***
Input Login
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Wait Until Element Is Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}


*** Test Cases ***
check login
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shop}
    Input Login                     ${ele_user}     ${ele_pass}       ${username}      ${password}
    Sleep                           5s
    Click Button                    ${btn_login}
    Sleep                           5s
#เช็ค namelogin
Verify check login
    ${result}          get text              //*[@size="6"]
    Log To Console                  ${result}
    Should Be Equal                 ${result}  ${ele_name}
    Sleep                                               5s
    Close Browser
