*** Settings ***

Library    AppiumLibrary
Library    ExcelSage
Resource   ../Excel/Excel_Keywords.resource
*** Variables ***
${EXCEL_EVENT_SHEET}     Event
${DROPDOWN_ACTIVITIES}     Events



*** Test Cases ***
 # click activites
View schedule event Test Case
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]

    # Just to load page and find the locator on the page
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Activities")])[1]     10s

    #click ctivities    drp
    Sleep    2s
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="${DROPDOWN_ACTIVITIES}"]    5s
    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
    Click Element    xpath=//android.widget.TextView[@text="${DROPDOWN_ACTIVITIES}"]
    END

    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Events")]      10s
    Open Workbook       ${EXCEL_PATH}
    ${SEARCH_EVENT_NAME}=    Get Cell Value    A2     ${EXCEL_EVENT_SHEET}
    ${SEARCH_EVENT_TYPE}=    Get Cell Value    B2     ${EXCEL_EVENT_SHEET}
    ${SEARCH_START_DATE}=    Get Cell Value    C2     ${EXCEL_EVENT_SHEET}
    ${SEARCH_END_DATE}=    Get Cell Value      D2     ${EXCEL_EVENT_SHEET}
    Log To Console    ${SEARCH_EVENT_NAME}\n${SEARCH_EVENT_TYPE}\n${SEARCH_START_DATE}\n${SEARCH_END_DATE}\n

#    Log To Console    //android.view.ViewGroup[contains(@content-desc,'${SEARCH_EVENT_NAME}, ${SEARCH_EVENT_TYPE}, ${SEARCH_START_DATE}, ${SEARCH_END_DATE}')]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]     10s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${SEARCH_EVENT_NAME}, ${SEARCH_EVENT_TYPE}, ${SEARCH_START_DATE}, ${SEARCH_END_DATE}"))
    Sleep    10s


