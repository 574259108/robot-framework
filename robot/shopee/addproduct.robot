*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shopee}              https://shopee.co.th
${title_shopee}            Shopee Thailand | ซื้อขายผ่านมือถือ หรือออนไลน์
${ele_close_btn}           //*[@class="shopee-popup__close-btn"]
${ele_search}              //*[@class="shopee-searchbar-input__input"]
${input_item}              เสื้อผ้า
${btn_search}              //*[@class="btn btn-solid-primary btn--s btn--inline"]
${ele_item}                //*[@class="_1gkBDw _2O43P5"]
${add_cart}                //*[@class="btn btn-tinted btn--l YtgjXY _3a6p6c"]
${item}                    //*[@class="product-variation"]
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
Input Item
    [Arguments]                     ${xpath_item}  ${ele_item} 
    Wait Until Element Is Visible   ${xpath_item}
    Input Text                      ${xpath_item}  ${ele_item}
Click Button Search
    [Arguments]                     ${btn_search}
    Wait Until Element Is Visible   ${btn_search}
    Click Element                   ${btn_search}
Click Button
    [Arguments]                     ${ele_item}
    Wait Until Element Is Visible   ${ele_item}
    Click Element                   ${ele_item}
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
    Sleep                           3s
    Input Item                      ${ele_search}   ${input_item}
    Sleep                           3s
    Click Button                    ${btn_search}
    Sleep                           5s
    Click Button                    ${ele_item}
    Sleep                           3s
    Click Button                    ${add_cart}
    Sleep                           13s
    Click Button                    ${btn_login_by_fb}
    Sleep                           13s
    Select Window                   NEW
    Input Login                     ${ele_user}     ${ele_pass}       ${username}      ${password}
    Sleep                           5s
    Click Button                    ${btn_login}
    Sleep                           10s
    Select Window                   
    Sleep                           5s
    Click Button                    ${item}
    Sleep                           3s        
    Click Button                    ${add_cart}
    Sleep                           3s
    Sleep                           5s
    Close Browser
