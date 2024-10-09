*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL}  https://team.vsee.me/u/robin4
${CHROME_OPTS}  NONE
${USER_NAME_A}  User A
${USER_NAME_B}  User B
${CHECKBOX_ID}    jsonform-1-elt-consent
${BUTTON_ENTER_LOCATOR}     //input[@value='Enter Waiting Room']
${CONTINUE_BUTTON_LOCATOR}    //button[@data-action='reminder-btn-clicked']
${FOR_PROVIDER_ELEMENT}    //a[text()="For Providers"]
${EMAIL_INPUT}       //input[@placeholder='Email']
${PASSWORD_INPUT}       //input[@placeholder='Password']
${USERNAME}     monluoian@gmail.com
${PASSWORD}     devLab08@123
${BUTTON_SIGN_IN_ID}    btnSignIn
*** Test Cases ***

JOIN MEETING ROOM WITH USER A
    [Documentation]  Open browser
    ${options}=    Evaluate    selenium.webdriver.chrome.options.Options()    selenium.webdriver.chrome
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    Create WebDriver    Chrome    options=${options}
    go to    ${URL}
    input text  name:first_name     ${USER_NAME_A}
    select checkbox     id:${CHECKBOX_ID}
    click element   xpath:${BUTTON_ENTER_LOCATOR}
    sleep   30s
    click element   xpath:${CONTINUE_BUTTON_LOCATOR}
    sleep   30s



JOIN MEETING ROOM WITH USER B
    [Documentation]  Open browser
    open browser    ${URL}   edge
    click link      ${FOR_PROVIDER_ELEMENT}
    sleep   10s
    input text  xpath:${EMAIL_INPUT}     ${USERNAME}
    input text  xpath:${PASSWORD_INPUT}      ${PASSWORD}
    click element   id:${BUTTON_SIGN_IN_ID}
    sleep   5s
*** Keywords ***
