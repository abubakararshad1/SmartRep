*** Settings ***

Library     AppiumLibrary

*** Variables ***

${EXPENSE_NAME}             Marketing Event Sponsorship
${EXPENSE_START_DATE}       10
${EXPENSE_END_DATE}         10
${EXPENSE_DATE}             10
${EXPENSE_COUNTRY}          United Arab Emirates
${EXPENSE_BEHALF}           QA Team
${EXPENSE_STATUS}           Draft
${RELATED_CONTACT}          Jason Patel
${EXPENSE_TYPE}             Accommodation
${EXPENSE_AMOUNT}           $750
${BUYING_CURRENCY}          USD
${SELLING_CURRENCY}         USD
${EXCHANGE_RATE_BUYING}     $300
${EXCHANGE_RATE_SELLING}    $250
${REPORT_LINE_COUNTRY}      United Arab Emirates
${RELATED_ACCOUNT}          AE-Sample Brick-04


*** Test Cases ***
Verify that user can Add new expense in the Expense module
#click on the expense tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Expense"]/android.view.ViewGroup
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Expense"]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Expense Reports")])[1]       10s
#Click on the Add button.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add"]
#Expense Report Name
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Expense Report Name"]    ${EXPENSE_NAME}
#Start Date
    Sleep    5s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[3]/android.view.ViewGroup/*
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EXPENSE_START_DATE}"]
#End Date: 10/6/2025
    Sleep    5s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[4]/android.view.ViewGroup/*
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]     10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EXPENSE_END_DATE}"]/android.view.ViewGroup
#Country: United Arab Emirates
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   10s
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="${EXPENSE_COUNTRY}"]
#Expense Of Behalf (User): QA team
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input"]    ${EXPENSE_BEHALF}
    Sleep    5s
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="QA Team"]
#    Sleep    5s
#    Click Element    xpath=//android.widget.TextView[@text="QA Team"]
#Status: Draft
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Default"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EXPENSE_STATUS}"]
#Click on the Save button.
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#Click on the Add button in Expense Report Line Items.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add"]
#Expense Type: Sponsorship Fee
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search ExpenseTypes"]    ${EXPENSE_TYPE}
##Amount: $750
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Amount"]    ${EXPENSE_AMOUNT}
#Buying Currency: USD
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${BUYING_CURRENCY}"]
#Selling Currency: USD
    Sleep    5s
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Sleep    3s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${SELLING_CURRENCY}"]
#Exchange Rate Buying: $300
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Exchange Rate Buying"]    ${EXCHANGE_RATE_BUYING}
#Exchange Rate Selling: $250
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Exchange Rate Selling"]    ${EXCHANGE_RATE_SELLING}
#Date: 10/6/2025
    Sleep    5s
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[9]/android.view.ViewGroup/*
    Sleep    3s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EXPENSE_DATE}"]/android.view.ViewGroup
#Country: United Arab Emirates
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="Default"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]   10s
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${REPORT_LINE_COUNTRY}"]
#Related Account: Victoria Hospital
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.view.ViewGroup[@resource-id="@@autocomplete/input-anchor/container"])[2]/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@resource-id="@@autocomplete/input-anchor/container"])[2]/android.view.ViewGroup
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input/input"]    ${RELATED_ACCOUNT}
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Click Element    xpath=(//android.widget.TextView[@text="${RELATED_ACCOUNT}"])[1]
#Related Contact: Dr. Eddie Davila
    Sleep    5s
    Click Element    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search Contact"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   10s
    Click Element    xpath=//android.widget.TextView[@text="${RELATED_CONTACT}"]
#Click on the Save button.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    10s