*** Variables ***
${BUTTON_JOIN_NOW}      xpath=//div[@aria-label='Join Now']
${CONTINUE_BUTTON_LOCATOR}    xpath=//button[@data-action='reminder-btn-clicked']
${TOGGLE_LABEL}      xpath=//div[@class='icon-off']/following-sibling::div
${CHAT_BUTTON}      xpath=//button[@data-chatroom]
${INPUT_TEXT_FIELD}     xpath=//input[@type='textarea']
${TOOL_BOX}     xpath=//div[@class='toolbox-content-items']
${RECORD_ICON}      xpath=//span[text()='REC']
${MESSAGE_RECEIVED_LOCATOR}     xpath=//div[@class='webchat-message-content']
${IFRAME}     id=jitsiConferenceFrame0
${LEAVE}        xpath=//div[contains(@class,'hangup')]
${END_ALL_FORM}     id=EndAllForm
${END_VISIT_FOR_ALL}       xpath=//button[text()='End Visit for all']
${END_VISIT}        xpath=//a[contains(text(), 'End Visit')]