*** Settings ***
Resource   ../locators/meetingRoomLocator.robot
Resource   ../config/ApplicationVariables.robot
Resource   CommonPO.robot
Library  SeleniumLibrary

*** Keywords ***
Join Meeting Room With User A 
    Open Browser And Navigate To Page [Arguments] ${USER_NAME_A}
    Input Text [Arguments] ${firstName} ${USER_NAME_A}
    Select Checkbox [Arguments] ${checkboxID}
    Click Element [Arguments] ${enterButton}
    sleep   30s
    Click Element [Arguments] ${continueButton}
    sleep   30s
    
