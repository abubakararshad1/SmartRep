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
##    Click Element    xpath=//android.widget.TextView[@resource-id="android:id/title" and @text="Apps"]
##    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/title" and @text="Default apps"]  10s
##    Click Element    xpath=//android.widget.TextView[@resource-id="android:id/title" and @text="Default apps"]
##
##
##    Login to Salesforce Flow
#
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="https://login.salesforce.com"]     10s
#    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
##    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     10s
#    Sleep    5s
#    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    qa.smartcrm@bssuniversal.com
#    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025
#    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
##    Click Element    xpath=//android.widget.TextView[@content-desc="Predicted app: SmartForce"]
#    Sleep    5s
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]         20s
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle" and @text="Sync Complete"]    180s
#    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="OK"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contacts"]     10s

##       Contact Tab Tour Plan Flow
#
##    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s
#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
#    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
##    Sleep    5s
##    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
#    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[5]/android.view.ViewGroup    10s
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[5]/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]     10s
#    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup    10s
#    Click Element    xpath=(//android.view.ViewGroup[@content-desc="27"])[2]/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
#    Sleep    5s
##    [927,683][1044,779]
##    [1516,683][1633,779]
#    Swipe   1574    731    940    731    800   # From Y=732 to Y=632 (scrolls up)
#    Sleep    2s
#    Swipe    1574   731    1100    731    800
#    Swipe    1599    731    1020    731    800
#    Sleep    2s
#    Swipe    1574    731    940    731    800
#    Sleep    2s
#    Swipe    1599    731    1020    731    800   # Repeat as needed
##    Click A Point    200    700
#    Sleep    5s
#    Swipe    1560    915    1303    915    800
##    Swipe    1516    915    927     915    800
##    Swipe    1044    915    927    915    800
#    Sleep    2s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]
#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup      10s
#    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="10"]
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]     10s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s
#    Sleep    5s
#
##    Verify Tour Plan from the Activity Tab
#
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
#    Sleep    3s
#    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
#    Sleep    2s
#    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Nofal")])[1]     10s
#    Sleep    3s
##    Scroll Element Into View    xpath=//android.view.ViewGroup[contains(@content-desc,"Nofal, 2025-05-22, 16:30")]/android.view.ViewGroup[1]/android.widget.TextView
##    Click Element    xpath=//android.view.ViewGroup[contains(@content-desc,"Nofal, 2025-05-22, 16:30")]/android.view.ViewGroup[1]/android.widget.TextView
#     Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("Nofal, 2025-05-27, 16:30"))
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[@text="Tour Plan"]
##    Click Element    xpath=//android.view.ViewGroup[@content-desc="Convert 1:1"]
#    Sleep    3s
#
##    Tour Execution from Contacts
#
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contact Relation"]      10s
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
#    Sleep    5s
#    Swipe   1574    731    940    731    800   # From Y=732 to Y=632 (scrolls up)
#    Sleep    2s
#    Swipe    1599    731    1020    731    800
#    Sleep    2s
#    Swipe    1560    731    1303    731    800
#    Sleep    5s
#    Swipe    1560    915    1303    915    800
#    Sleep    2s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]        10s
#    Sleep    3s
#
##    Verify Tour Execution from the Activity Tab
#
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
#    Sleep    3s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Tour Plan"]
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        10s
#    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]     10s
#    Sleep    3s
#    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
#    Sleep    2s
#    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Nofal")])[1]     10s
#    Sleep    3s
#    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("Nofal, 2025-05-09, 10:30"))
#    Sleep    3s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Dashboard"]
#    Sleep    5s
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]         20s
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle" and @text="Sync Complete"]    180s
#    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="OK"]
#    Sleep    10s