*** Settings ***

Library     AppiumLibrary
Resource    varaibles.resource
*** Test Cases ***
Remove smaple stock
    #click sample stock
    click element  xpath=//android.view.ViewGroup[@content-desc="Sample Stock"]/android.view.ViewGroup/android.view.ViewGroup
#click on the beclomatason 20ml
    Sleep    2s
    Click Element    xpath=//android.widget.TextView[@text="${Product_Skus}"]
#swipe
    Sleep    2s
    Swipe    1575    891    1280    0    800   # 2 swipes
#click on add btn in remove stock
    Sleep    2s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Add New"])[1]
#Status: Active 
    Sleep    2s
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${sample_status}"]
#Number of samples removed from the stock: 20 
    Sleep    2s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Number of samples removed from the stock"]    ${Removed_Stock_QTY}
#Removed approved by stock manager: (Checked)  
    Sleep    2s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup[1]
#Stock reduction reason: Past Expiry Date
    Sleep    2s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Other reason for Stock reduction"]    ${Stock_reduction_reason}
#click save btn
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]