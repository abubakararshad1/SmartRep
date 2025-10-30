*** Settings ***
Library    AppiumLibrary
Resource   ../Excel/Excel_Keywords.resource
Library   ../Touch_Keyword/Touch_Keyword.py

*** Variables ***
${EXCEL_EVENT_SHEET}      Event
${DROPDOWN_ACTIVITIES}    Events
${TAP_X}                  70
${TAP_Y}                  475
${TIMEOUT}                10s

*** Test Cases ***
View schedule event Test Case
    [Documentation]    View schedule event based on Excel data.
    Sleep    2s

    # Step 1: Open Activities
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Activities")])[1]    ${TIMEOUT}
    Sleep   3s
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="${DROPDOWN_ACTIVITIES}"]    10s
    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    Sleep    2s
    Tap At Coordinates      ${TAP_X}    ${TAP_Y}
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="${DROPDOWN_ACTIVITIES}"]    10s
    END
    # Step 2: Read event data from Excel
    Open Workbook    ${EXCEL_PATH}
    ${SEARCH_EVENT_NAME}=    Get Cell Value    A2    ${EXCEL_EVENT_SHEET}
    ${SEARCH_EVENT_TYPE}=    Get Cell Value    B2    ${EXCEL_EVENT_SHEET}
    ${SEARCH_START_DATE}=    Get Cell Value    C2    ${EXCEL_EVENT_SHEET}
    ${SEARCH_END_DATE}=      Get Cell Value    D2    ${EXCEL_EVENT_SHEET}
    Log To Console    \nEvent Name: ${SEARCH_EVENT_NAME}\nType: ${SEARCH_EVENT_TYPE}\nStart: ${SEARCH_START_DATE}\nEnd: ${SEARCH_END_DATE}\n
    Sleep   5s

    # Step 3: Scroll to matching event
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]    ${TIMEOUT}
    Sleep   3s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${SEARCH_EVENT_NAME}, ${SEARCH_EVENT_TYPE}, ${SEARCH_START_DATE}, ${SEARCH_END_DATE}"))
    Sleep    5s


