*** Settings ***
Library     AppiumLibrary


*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${WITHOUT_CALL_GENERAL_SURVEY_NAME}     MedRep Engagement Insights
${PICKLIST_QUESTION_1}        How frequently do you recommend our products to patients for specific health issues?
${PICKLIST_OPTION}        Rarely
${QUESTION_2}       How satisfied are you with the availability of our pharmaceutical products?
${QUESTION_2_ANSWER}        9
${QUESTION_3}       What challenges do you face when recommending our products to patients?
${QUESTION_3_ANSWER}        Lack of patient awareness.

*** Test Cases ***

Answer the without call survey question
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]

    Sleep    3s
    Clear Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${CONTACT_NAME}"]   10s
    Click Element    xpath=//android.widget.TextView[@text="${CONTACT_NAME}"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contact : ${CONTACT_NAME}"]     20s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Survey"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Survey"]        10s
    Sleep    10s
    Click Element    xpath=//android.widget.TextView[@text="${WITHOUT_CALL_GENERAL_SURVEY_NAME}"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup   10s
    Click Element    xpath=//android.widget.TextView[@text="${PICKLIST_QUESTION_1}"]//following-sibling::android.view.ViewGroup/android.widget.TextView
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PICKLIST_OPTION}"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${QUESTION_2}"]     10s
    Input Text    xpath=//android.widget.TextView[@text="${QUESTION_2}"]//following-sibling::android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${QUESTION_2_ANSWER}
    Input Text    xpath=//android.widget.TextView[@text="${QUESTION_3}"]//following-sibling::android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${QUESTION_3_ANSWER}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]   10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Contact : ${CONTACT_NAME}"]     10s
    Sleep    20s