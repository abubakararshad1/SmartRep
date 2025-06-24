*** Settings ***
Library     AppiumLibrary

*** Variables ***
#Contact Info
${OLD_CONTACT_NAME}      Emily Rivera
${NEW_CONTACT_FIRSTNAME}    Ahmad
${CONTACT_HOME_PHONE}    12345
${DCR_CONTACT_ACTION}       Update Contact


*** Test Cases ***

Contact DCR
    Sleep        5s
    Wait Until Element Is Visible   xpath=//android.view.ViewGroup[@content-desc="Contacts"]    10s
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${OLD_CONTACT_NAME}"]       10s
    Click Element    xpath=//android.widget.TextView[@text="${OLD_CONTACT_NAME}"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Edit"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Edit"]
    Sleep    5s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Contact Home Phone"]   ${CONTACT_HOME_PHONE}
    Sleep    5s
#   Clear Text    xpath=//android.widget.TextView[@text="Contact First Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText
#   Sleep    5s
#    Input Text    xpath =//android.widget.EditText[@resource-id="@undefined/input" and @text="Contact First Name"]   Ahmad
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contact First Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText        10s
    Input Text    xpath=//android.widget.TextView[@text="Contact First Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText    ${NEW_CONTACT_FIRSTNAME}
    Sleep    10s
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
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${OLD_CONTACT_NAME}, ${DCR_CONTACT_ACTION}"))
    Sleep    10s

