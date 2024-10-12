*** Settings ***
Resource   ../pageObjects/MeetingRoomAPO.robot
Resource   ../pageObjects/MeetingRoomBPO.robot
Resource   ../config/ApplicationVariables.robot
Library  SeleniumLibrary


*** Test Cases ***
JOIN MEETING ROOM WITH USER A
    Join Meeting Room With User A

JOIN MEETING ROOM WITH USER B
    Join Meeting Room With User B

VERIFY MESSAGE AND USER B LEAVE MEETING
    Verify Message And Leave Meeting

USER A LEAVE MEETING
    User A Leave Meeting
