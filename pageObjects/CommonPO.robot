*** Settings ***

Resource   ../config/ApplicationVariables.robot

Library  SeleniumLibrary

*** Keywords ***
Open Browser And Navigate To Page [Arguments] ${user_name}
    [Documentation]    Opens a browser and navigates to a specified URL based on the user name.

    Run Keyword If    '${user_name}' == '${USER_NAME_A}'    Open Chrome With Fake Media
    Run Keyword If    '${user_name}' == '${USER_NAME_B}'       Open Browser    ${URL}    edge  

Input Text [Arguments] ${element} ${value}
    input text       ${element}     ${value}

Select Checkbox [Arguments] ${element}
    select checkbox       ${element}

Click Element [Arguments] ${element}
    click element      ${element}

Open Chrome With Fake Media
    ${options}=    Evaluate    selenium.webdriver.chrome.options.Options()    selenium.webdriver.chrome
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    Create WebDriver    Chrome    options=${options}
    go to    ${URL}

