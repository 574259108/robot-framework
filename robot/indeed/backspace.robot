*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_shop}                 https://www.google.co.th/search?hl=th&q=The%20Imitation%20Game%20(2014)%20%E0%B8%96%E0%B8%AD%E0%B8%94%E0%B8%A3%E0%B8%AB%E0%B8%B1%E0%B8%AA%E0%B8%A5%E0%B8%B1%E0%B8%9A%20%E0%B8%AD%E0%B8%B1%E0%B8%88%E0%B8%89%E0%B8%A3%E0%B8%B4%E0%B8%A2%E0%B8%B0%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B8%81%E0%B9%82%E0%B8%A5%E0%B8%81




*** Keywords ***


*** Test Cases ***
check Register
    [tags]    success
    Open Browser    about:blank     chrome
    Go To                           ${url_shop}
    Clear Element Text      //*[@class="gLFyf gsfi"]
    Sleep                           5s
    Close Browser