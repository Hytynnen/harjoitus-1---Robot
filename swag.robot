*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Variables ***
${SERVER}         https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}          0
${user}           standard_user
${pass}           secret_sauce

*** Keywords ***
Prepare Browser
    Open Browser    ${SERVER}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Obstacle
    Go To   ${SERVER}
    
Verify Solved
    Wait Until Page Contains    THANK YOU FOR YOUR ORDER

*** Test Cases ***

SWAGTEST
    #Wait Until Page Contains Element  id=user-name
    Input Text  id=user-name    ${user}
    Input Text  id=password    ${pass}
    Click Element    id=login-button
    Click Element    xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    id=shopping_cart_container
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    id=first-name    test
    Input Text    id=last-name    user
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

SWAGTESTwrongpass
    #Wait Until Page Contains Element  id=user-name
    Input Text  id=user-name    ${user}
    Input Text  id=password    testitesti
    Click Element    id=login-button
    Click Element    xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    id=shopping_cart_container
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    id=first-name    test
    Input Text    id=last-name    user
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

SWAGTESTlocked
    #Wait Until Page Contains Element  id=user-name
    Input Text  id=user-name    locked_out_user
    Input Text  id=password    ${pass}
    Click Element    id=login-button
    Click Element    xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    id=shopping_cart_container
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    id=first-name    test
    Input Text    id=last-name    user
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

SWAGTESTProblem
    #Wait Until Page Contains Element  id=user-name
    Input Text  id=user-name    problem_user
    Input Text  id=password    ${pass}
    Click Element    id=login-button
    Click Element    xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    id=shopping_cart_container
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    id=first-name    test
    Input Text    id=last-name    user
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

SWAGTESTperformanceglitch
    #Wait Until Page Contains Element  id=user-name
    Input Text  id=user-name    performance_glitch_user
    Input Text  id=password    ${pass}
    Click Element    id=login-button
    Click Element    xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    id=shopping_cart_container
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    id=first-name    test
    Input Text    id=last-name    user
    Input Text    id=postal-code    12345
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]