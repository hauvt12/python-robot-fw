*** Variables ***
${CHECKBOX_ID}    id=jsonform-1-elt-consent
${BUTTON_ENTER_LOCATOR}     xpath=//input[@value='Enter Waiting Room']
${CONTINUE_BUTTON_LOCATOR}    xpath=//button[@data-action='reminder-btn-clicked']
${FOR_PROVIDER_ELEMENT}    xpath=//a[text()="For Providers"]
${EMAIL_INPUT}       xpath=//input[@placeholder='Email']
${PASSWORD_INPUT}       xpath=//input[@placeholder='Password']
${BUTTON_JOIN_NOW}      //div[@aria-label='Join Now']
${BUTTON_SIGN_IN_ID}    id=btnSignIn
${CALL_ELEMENT}     xpath=(//a[@title='Call'])[1]
${CONTINUE_ON_THIS_BROWSER_CLASS}       xpath=//div[@class='call_options round-10']
${CHAT_BUTTON}      xpath=//button[@data-chatroom]
${INPUT_TEXT_FIELD}     xpath=//input[@type='textarea']
${TOOL_BOX}     xpath=//div[@class='toolbox-content-items']
${RECORD_ICON}      xpath=//span[text()='REC']
${MESSAGE_RECEIVED_LOCATOR}     xpath=//div[@class='webchat-message-content']
${TOGGLE_LABEL}      xpath=//div[@class='icon-off']/following-sibling::div
${FIRST_NAME_INPUT}      name=first_name
