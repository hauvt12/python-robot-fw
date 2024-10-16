*** Settings ***
Resource   ../locators/welcomePageLocator.robot
Resource   ../locators/callingPageLocator.robot
Resource   ../config/ApplicationVariables.robot
Resource   CommonPO.robot
Library  SeleniumLibrary

*** Keywords ***
Join Meeting Room With User A 
    Open Browser And Navigate To Page [Arguments] ${USER_NAME_A}
    Element Should Be Visible [Arguments] ${FIRST_NAME_INPUT} 20
    Input Text [Arguments] ${FIRST_NAME_INPUT} ${USER_NAME_A}
    Select Checkbox [Arguments] ${CHECKBOX_ID}
    Click Element [Arguments] ${BUTTON_ENTER_LOCATOR}
    sleep   30s
    Element Should Be Visible [Arguments] ${TOGGLE_LABEL} 90
    ${actual_text}=     Get Text From Element [Arguments] ${TOGGLE_LABEL}
    Verify Message [Arguments] ${actual_text} ${EXPECTED_TOGGLE_TEXT}    
        
User A Leave Meeting
    Switch Browser [Arguments] chrome
    Element Should Be Visible [Arguments] ${END_VISIT} 10
    Click Element [Arguments] ${END_VISIT}
    Close Browser