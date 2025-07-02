*** Settings ***
Library     AppiumLibrary
Library    DateTime
Library    ExcelSage
Resource   ../Excel/Excel_Keywords.resource

*** Variables ***
#${EXCEL_PATH}    ../Excel/Smart_Data.xlsx
${EXCEL_EVENT_SHEET}     Event

${EVENT_START_DATE}     28
${EVENT_END_DATE}       28
${PAYMENT_DATE}         28
${EVENT_NAME}           Healthcare Leadership Roundtable
${ESTIMATED_BUDGET}     50000
${EVENTS_COUNTY}        United Arab Emirates
${EVENTS_STATUS}        Planned
${EVENTS_CITY}          Fujairah
${TYPE_EVENTS}          Business Discussion
${UNITY_PRICE}          1000
${QUALITY_EVENT}        4
${EVENT_COST_SECTION}   Accommodation
${RELATED_PRODUCT}      Miconazole
${DURATION_EVENT}       40
${ATTENDEE_CONTACT}     Rao Zeeshan Ali
${EVENT_OBJECTIVE}      testing124
${RECORD_TYPE_ID}       External


*** Test Cases ***

Create Event
#click calender
    click element  xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[2]
    click element  xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[2]
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Calendar"])[1]     10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Month"]/following-sibling::android.view.ViewGroup[3]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Please Select Type of Event"]       10s
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup      20s
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Event"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Event"]     10s
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input" and contains(@text,"Name")]    10s
    Sleep    10s
    Input Text  xpath=//android.widget.EditText[@resource-id="@undefined/input" and contains(@text,"Name")]     ${EVENT_NAME}
#    Set Global Variable    ${EVENT_NAME}
#estimated Budget
    Sleep    10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Estimated Budget"]     ${ESTIMATED_BUDGET}
#countrydropdown
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup    timeout=10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EVENTS_COUNTY}"]
    Sleep    5s
#statusdropdown
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        timeout=5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${EVENTS_STATUS}"]
    Sleep    10s
#city
#    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="City"]    10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="City"]    ${EVENTS_CITY}
#typeofeventdropdown
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="${TYPE_EVENTS}"]
#    Set Global Variable    ${TYPE_EVENTS}
    Sleep    3s

    Swipe    1280    1295    1280    1000    500
#startdate
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/*
    sleep   5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="${EVENT_START_DATE}"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/*[1]
    ${EVENT_START_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]      content-desc
     Log To Console  System date format is: ${EVENT_START_DATE}
    ${EVENT_START_DATE}=    Convert Date    ${EVENT_START_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${EVENT_START_DATE}
#    Set Global Variable    ${EVENT_START_DATE}
#end date
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*
    sleep   5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="${EVENT_END_DATE}"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*[1]
    ${EVENT_END_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*     content-desc
     Log To Console  System date format is: ${EVENT_END_DATE}
    ${EVENT_END_DATE}=    Convert Date    ${EVENT_END_DATE}       result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${EVENT_END_DATE}
#    Set Global Variable    ${EVENT_END_DATE}

#    Create Workbook     ${EXCEL_PATH}        overwrite_if_exists=True
    Open Or Create Workbook And Sheet       ${EXCEL_EVENT_SHEET}
#    Rename Sheet    Sheet   ${EXCEL_EVENT_SHEET}
    Write To Cell    A1    Event Name       ${EXCEL_EVENT_SHEET}
    Write To Cell    A2    ${EVENT_NAME}       ${EXCEL_EVENT_SHEET}
    Write To Cell    B1    Event Type     ${EXCEL_EVENT_SHEET}
    Write To Cell    B2    ${TYPE_EVENTS}     ${EXCEL_EVENT_SHEET}
    Write To Cell    C1    Event Start Date       ${EXCEL_EVENT_SHEET}
    Write To Cell    C2    ${EVENT_START_DATE}       ${EXCEL_EVENT_SHEET}
    Write To Cell    D1    Event End Date     ${EXCEL_EVENT_SHEET}
    Write To Cell    D2    ${EVENT_END_DATE}     ${EXCEL_EVENT_SHEET}
    Save Workbook

#Event objective
    Sleep    3s
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="@undefined/input" and @text="Event Description"]       10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Event Description"]    ${EVENT_OBJECTIVE}
#save button
    Sleep    3s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]   10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    3s
# Swipe up to bring it into view
    Swipe    1575    891    1280    0    800   # 2 swipes
    Sleep    2s
# Wait and click by content-desc
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Add"]    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add"]
#participation
    Sleep    3s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Invited"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   10s
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="Candidate"]

#recordtypeID
    Sleep    3s
    Click Element    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="${RECORD_TYPE_ID}"]
    Sleep    3s
#duration
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Duration"]    ${DURATION_EVENT}
#attendeecontact
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search Contact"]    ${ATTENDEE_CONTACT}
#savebutton
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

#eventproductadd
    Sleep    5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Add"])[2]
#relatedproduct
    Sleep    5s
    Click Element    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${RELATED_PRODUCT}"]
#relatedprodutsavebtn
    Sleep    3s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s
        # Swipe up to bring it into view
    Swipe    1280    1071    1575    750    800   # 2 swipes
    Sleep    2s
#eventproductaddbtn
    Sleep    2s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Add"])[3]
#Event Cost section
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="Default"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="${EVENT_COST_SECTION}"]
#payment date
    Sleep    2s
    Click Element    xpath=//android.widget.TextView[@text="Payment Date"]//following-sibling::android.view.ViewGroup
    sleep   5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PAYMENT_DATE}"]/android.view.ViewGroup
#quality
    Sleep    2s
    Input Text    xpath=(//android.widget.EditText[@resource-id="@undefined/input"])[1]    ${QUALITY_EVENT}
#unityprice
    Sleep    2s
    Input Text    xpath=(//android.widget.EditText[@resource-id="@undefined/input"])[2]    ${UNITY_PRICE}
#event cost save btn
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#saveevent
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    10s

