*** Settings ***
Library     AppiumLibrary
Library     DateTime
Library    ../Touch_Keyword/Touch_Keyword.py
Resource   ../Excel/Excel_Keywords.resource

*** Variables ***
${CONTACT_NAME}                 Sarah Thompson
${PRESENTATION_NAME}            Presentation Sample 1
${EXCEL_TOUR_PLAN_SHEET}        Tour Plan
${EXCEL_TOUR_EXE_WITH_PRES_SHEET}     Tour Execution With Presentation

*** Test Cases ***
Execute Tour With Presentation
    [Documentation]    Executes a Tour with selected contact, enters tour execution details, runs presentation, and verifies from Activity tab.

    # Navigate to Contacts tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s

    # Wait for contact search bar to load
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s

    #reading data from excel
    Open Workbook       ${EXCEL_PATH}
    ${SEARCH_CONTACT_NAME}=        Get Cell Value    A2    ${EXCEL_TOUR_PLAN_SHEET}
    ${SEARCH_APPOINTMENT_DATE}=    Get Cell Value    B2     ${EXCEL_TOUR_PLAN_SHEET}
    ${SEARCH_APPOINTMENT_TIME}=    Get Cell Value    C2     ${EXCEL_TOUR_PLAN_SHEET}

    Close Workbook

    # Search and select contact
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${SEARCH_CONTACT_NAME}
    Sleep    10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
    Sleep    10s

    # Click on "Tour Execution" section
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup
    Sleep    10s
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Tour Execution"]    10s

    # Get and log Tour Execution Date
    ${TOUR_EXECUTION_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    content-desc
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}
    ${TOUR_EXECUTION_DATE}=    Convert Date    ${TOUR_EXECUTION_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}

    # Set time for tour execution using swipe gestures
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
    Sleep    5s

    # Swipe to set hour
    Swipe    1575    709    1280    0    500
    Sleep    2s

    # Swipe to set minutes
    Swipe    1575    891    1280    0    500
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]
    Sleep    5s

    # Capture and log selected time
    ${TOUR_EXECUTION_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console    Selected time is: ${TOUR_EXECUTION_TIME}

    # Click on "Presentation" tab
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]    10s
    Sleep    5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentation"]
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]
    Sleep    5s

    # Swipe left through presentation slides
    Swipe    2300    804    2000    804    100
    Sleep    5s
    Swipe    2300    804    2000    804    100
    Sleep    5s
    Swipe    2300    804    2000    804    100
    Sleep    5s

    # Swipe right once
    Swipe    300    804    500    804    100
    Sleep    10s

    # Double tap to pause presentation
    Double Tap    1280    804
    Sleep    5s

    # Pause and Resume presentation
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="PAUSE"]    10s
    Click Element    xpath=//android.widget.Button[@text="PAUSE"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="RESUME"]    10s
    Click Element    xpath=//android.widget.Button[@text="RESUME"]
    Sleep    5s

    # Swipe one more slide
    Swipe    2300    804    2000    804    100
    Sleep    5s

    # Double tap to finish presentation
    Double Tap    1280    804
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="FINISH"]   10s
    Sleep    5s
    Click Element    xpath=//android.widget.Button[@text="FINISH"]
    Sleep    10s

    # Verify returned to "Tour Execution" screen
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]    15s

    Open Or Create Workbook And Sheet       ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    A1    Tour Execution Contact Name              ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    A2    ${CONTACT_NAME}           ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    B1    Tour Execution Appointment Date          ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    B2    ${TOUR_EXECUTION_DATE}     ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    C1    Tour Execution Appointment Time           ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Write To Cell    C2    ${TOUR_EXECUTION_TIME}     ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Save Workbook
    # Scroll to bottom and Save
    Swipe    1280    1295    1280    519    800
    Swipe    1280    1295    1280    519    800
    Swipe    1280    1295    1280    519    800
    Swipe    1280    1295    1280    819    800


    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

    # Confirm return to Contact Page
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]    10s
    Sleep    5s

View the Executed Tour With Presentation edetailing
    # Navigate to Activity tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"Activities")])[1]    10s

    # Try to check if "Tour Execution" is already visible
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]    5s
    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]    10s
    END

    Sleep    3s

    # Open Workbook and read data

    Open Workbook       ${EXCEL_PATH}
    ${SEARCH_TOUR_EXE_CONTACT_NAME}=        Get Cell Value     A2     ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    ${SEARCH_TOUR_EXE_DATE}=    Get Cell Value    B2     ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    ${SEARCH_TOUR_EXE_TIME}=    Get Cell Value    C2     ${EXCEL_TOUR_EXE_WITH_PRES_SHEET}
    Log To Console    \n${SEARCH_TOUR_EXE_CONTACT_NAME}\n${SEARCH_TOUR_EXE_DATE}\n${SEARCH_TOUR_EXE_TIME}\n

    # Search and select the contact from the Tour Execution list

    # Input the contact name in the search bar
    # This helps to filter and locate the relevant activity record quickly.
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${SEARCH_TOUR_EXE_CONTACT_NAME}
    Sleep    2s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${SEARCH_TOUR_EXE_CONTACT_NAME}")])[1]    10s
    Sleep    3s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${SEARCH_TOUR_EXE_CONTACT_NAME}, ${SEARCH_TOUR_EXE_DATE}, ${SEARCH_TOUR_EXE_TIME}"))
    Sleep    10s

    # Wait for the "Tour Execution" label to confirm that the correct entry has been opened
    # This acts as a validation step that the navigation to the right screen was successful.
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s

    Sleep    10s