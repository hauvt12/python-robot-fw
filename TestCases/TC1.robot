*** Settings ***
Resource   ../pageObjects/MeetingRoomAPO.robot
# Resource   ../config/ApplicationVariables.robot
Library  SeleniumLibrary


*** Variables ***
${URL}  https://team.vsee.me/u/robin4
${CHROME_OPTS}  NONE
#${USER_NAME_A}  User A
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
    Join Meeting Room With User A 


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