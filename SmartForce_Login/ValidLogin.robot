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
    ...    noReset=true
    ...    autoGrantPermissions=true

#login functionality with an valid username and password.
#   Login to Salesforce Flow

#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="https://login.salesforce.com"]     20s
#    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
##    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     20s
#    Sleep    5s
#    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    qa.smartcrm@bssuniversal.com
#    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025
#    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
##    Click Element    xpath=//android.widget.TextView[@content-desc="Predicted app: SmartForce"]
#    Sleep    20s
