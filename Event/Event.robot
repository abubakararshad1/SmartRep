*** Settings ***

Library     AppiumLibrary
Library    DateTime

*** Variables ***

${Event_start_DATE}      16
${Event_End_DATE}        20
${Payment_Date}     17
${Event_Name}       Healthcare Leadership Roundtable
${Estimated_Budget}     50000
${Events_county}        United Arab Emirates
${Events_status}        Planned
${Events_city}      Fujairah
${Type_events}      Business Discussion
*** Test Cases ***
 # click calender
create event
    click element  xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[2]
    click element  xpath=//android.view.ViewGroup[@content-desc="Calendar"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[2]
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Calendar"])[1]     10s
    Sleep    5s
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[11]/android.view.ViewGroup
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Please Select Type of Event"]       10s
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Event"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Event"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Event"]     10s
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input" and contains(@text,"Name")]    10s
    Input Text  xpath=//android.widget.EditText[@resource-id="@undefined/input" and contains(@text,"Name")]     ${Event_Name}
    Set Global Variable    ${Event_Name}
#estimated Budget
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Estimated Budget"]     ${Estimated_Budget}
#countrydropdown
    Click Element    xpath=(//android.widget.TextView[@text="Default"])[1]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup    timeout=10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Events_county}"]
    Sleep    5s
#statusdropdown
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Default"])[1]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup        timeout=5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Events_status}"]
    Sleep    10s
#city
#    Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="City"]    10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="City"]    ${Events_city}
#typeofeventdropdown
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
    Sleep    5s
    Click Element    xpath=//android.widget.TextView[@text="${Type_events}"]
    Set Global Variable    ${Type_events} 
    Sleep    3s
#startdate
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/*
    sleep   5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="${Event_start_DATE}"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/*[1]
    ${Event_start_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]      content-desc
     Log To Console  System date format is: ${Event_start_DATE}
    ${Event_start_DATE}=    Convert Date    ${Event_start_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${Event_start_DATE}
    Set Global Variable    ${Event_start_DATE}
#end date
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*
    sleep   5s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="${Event_End_DATE}"])[1]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*[1]
    ${Event_End_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/*     content-desc
     Log To Console  System date format is: ${Event_End_DATE}
    ${Event_End_DATE}=    Convert Date    ${Event_End_DATE}       result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${Event_End_DATE}
    Set Global Variable    ${Event_End_DATE}
#Event objective
    Sleep    3s
    Wait Until Element Is Visible    //android.widget.EditText[@resource-id="@undefined/input" and @text="Event Description"]       10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Event Description"]    testing124
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
    Click Element    xpath=//android.widget.TextView[@text="External"]
    Sleep    3s
#duration
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Duration"]    30
#attendeecontact
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@@autocomplete/input-anchor/input" and @text="Search Contact"]    Rao Zeeshan Ali
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
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Miconazole"]
#relatedprodutsavebtn
    Sleep    3s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#eventproductaddbtn
    Sleep    2s
    Click Element    xpath=(//android.view.ViewGroup[@content-desc="Add"])[3]
#Event Cost section
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="Default"]
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup
    Sleep    3s
    Click Element    xpath=//android.widget.TextView[@text="Accommodation"]
#payment date
    Sleep    2s
    Click Element    xpath=//android.widget.TextView[@text="Payment Date"]//following-sibling::android.view.ViewGroup
    sleep   5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Payment_Date}"]/android.view.ViewGroup
#quality
    Sleep    2s
    Input Text    xpath=(//android.widget.EditText[@resource-id="@undefined/input"])[1]    4
#unityprice
    Sleep    2s
    Input Text    xpath=(//android.widget.EditText[@resource-id="@undefined/input"])[2]    1000
#event cost save btn
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#saveevent
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    10s
