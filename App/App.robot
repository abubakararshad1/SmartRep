*** Settings ***
Library     AppiumLibrary


*** Variables ***
${REMOTE_URL}    http://localhost:4723
${PLATFORM_NAME}    Android
#${DEVICE_NAME}    0E54805I241002DE
${DEVICE_NAME}    emulator-5554
${APP_PACKAGE}       com.smartrep
${APP_ACTIVITY}      com.smartrep.MainActivity
${UI_AUTOMATION}     uiautomator2


*** Test Cases ***

Open Application
    [Documentation]    Launch SmartRep app, switch to Sandbox, login and open Tour Plan.
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