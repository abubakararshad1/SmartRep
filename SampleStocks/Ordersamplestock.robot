*** Settings ***
Library     AppiumLibrary
Resource    Varaibles.resource

*** Variables ***
${SAMPLE_ORDER_DATE}      17
${ORDER_FOR_STOCK}       50
${PLANNED_SAMPLES}       Detailing


*** Test Cases ***

Order sample stock
#click sample stock
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Sample Stock"]/android.view.ViewGroup/android.view.ViewGroup         10s
    Click Element  xpath=//android.view.ViewGroup[@content-desc="Sample Stock"]/android.view.ViewGroup/android.view.ViewGroup
    Click Element  xpath=//android.view.ViewGroup[@content-desc="Sample Stock"]/android.view.ViewGroup/android.view.ViewGroup
#click on the beclomatason 20ml
    Sleep    3s
    Log To Console      ${PRODUCT_SKUS}
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]      ${PRODUCT_SKUS}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[contains(@content-desc,"${PRODUCT_SKUS}")]
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[contains(@content-desc,"${PRODUCT_SKUS}")]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"SampleStock")]     10s
#swipe
#    Swipe    1575    891    1280    0    800   # 2 swipes
#click on the order stock add btn
#    Sleep    2s
    Sleep    5s
    Wait Until Element Is Visible    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("Order for Stock"))      10s
    Click Element    xpath=//android.widget.TextView[@text="Order for Stock"]//following-sibling::android.view.ViewGroup
    Sleep    2s
#Number of Items Order for Stock
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${ORDER_FOR_STOCK}
#Status
    Sleep    2s
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       20s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${SAMPLE_STATUS}"]
#Sample Order Date
    Sleep    10s
    Click Element    xpath=//android.widget.TextView[@text="Samples Order Date"]/following-sibling::android.view.ViewGroup/android.widget.TextView
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup     10s
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${SAMPLE_ORDER_DATE}"]
#Planned Usage of Samples
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Default")]/..     10s
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Default")]/..
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PLANNED_SAMPLES}"]
#click save btn
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s