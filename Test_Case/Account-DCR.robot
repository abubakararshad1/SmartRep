*** Settings ***
Library     AppiumLibrary

*** Variables ***
#Account Info
${OLD_ACCOUNT_NAME}      Alpha Hospital
${NEW_ACCOUNT_NAME}    Ravindra Hospital
${DCR_ACCOUNT_PRIORITY}    B
${DCR_ACCOUNT_ACTION}       Update Account


*** Test Cases ***

Account DCR
    Sleep        5s
    Wait Until Element Is Visible   xpath=//android.view.ViewGroup[@content-desc="Accounts"]    10s
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Accounts"]
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Accounts"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Account")]     10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${OLD_ACCOUNT_NAME}"]       10s
    Click Element    xpath=//android.widget.TextView[@text="${OLD_ACCOUNT_NAME}"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Edit"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Edit"]
    Sleep    5s
    Input Text    xpath=//android.widget.TextView[@text="Account Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText   ${NEW_ACCOUNT_NAME}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Account Priority"]//following-sibling::android.view.ViewGroup   10s
    Click Element    xpath=//android.widget.TextView[@text="Account Priority"]//following-sibling::android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Click Text    ${DCR_ACCOUNT_PRIORITY}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

#9    #Verify that user can View DCR detail of the updated Contact.
    Sleep    5s
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup   20s
    Click Element    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup
    Sleep    5s
    Click Text    100
    #scroll to element
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]     10s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${NEW_ACCOUNT_NAME}, ${DCR_ACCOUNT_ACTION}"))
    Sleep    10s



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