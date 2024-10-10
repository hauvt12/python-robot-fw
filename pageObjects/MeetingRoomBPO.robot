*** Settings ***
Resource   ../locators/meetingRoomLocator.robot
Resource   ../config/ApplicationVariables.robot
Resource   CommonPO.robot
Library  SeleniumLibrary

*** Keywords ***
Join Meeting Room With User B
    Open Browser And Navigate To Page [Arguments] ${USER_NAME_B}
    Click Link [Arguments] ${FOR_PROVIDER_ELEMENT}
    Element Should Be Enable [Arguments] ${EMAIL_INPUT}
    Input Text [Arguments] ${EMAIL_INPUT} ${USERNAME}
    Input Text [Arguments] ${PASSWORD_INPUT} ${PASSWORD}
    Click Element [Arguments] ${BUTTON_SIGN_IN_ID}
    Element Should Be Enable [Arguments] ${CALL_ELEMENT}
    Click Element [Arguments] ${CALL_ELEMENT}
    Element Should Be Enable [Arguments] ${CONTINUE_ON_THIS_BROWSER_CLASS}
    Click Element [Arguments] ${CONTINUE_ON_THIS_BROWSER_CLASS}
#    Element Should Be Visible [Arguments] ${RECORD_ICON} 60
    Element Should Be Enable [Arguments] ${CHAT_BUTTON}
    Click Element [Arguments] ${CHAT_BUTTON}
#    Element Should Be Enable [Arguments] ${INPUT_TEXT_FIELD}
    sleep   30s
    Input Text [Arguments] ${INPUT_TEXT_FIELD} ${MESSAGE}
    Press Key [Arguments] ${INPUT_TEXT_FIELD} ENTER


 Verify Message
    Element Should Be Visible [Arguments] ${MESSAGE_RECEIVED_LOCATOR} 60
    ${actual-message}=    Get Text From Element [Arguments] ${MESSAGE_RECEIVED_LOCATOR}
    Should Be Equal    ${actual-message}    ${MESSAGE}       
