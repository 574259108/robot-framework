*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shopee}              https://shopee.co.th
${title_shopee}            Shopee Thailand | ซื้อขายผ่านมือถือ หรือออนไลน์
${ele_close_btn}           //*[@class="shopee-popup__close-btn"]
${ele_login_home}          //*[@class="navbar__link navbar__link--account navbar__link--tappable navbar__link--hoverable navbar__link-text navbar__link-text--medium"]
${btn_login_by_fb}         //*[@class="_2DvX7K _3j9-lD _1-ugxP _1MFQ2Z"]
${ele_user}                //*[@id="email"]
${ele_pass}                //*[@id="pass"]
${username}                idfb
${password}                passfb
${btn_login}               //*[@id="loginbutton"]
*** Keywords ***
Verify shopee page
    [Arguments]                     ${title}
    Title Should Be                 ${title}
Close Pop Up
     [Arguments]                     ${close_btn}
  Wait Until Element Is Visible   ${close_btn}
   Click Element                   ${close_btn}
Click Button
    [Arguments]                     ${ele_login_home}
    Wait Until Element Is Visible   ${ele_login_home}
    Click Element                   ${ele_login_home}
Input Login
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Wait Until Element Is Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}
*** Test Cases ***
Login shopee - success
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shopee}
    Verify shopee page              ${title_shopee}
   Close Pop Up                    ${ele_close_btn}
    Sleep                           5s
    Click Button                    ${ele_login_home}
    Sleep                           13s
    Click Button                    ${btn_login_by_fb}
    Sleep                           13s
    Select Window                   NEW
    Input Login                     ${ele_user}     ${ele_pass}       ${username}      ${password}
    Sleep                           5s
    Click Button                    ${btn_login}
    Sleep                           10s
    Select Window                   
    Sleep                           3s
    Sleep                           5s
    Close Browser
