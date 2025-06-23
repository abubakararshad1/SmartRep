*** Settings ***
Library     AppiumLibrary

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


#Invalid Login Test Case
#     Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="https://login.salesforce.com"]     20s
#    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
##    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     20s
#    Sleep    5s
#    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    asad.abbas@crm360.com
#    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025-123
#    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Error: Please check")]     10s
#
#    Text Should Be Visible   Error: Please check your username and password. If you still can't log in, contact your Salesforce administrator.
#
#    Sleep    5s


Valid Login Test Case
   #Login to Salesforce Flow
#
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="https://login.salesforce.com"]     20s
#    Click Element    xpath=//android.widget.ImageView[@content-desc="More options"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]    10s
#    Click Element    xpath=//android.widget.TextView[@resource-id="com.smartrep:id/title" and @text="Change Server"]
#    Wait Until Element Is Visible    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]    10s
#    Click Element    xpath=//android.widget.RadioButton[@text="Sandbox\nhttps://test.salesforce.com"]
#    Click Element    xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
##    Wait Until Element Is Visible    xpath=//android.webkit.WebView[@text="Login | Salesforce"]     10s
#    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="Log In to Sandbox"]     20s
#    Sleep    10s
#    Input Text    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View[2]/android.widget.EditText    qa.smartcrm@bssuniversal.com
#    Input Password    xpath=//android.webkit.WebView[@text="Login | Salesforce"]/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View[2]/android.view.View/android.view.View[1]/android.widget.EditText    Bss@2025
#    Click Element    xpath=//android.widget.Button[@text="Log In to Sandbox"]
##    Click Element    xpath=//android.widget.TextView[@content-desc="Predicted app: SmartForce"]
#    Sleep    30s
#
##     click sync button
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]         20s
#    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="android:id/alertTitle" and @text="Sync Complete"]    280s
#    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button1" and @text="OK"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contacts"]     10s
#    Sleep    5s
##8 Contact/DCR = Verify that the user can update the contact information  (DCR module).
#    Sleep    10s
#    Click Element   xpath= //android.view.ViewGroup[@content-desc="Contacts"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[1]
#    Sleep    5s
#    Click Element    xpath = //android.widget.TextView[@text="Emily Rivera"]
#    Sleep    10s
#    Click Element    xpath = //android.view.ViewGroup[@content-desc="Edit"]
#    Sleep    5s
#   Input Text    xpath= //android.widget.EditText[@resource-id="@undefined/input" and @text="Contact Home Phone"]   12345
#   Sleep    10s
#    Clear Text    xpath= //android.widget.EditText[@resource-id="@undefined/input" and @text="Emily"]
#    Sleep    15s
#    Input Text    xpath = //android.widget.EditText[@resource-id="@undefined/input" and @text="Contact First Name"]   Ahmad
#    Sleep    10s
#    Click Element    xpath= //android.view.ViewGroup[@content-desc="Save"]
#
#9    #Verify that user can View DCR detail of the updated Contact.
#    Sleep    10s
#    Click Element     xpath= //android.view.ViewGroup[@content-desc="DCR"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[1]
#    Sleep    5s
#    Click Element    xpath = //android.view.ViewGroup[@content-desc="25"]
#    Sleep    5s
#    Click Element    xpath = //android.widget.TextView[@text="100"]
#    #scroll to element
#    Sleep    5s
#    Swipe    500    1500    500    500    1000
#    Click Element    xpath= (//android.widget.TextView[@text="Emily Rivera"])[3]
#14 Verify that the user can update the account information through the DCR module.
#   Click Element     xpath= //android.view.ViewGroup[@content-desc="Accounts"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[1]
#    Sleep    5s
#    Click Element    xpath=//android.widget.EditText[@resource-id="@undefined/input"]
#    Input Text      xpath=//android.widget.EditText[@resource-id="@undefined/input"]    Alpha Hospital
#    Sleep    10s
#    Click Element    xpath= //android.widget.TextView[@text="Alpha Hospital"]
#    Sleep    0.2s
#    Click Element    xpath= //android.widget.TextView[@text="Alpha Hospital"]
#    Sleep    10s
#14 Verify that the user can update the account information through the DCR module.
#    Click Element    xpath = //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]
#    sleep   10s
#    Click Element    xpath = //android.widget.EditText[@resource-id="@undefined/input" and @text="Alpha Hospital"]
#    sleep   10s
#    Clear Text    xpath= //android.widget.EditText[@resource-id="@undefined/input" and @text="Alpha Hospital"]
#    Sleep    10s
#    Input Text      xpath= //android.widget.EditText[@resource-id="@undefined/input" and @text="Account Name"]    Victoria Hospital
#    Sleep    10s
#    Click Element      xpath= //android.widget.TextView[@text="Account Name"]
#     Sleep    10s
#     Click Element    xpath = (//android.view.ViewGroup[@content-desc="Default"])[1]
#     Sleep    10s
#     Click Element    xpath = //android.view.ViewGroup[@content-desc="B"]
#     Sleep    5s
#     Click Element    xpath = //android.view.ViewGroup[@content-desc="Save"]

#15 Verify that user can View DCR detail of the Account.
#       Click Element        xpath= //android.view.ViewGroup[@content-desc="DCR"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[3]
#        Sleep    15s
#        Click Element       xpath= //android.widget.EditText[@resource-id="@undefined/input"]
#        Sleep    15s
#        Input Text          xpath= //android.widget.EditText[@resource-id="@undefined/input"]    Victoria Hospital
#        Sleep    10s
#        Click Element       xpath= //android.view.ViewGroup[@content-desc="Victoria Hospital, Update Account"]
#        Sleep    10s
#        Click Element       xpath= //android.widget.TextView[@text="Victoria Hospital"]

#16 Verify that user can Create Time Off from the Calendar page.

#        Click Element   xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
#        Click Element   xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
#        Sleep    10s
#        Click Element   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[10]
#        Sleep    10s
#        Click Element   xpath=//android.widget.TextView[@text="Time-off"]
#        Sleep    5s
#        Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup   10s
#        Click Element   xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup
#        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup     10s
#        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="30"]    10s
#        Click Text   30
#        Sleep    10s
#        Click Element    xpath= //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
#        Sleep    10s
#        Click Element    xpath= //android.view.ViewGroup[@content-desc="First Quarter"]
#        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]   10s
#        Click Text      Business Travel
#        Sleep    5s
#        Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
#        Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#        Sleep    10s
#17 Verify that the user can view the Schedule Time Off in the Activity tab.
        Click Element   xpath= //android.widget.TextView[@text="Activities"]
        Click Element   xpath= //android.widget.TextView[@text="Activities"]
        Sleep    10s
        Click Element    xpath= //android.widget.TextView[@text="Tour Plan"]
        Wait Until Element Is Visible    xpath= //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup   10s
        Click Text      Time off
        Sleep    10s
        #test