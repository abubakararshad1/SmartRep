*** Settings ***

Library     AppiumLibrary

*** Variables ***

${Expense_Name}    Marketing Event Sponsorship
${Expense_start_DATE}        10
${Expense_end_DATE}        10
${Expense_DATE}        10
${Expense_Country}      United Arab Emirates
${Expense_Behalf}       QA Team
${Expense_Status}       Draft
${Related_Contact}      Jason Patel
${Expense_Type}     Accommodation
${Expense_Amount}       $750
${Buying_Currency}      USD
${Selling_Currency}     USD
${Exchange_Rate_Buying}     $300
${Exchange_Rate_Selling}    $250
${Report_Line_Country}      United Arab Emirates
${Related_Account}      AE-Sample Brick-04

*** Test Cases ***
Verify that user can Add new expense in the Expense module
#click on the expense tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Expense"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.RectView[1]
#Click on the Add button.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add"]
#Expense Report Name
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Expense Report Name"]    ${Expense_Name}
#Start Date
    Sleep    5s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[3]/android.view.ViewGroup/*
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Expense_start_DATE}"]
#End Date: 10/6/2025
    Sleep    5s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[4]/android.view.ViewGroup/*
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]     10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Expense_end_DATE}"]/android.view.ViewGroup
#Country: United Arab Emirates
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   10s
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="${Expense_Country}"]
#Expense Of Behalf (User): QA team
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input"]    ${Expense_Behalf}
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
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Expense_Status}"]
#Click on the Save button.
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#Click on the Add button in Expense Report Line Items.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add"]
#Expense Type: Sponsorship Fee
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search ExpenseTypes"]    ${Expense_Type}
##Amount: $750
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Amount"]    ${Expense_Amount}
#Buying Currency: USD
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Buying_Currency}"]
#Selling Currency: USD
    Sleep    5s
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Sleep    3s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Selling_Currency}"]
#Exchange Rate Buying: $300
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Exchange Rate Buying"]    ${Exchange_Rate_Buying}
#Exchange Rate Selling: $250
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Exchange Rate Selling"]    ${Exchange_Rate_Selling}
#Date: 10/6/2025
    Sleep    5s
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[9]/android.view.ViewGroup/*
    Sleep    3s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Expense_DATE}"]/android.view.ViewGroup
#Country: United Arab Emirates
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="Default"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]   10s
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Report_Line_Country}"]
#Related Account: Victoria Hospital
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.view.ViewGroup[@resource-id="@@autocomplete/input-anchor/container"])[2]/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@resource-id="@@autocomplete/input-anchor/container"])[2]/android.view.ViewGroup
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input/input"]    ${Related_Account}
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Click Element    xpath=(//android.widget.TextView[@text="${Related_Account}"])[1]
#Related Contact: Dr. Eddie Davila
    Sleep    5s
    Click Element    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search Contact"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   10s
    Click Element    xpath=//android.widget.TextView[@text="${Related_Contact}"]
#Click on the Save button.
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    10s