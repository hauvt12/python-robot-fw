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
${BUTTON_JOIN_NOW}      //div[@aria-label='Join Now']
${USERNAME}     monluoian@gmail.com
${PASSWORD}     devLab08@123
${BUTTON_SIGN_IN_ID}    btnSignIn
${CALL_ELEMENT}     (//a[@title='Call'])[1]
${CONTINUE_ON_THIS_BROWSER_CLASS}       //div[@class='call_options round-10']
${CHAT_BUTTON}      //button[@data-chatroom]
${INPUT_TEXT_FIELD}     //input[@type='textarea']
${MESSAGE}      Hello !!
${TOOL_BOX}     //div[@class='toolbox-content-items']
${RECORD_ICON}      //span[text()='REC']
${MESSAGE_RECEIVED_LOCATOR}     //div[@class='webchat-message-content']
${TOGGLE_LABEL}      //div[@class='icon-off']/following-sibling::div
${EXPECTED_TOGGLE_TEXT}    Text me when the provider is ready
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
    #click element   xpath:${CONTINUE_BUTTON_LOCATOR}
    Wait Until Element Is Visible   xpath:${TOGGLE_LABEL}        90
    ${actual-toggle-text}=    Get Text    xpath:${TOGGLE_LABEL}
    Should Be Equal    ${actual-toggle-text}    ${EXPECTED_TOGGLE_TEXT}



JOIN MEETING ROOM WITH USER B
    [Documentation]  Open browser
    ${options}=    Evaluate    selenium.webdriver.edge.options.Options()    selenium.webdriver.edge
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream
    Create WebDriver    Edge    options=${options}
    go to    ${URL}
    click link      ${FOR_PROVIDER_ELEMENT}
    Wait Until Element Is Enabled   xpath:${EMAIL_INPUT}
    input text  xpath:${EMAIL_INPUT}     ${USERNAME}
    input text  xpath:${PASSWORD_INPUT}      ${PASSWORD}
    click element   id:${BUTTON_SIGN_IN_ID}
    Wait Until Element Is Enabled   xpath:${CALL_ELEMENT}
    click element   xpath:${CALL_ELEMENT}
    Wait Until Element Is Enabled   xpath:${CONTINUE_ON_THIS_BROWSER_CLASS}
    click element   xpath:${CONTINUE_ON_THIS_BROWSER_CLASS}
#    Wait Until Element Is Visible   xpath:${RECORD_ICON}        60
    Wait Until Element Is Enabled   xpath:${CHAT_BUTTON}
    click element   xpath:${CHAT_BUTTON}
#    Wait Until Element Is Enabled   xpath:${INPUT_TEXT_FIELD}
    sleep   30s
    input text    xpath:${INPUT_TEXT_FIELD}     ${MESSAGE}
    Press Keys    xpath:${INPUT_TEXT_FIELD}     ENTER


VERIFY MESSAGE
    [Documentation]  VERIFY RECEIVED MESSAGE
    Wait Until Element Is Visible   xpath:${MESSAGE_RECEIVED_LOCATOR}       60
    ${actual-message}=    Get Text    xpath:${MESSAGE_RECEIVED_LOCATOR}
    Should Be Equal    ${actual-message}    ${MESSAGE}


*** Keywords ***
