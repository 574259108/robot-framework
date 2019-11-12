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
${btn_basket}              //*[@class="shopee-svg-icon navbar__link-icon icon-shopping-cart-2"]
${ele_price_basket}        ฿1,621



*** Keywords ***
Verify shopee page
    [Arguments]                     ${title}
    Title Should Be                 ${title}
Close Pop Up1
    [Arguments]                     ${close_btn}
    Wait Until Element Is Visible   ${close_btn}
    Click Element                   ${close_btn}
Click Button ele_login_home
    [Arguments]                     ${ele_login_home}
    Wait Until Element Is Visible   ${ele_login_home}
    Click Element                   ${ele_login_home}
Input Login xpath_user
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
    Wait Until Element Is Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text       ${xpath_user}       ${username}
    Input Text       ${xpath_pass}       ${password}
Click Button btn_login
    [Arguments]                     ${btn_login}
    Wait Until Element Is Visible   ${btn_login}
    Click Element                   ${btn_login}
Click Button gotobasket
    [Arguments]                     ${btn_basket} 
    Wait Until Element Is Visible   ${btn_basket} 
    Click Element                   ${btn_basket}



*** Test Cases ***
Login shopee - success
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shopee}
    Verify shopee page              ${title_shopee}
    Close Pop Up1                   ${ele_close_btn}
    Sleep                           10s
    Click Button ele_login_home     ${ele_login_home}
    Sleep                           13s
    Click Button                    ${btn_login_by_fb}
    Sleep                           13s
    Select Window                   NEW
    Input Login xpath_user          ${ele_user}     ${ele_pass}       ${username}      ${password}
    Sleep                           5s
    Click Button btn_login          ${btn_login}
    Sleep                           10s
    Select Window                   
    Sleep                           5s
    
#เช็คราคาในตะกร้า    
    Close Pop Up1                                           ${ele_close_btn}
    Sleep                                                   5s
    Click Button gotobasket                                 ${btn_basket}
    Sleep                                                   5s
Verify check price
    ${result}        get text          //*[@class="cart-page-footer-summary__subtotal-amount"]
    Log To Console                  ${result}
    Should Be Equal                 ${result}  ${ele_price_basket}
    Sleep                                               5s
    Sleep                                               5s
    Close Browser
