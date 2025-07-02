*** Settings ***

Library     AppiumLibrary
Resource    varaibles.resource
*** Test Cases ***
Remove smaple stock
    #click sample stock
    Click Element  xpath=//android.view.ViewGroup[@content-desc="Sample Stock"]/android.view.ViewGroup/android.view.ViewGroup
#click on the beclomatason 20ml
    Sleep    2s
    Click Element    xpath=//android.widget.TextView[@text="${PRODUCT_SKUS}"]
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
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${SAMPLE_STATUS}"]
#Number of samples removed from the stock: 20 
    Sleep    2s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Number of samples removed from the stock"]    ${REMOVED_STOCK_QTY}
#Removed approved by stock manager: (Checked)  
    Sleep    2s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup[1]
#Stock reduction reason: Past Expiry Date
    Sleep    2s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Stock reduction reason"]//following-sibling::android.view.ViewGroup     10s
    Click Element    xpath=//android.widget.TextView[@text="Stock reduction reason"]//following-sibling::android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView      10s
    Click Text    Past Expiry Date
##Stock reduction reason: Past Expiry Date
#    Sleep    2s
#    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Other reason for Stock reduction"]    ${STOCK_REDUCTION_REASON}
#click save btn
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s