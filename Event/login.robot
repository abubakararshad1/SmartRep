*** Settings ***

Library     AppiumLibrary


*** Variables ***

${REMOTE_URL}    http://localhost:4723

${PLATFORM_NAME}    Android

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


##Invalid Login Test Case
#
##     Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="https://login.salesforce.com"]     20s
#
##    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#
##    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#
##    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#
##    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#
##    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#
##    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
#
###    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#
##    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     20s
#
##    Sleep    5s
#
##    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    asad.abbas@crm360.com
#
##    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025-123
#
##    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
#
##    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Error: Please check")]     10s
#
##
#
##    Text Should Be Visible   Error: Please check your username and password. If you still can't log in, contact your Salesforce administrator.
#
##
#
##    Sleep    5s
#
#
#Valid Login Test Case
#
##Login to Salesforce Flow
#    Sleep    10s
##    Wait Until Element Is Visible    android=new UiSelector().text("https://test.salesforce.com")     30s
#    Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc="More options"]     10s
#    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#
#    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#
#    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#
#    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#
#    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
#
##    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#    Sleep    5s
#    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     20s
#
#    Sleep    5s
#
#    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    qa.smartcrm@bssuniversal.com
#
#    Sleep    5s
#
#    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025
#
#    Sleep    5s
#
#    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
#
##    Click Element    xpath=//android.widget.TextView[@content-desc="Predicted app: SmartForce"]
#
#    Sleep    20s
#
##    click sync button
#
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]         20s
#
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
#
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle" and @text="Sync Complete"]    180s
#
#    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="OK"]
#
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contacts"]     10s

