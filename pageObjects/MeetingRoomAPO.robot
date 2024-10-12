*** Settings ***
Resource   ../locators/welcomePageLocator.robot
Resource   ../locators/callingPageLocator.robot
Resource   ../config/ApplicationVariables.robot
Resource   CommonPO.robot
Library  SeleniumLibrary

*** Keywords ***
Join Meeting Room With User A 
    Open Browser And Navigate To Page [Arguments] ${USER_NAME_A}
    Input Text [Arguments] ${FIRST_NAME_INPUT} ${USER_NAME_A}
    Select Checkbox [Arguments] ${CHECKBOX_ID}
    Click Element [Arguments] ${BUTTON_ENTER_LOCATOR}
    sleep   30s
    #Click Element [Arguments] ${CONTINUE_BUTTON_LOCATOR}
    Element Should Be Visible [Arguments] ${TOGGLE_LABEL} 90
    ${actual_text}=     Get Text From Element [Arguments] ${TOGGLE_LABEL}
    Verify Message [Arguments] ${actual_text} ${EXPECTED_TOGGLE_TEXT}    
        
User A Leave Meeting
    Select Frame    ${IFRAME}
    Click Element [Arguments] ${LEAVE}