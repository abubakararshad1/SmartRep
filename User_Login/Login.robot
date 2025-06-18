*** Settings ***
Library     AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}       com.smartrep
${APP_ACTIVITY}      com.smartrep.MainActivity
${UI_AUTOMATION}     uiautomator2
${CONTACT_NAME}     Nofal

*** Test Cases ***
Open Application
    [Documentation]    Launch SmartRep app, switch to Sandbox, login and open Tour Plan.
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${UI_AUTOMATION}
    ...    noReset=true
    ...    autoGrantPermissions=true