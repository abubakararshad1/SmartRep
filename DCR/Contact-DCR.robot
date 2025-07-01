*** Settings ***
Library     AppiumLibrary

*** Variables ***
#Contact Info
${OLD_CONTACT_NAME}      Emily Rivera
${NEW_CONTACT_FIRSTNAME}    Ahmad
${CONTACT_HOME_PHONE}    12345
${DCR_CONTACT_ACTION}       Update Contact
${PAGINTATION}                100

*** Test Cases ***

Contact DCR
#8 Contact/DCR = Verify that the user can update the contact information  (DCR module).
    Sleep        5s
    Wait Until Element Is Visible   xpath=//android.view.ViewGroup[@content-desc="Contacts"]    10s
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Sleep    3s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Contact")])[1]     10s
    Sleep    3s
    Clear Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]
    Sleep    5s
    #select contact from list
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${OLD_CONTACT_NAME}"]       10s
    Click Element    xpath=//android.widget.TextView[@text="${OLD_CONTACT_NAME}"]
    Sleep    10s
    #edit contact
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Edit"]       15s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Edit"]
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Contact Home Phone"]
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Contact Home Phone"]   ${CONTACT_HOME_PHONE}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contact First Name"]//following-sibling::android.view.ViewGroup       10s
    Input Text    xpath=//android.widget.TextView[@text="Contact First Name"]//following-sibling::android.view.ViewGroup//android.widget.EditText    ${NEW_CONTACT_FIRSTNAME}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

#9  Verify that user can View DCR detail of the updated Contact.
    Sleep    10s
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Click Element     xpath=//android.view.ViewGroup[@content-desc="DCR"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup   20s
    Click Element    xpath=//android.widget.TextView[@content-desc="selectPageDropdownLabel"]//following-sibling::android.view.ViewGroup
    Sleep    10s
    Click Text    ${PAGINTATION}
    #scroll to element
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]     10s
#    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${OLD_CONTACT_NAME}, ${DCR_CONTACT_ACTION}").className("com.horcrux.svg.PathView"))
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${OLD_CONTACT_NAME}, ${DCR_CONTACT_ACTION}"))

    Sleep    10s

