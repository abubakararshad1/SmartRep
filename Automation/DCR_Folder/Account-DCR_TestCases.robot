*** Settings ***
Library     AppiumLibrary

*** Variables ***
#Account Info
${OLD_ACCOUNT_NAME}      Victoria Hospital
${NEW_ACCOUNT_NAME}    Ravindra Hospital
${DCR_ACCOUNT_PRIORITY}    B
${DCR_ACCOUNT_ACTION}       Update Account
${PAGINTATION}                100


*** Test Cases ***
Verify that the user can update the Account information through the DCR
    [Documentation]    Verify that the user can update the Account information through the DCR
    [Tags]    Smoke
    Sleep        5s
    Wait Until Element Is Visible   xpath=//android.view.ViewGroup[@content-desc="Accounts"]    10s
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Accounts"]
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Accounts"]
    Sleep    3s

    # Search the account
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${OLD_ACCOUNT_NAME}
    Sleep    10s

    #select Account from list
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Account")]     10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${OLD_ACCOUNT_NAME}"]       10s
    Click Element    xpath=//android.widget.TextView[@text="${OLD_ACCOUNT_NAME}"]
    Sleep    5s
    #edit contact
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Edit"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Edit"]
    Sleep    5s
    Input Text    xpath=//android.widget.TextView[@text="Account Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText   ${NEW_ACCOUNT_NAME}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Account Priority"]//following-sibling::android.view.ViewGroup   10s
    Click Element    xpath=//android.widget.TextView[@text="Account Priority"]//following-sibling::android.view.ViewGroup
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       20s
    Click Text    ${DCR_ACCOUNT_PRIORITY}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

Verify that the user can View the DCR detail of the updated Account
    [Documentation]    Verify that the user can View the DCR detail of the updated Account
    [Tags]    Smoke
    Sleep    10s
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup   20s
    Click Element    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup
    Sleep    5s
    Click Text    ${PAGINTATION}
    #scroll to element
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]     10s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${NEW_ACCOUNT_NAME}, ${DCR_ACCOUNT_ACTION}"))
    Sleep    10s



