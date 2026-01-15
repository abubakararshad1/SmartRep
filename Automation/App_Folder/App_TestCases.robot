*** Settings ***
** Settings ***
Library    AppiumLibrary
Library    SeleniumLibrary
#Library    AllureLibrary
#Library    OperatingSystem
#Suite Setup    Create Screenshot Directory
#Test Teardown    Run Keywords
#...    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Capture Page Screenshot    ${SCREENSHOT_DIR}/failed_${TEST NAME}.png
#...    AND    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Allure Attach File    ${SCREENSHOT_DIR}/failed_${TEST NAME}.png    name=Failed Screenshot    attachments=image/png


*** Variables ***
${REMOTE_URL}    http://localhost:4723
${PLATFORM_NAME}    Android
#${DEVICE_NAME}    0E54805I241002DE
${DEVICE_NAME}    emulator-5554
#${DEVICE_NAME}    R52N10AVLQR
${APP_PACKAGE}       com.smartrep
${APP_ACTIVITY}      com.smartrep.MainActivity
${UI_AUTOMATION}     uiautomator2

*** Test Cases ***
Verify that the user can Launch SmartRep app, switch to Sandbox, login and open Tour Plan.
    [Documentation]    Verify that the user can Launch SmartRep app, switch to Sandbox, login and open Tour Plan.
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${UI_AUTOMATION}
    #    First time comment "noReset" Line so we can start app from scratch
    #    2nd time mark "noReset" Line as uncomment ( As we are proceeding without resetting the app)
    ...    noReset=true             # (Optional) Prevents app data reset/close when starting sessions
    ...    autoGrantPermissions=true