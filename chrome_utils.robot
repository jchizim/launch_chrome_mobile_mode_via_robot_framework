*** Settings ***
Library           SeleniumLibrary    15    5

*** Keywords ***
Chrome Mobile Go To
    [Arguments]    ${url}    ${mobile}=Galaxy S5
    [Documentation]    Starts a Chrome Browser in Mobile Emulation with specified device model
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Create webDriver    Chrome    chrome_options=${options}
    &{mobile_emulation}=    Create Dictionary    deviceName=${mobile}
    Call Method    ${options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    Create Webdriver    Chrome    chrome_options=${options}
    GoTo    ${url}