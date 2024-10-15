*** Settings ***

Resource   ../config/ApplicationVariables.robot

Library  SeleniumLibrary

*** Keywords ***
Open Browser And Navigate To Page [Arguments] ${user_name}
    [Documentation]    Opens a browser and navigates to a specified URL based on the user name.

    Run Keyword If    '${user_name}' == '${USER_NAME_A}'       Open Chrome With Fake Media
    
    Run Keyword If    '${user_name}' == '${USER_NAME_B}'       Open Edge With Fake Media
 

Open Chrome With Fake Media
    ${options}=    Evaluate    selenium.webdriver.chrome.options.Options()    selenium.webdriver.chrome
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    ${chrome_driver}=     Create WebDriver    Chrome    options=${options}
    go to    ${URL}

Open Edge With Fake Media
    ${options}=    Evaluate    selenium.webdriver.edge.options.Options()    selenium.webdriver.edge
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    ${edge_driver}=     Create WebDriver    Edge    options=${options}
    go to    ${URL}


Input Text [Arguments] ${element} ${value}
    input text       ${element}     ${value}

Select Checkbox [Arguments] ${element}
    select checkbox       ${element}

Click Element [Arguments] ${element}
    click element      ${element}

Click Link [Arguments] ${locator}
    click link      ${locator}

Press Key [Arguments] ${locator} ${Key}
    Press Keys    ${locator}     ${Key}

Get Text From Element [Arguments] ${locator}
    ${text}=    Get Text    ${locator} 
    Return From Keyword    ${text}

Verify Message [Arguments] ${actual_text} ${expect_text}
    Should Be Equal      ${actual_text}     ${expect_text}

Element Should Be Enable [Arguments] ${locator}
    Wait Until Element Is Enabled    ${locator}

Element Should Be Visible [Arguments] ${locator} ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}

Switch Browser [Arguments] ${value}
    Run Keyword If    '${value}' == 'chrome'    Switch Browser      1
    Run Keyword If    '${value}' == 'edge'      Switch Browser [    2