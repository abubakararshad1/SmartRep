*** Settings ***

Library     AppiumLibrary


*** Variables ***
${DROPDOWN_ACTIVITIES}     Events

*** Test Cases ***
 # click activites
View schedule event Test Case
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#click activitiesdrp
    Sleep    3s
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="${Dropdown}"]    5s
    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
    Click Element    xpath=//android.widget.TextView[@text="${DROPDOWN_ACTIVITIES}"]
    END
#    Click Element    xpath=//android.widget.TextView[@text="Tour Plan"]
#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup
#    Sleep    2s
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Events"]
#select the Event activity
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Events")]      10s
    Sleep    10s
    Log To Console    //android.view.ViewGroup[contains(@content-desc,'${EVENT_NAME}, ${TYPE_EVENTS}, ${EVENT_START_DATE}, ${EVENT_END_DATE}')]
    Sleep    30s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${EVENT_NAME}, ${TYPE_EVENTS}, ${EVENT_START_DATE}, ${EVENT_END_DATE}"))
    Sleep    5s
#    Click Element    xpath=//android.view.ViewGroup[contains(@content-desc,'${Event_Name1},${Type_events1},${Event_start_DATE1},${Event_End_DATE1}')]"
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[contains(@content-desc,'Healthcare Leadership Roundtable, Business Discussion, 2025-06-16, 2025-06-20')]
#    Click Element    xpath=//android.view.ViewGroup[contains(@content-desc,'Healthcare Leadership Roundtable, Business Discussion, 2025-06-16, 2025-06-20')]
    Sleep    10s

