*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

TWINS
    [Tags]  12952
    Wait Until Page Contains Element    xpath=(//a[@id="id"])[2]
    Click Element                       xpath=(//a[@id="id"])[2]
    Verify Solved

MATH
    [Tags]  32403
    Wait Until Page Contains Element    id=no1
    ${first_value}    Get Text    id=no1
    ${second_value}       Get Text        id=no2
    ${operant_value}      Get Text        id=symbol1
    ${result}    Evaluate  ${first_value}${operant_value}${second_value}
    Input Text     id=result     ${result}

WAIT A MOMENT
    [Tags]  33678
    Click Element    id=one
    Wait Until Element Is Enabled    id=two    timeout=1000000
    Click Element    id=two
    Verify Solved