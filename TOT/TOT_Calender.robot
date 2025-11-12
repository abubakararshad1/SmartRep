*** Settings ***
Library     AppiumLibrary
Library     DateTime
Library     ../Touch_Keyword/Touch_Keyword.py


*** Variables ***
${EVENT_TYPE}      Time-off
${STRT_DATE}      17
${FIRST_QUART}      Business Travel
${ACTIVITY_TYPE}       Tour Plan
${PAGINTATION}                100
${EVENT_TYPE1}      Time off

*** Test Cases ***
Create TOT
#16 Verify that user can Create Time Off from the Calendar page.
        Sleep    5s
        Click Element   xpath=//android.view.ViewGroup[@content-desc="Calendar"]
        Click Element   xpath=//android.view.ViewGroup[@content-desc="Calendar"]
        Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Calendar"])[1]     10s
        Sleep    5s
        Wait Until Element Is Visible   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[10]   10s
        Click Element   xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[10]
        Sleep    5s
        Wait Until Element Is Visible   xpath=//android.widget.TextView[@text="Please Select Type of Event"]            10s
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${EVENT_TYPE}"]  10s
        Click Element   xpath=//android.widget.TextView[@text="${EVENT_TYPE}"]
        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup       10s
        Click Element   xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup
        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup     20s
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${STRT_DATE}"]    20s
        Click Element   xpath=//android.widget.TextView[@text="${STRT_DATE}"]
        Sleep    5s
        ${END_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="End Date"]//following-sibling::android.view.ViewGroup//android.view.ViewGroup    content-desc
        Log To Console  System date format is: ${END_DATE}
        ${END_DATE}=    Convert Date    ${END_DATE}       result_format=%Y-%m-%d    date_format=%d/%m/%Y
        Log To Console    Selected date is: ${END_DATE}
        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="All-Day"]//following-sibling::android.view.ViewGroup        20s
        Click Element    xpath=//android.widget.TextView[@text="All-Day"]//following-sibling::android.view.ViewGroup//android.view.ViewGroup[2]
        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="1/4"]//following-sibling::android.view.ViewGroup        20s
        Click Element    xpath=//android.widget.TextView[@text="1/4"]//following-sibling::android.view.ViewGroup//android.widget.TextView
        Sleep   10s
#        Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup   20s
        Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${FIRST_QUART}"]        20s
#        Click Element       xpath=//android.widget.TextView[@text="${FIRST_QUART}"]
        Click Text    ${FIRST_QUART}
        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]       10s
        Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
        Sleep    3s
        Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Calendar"])[1]     10s
        Sleep    5s
#17 Verify that the user can view the Schedule Time Off in the Activity tab.
        Click Element   xpath=//android.widget.TextView[@text="Activities"]
        Click Element   xpath=//android.widget.TextView[@text="Activities"]
        Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Activities"])[1]     10s
        Sleep    5s

            # Try to check if "Tour Plan" is already visible
        ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="${EVENT_TYPE1}"]    5s

        IF    not ${is_visible}
        Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
#        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
        Tap At Coordinates  85  560
#        Click Element    xpath=//android.widget.TextView[@text="${EVENT_TYPE1}"]
        END


        Sleep    3s

#        Click Element    xpath=//android.widget.TextView[@text="${ACTIVITY_TYPE}"]
#        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup   10s
#        Click Text      ${EVENT_TYPE1}
#        Sleep    5s
        Wait Until Element Is Visible    xpath=//android.widget.EditText[@resource-id="@undefined/input"]           10s
#        Click Element       xpath=//android.widget.EditText[@resource-id="@undefined/input"]
        Sleep    5s
        Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${END_DATE}
        Sleep    5s
        Click Element    xpath=(//android.widget.TextView[@text="${END_DATE}"])[1]
        Sleep    10s


