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
${ele_search}              //*[@class="shopee-searchbar-input__input"]
${input_item}              ดินสอ
${btn_search}              //*[@class="btn btn-solid-primary btn--s btn--inline"]
${ele_item}                //*[@class="_1gkBDw _2O43P5"]
${add_cart}                //*[@class="btn btn-tinted btn--l YtgjXY _3a6p6c"]
${btn_home}              //*[@class="_3yPx2v"]
${ele_search2}              //*[@class="shopee-searchbar-input__input"]
${input_item2}             External
${btn_search2}             //*[@class="btn btn-solid-primary btn--s btn--inline"]
${ele_item2}               //*[@class="_1gkBDw _2O43P5"]
${item}                    //*[@class="product-variation"]
${add_cart2}               //*[@class="btn btn-tinted btn--l YtgjXY _3a6p6c"]
${btn_basket}              //*[@class="shopee-svg-icon navbar__link-icon icon-shopping-cart-2"]
${ele_price_basket}        ฿970



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
Input Item ele_item
    [Arguments]                     ${xpath_item}  ${ele_item}     
    Wait Until Element Is Visible   ${xpath_item}
    Input Text                      ${xpath_item}  ${ele_item}  
Click Button btn_login
    [Arguments]                     ${btn_login}
    Wait Until Element Is Visible   ${btn_login}
    Click Element                   ${btn_login}
Click Button Search btn_search
    [Arguments]                     ${btn_search}
    Wait Until Element Is Visible   ${btn_search}
    Click Element                   ${btn_search}
Click Button additem ele_item
    [Arguments]                     ${ele_item} 
    Wait Until Element Is Visible   ${ele_item} 
    Click Element                   ${ele_item}
Click Button addcart add_cart
    [Arguments]                     ${add_cart}
    Wait Until Element Is Visible   ${add_cart}
    Click Element                   ${add_cart}
Click Button tohome btn_home
    [Arguments]                     ${btn_home}
    Wait Until Element Is Visible   ${btn_home}
    Click Element                   ${btn_home}
Input Item ele_item2
    [Arguments]                     ${xpath_item2}  ${ele_item2}     
    Wait Until Element Is Visible   ${xpath_item2}
    Input Text                      ${xpath_item2}  ${ele_item2}  
Click Button Search btn_search2
    [Arguments]                     ${btn_search2}
    Wait Until Element Is Visible   ${btn_search2}
    Click Element                   ${btn_search2}
Click Button additem2 
    [Arguments]                     ${ele_item2} 
    Wait Until Element Is Visible   ${ele_item2} 
    Click Element                   ${ele_item2}
Click Button add_cart2
    [Arguments]                     ${add_cart2}
    Wait Until Element Is Visible   ${add_cart2}
    Click Element                   ${add_cart2}
Verify check price
    [Arguments]                     ${title_price}
    Title Should Be                 ${title_price}
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
    Sleep                           5s
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
    Close Pop Up1                   ${ele_close_btn}
    Sleep                           5s
    Input Item ele_item             ${ele_search}   ${input_item}
    Sleep                           5s
    Click Button Search btn_search  ${btn_search}
    Sleep                           5s
    Click Button additem ele_item   ${ele_item}
    Sleep                           5s
    Click Button addcart add_cart   ${add_cart}
    Sleep                           5s
    Click Button tohome btn_home                        ${btn_home}
    Sleep                                               5s
    Close Pop Up1                                       ${ele_close_btn}
    Sleep                                               5s
    Input Item ele_item2                                ${ele_search2}   ${input_item2}
    Sleep                                               5s
    Click Button Search btn_search2                     ${btn_search2}
    Sleep                                               5s
    Click Button additem2                               ${ele_item2}
    Sleep                                               10s
    Click Button                                        ${item}
    Sleep                                               3s  
    Click Button add_cart2                              ${add_cart2}
    Sleep                                               5s
    Sleep                                               5s
#เช็คราคาในตะกร้า    
    Click Button tohome btn_home                            ${btn_home}
    Sleep                                                   5s
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
