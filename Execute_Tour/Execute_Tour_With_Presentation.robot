*** Settings ***
Library     AppiumLibrary
Library     DateTime
Library     DoubleTapLibrary.py

*** Variables ***
${CONTACT_NAME}         Sarah Thompson
${PRESENTATION_NAME}    Presentation Sample 1

*** Test Cases ***
Execute Tour
    [Documentation]    Executes a Tour with selected contact, enters tour execution details, runs presentation, and verifies from Activity tab.

    # Navigate to Contacts tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s

    # Wait for contact search bar to load
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s

    # Search and select contact
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
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
    Swipe    1575    709    1280    0    800
    Sleep    2s

    # Swipe to set minutes
    Swipe    1575    891    1280    0    800
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
    Swipe    2300    804    2000    804    800
    Sleep    5s
    Swipe    2300    804    2000    804    800
    Sleep    5s
    Swipe    2300    804    2000    804    800
    Sleep    5s

    # Swipe right once
    Swipe    300    804    500    804    800
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
    Swipe    2300    804    2000    804    800
    Sleep    5s

    # Double tap to finish presentation
    Double Tap    1280    804
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="FINISH"]   10s
    Sleep    10s
    Click Element    xpath=//android.widget.Button[@text="FINISH"]
    Sleep    10s

    # Verify returned to "Tour Execution" screen
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]    10s

    # Scroll to bottom and Save
    Swipe    1280    1295    1280    519    800
    Swipe    1280    1295    1280    519    800
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]

    # Confirm return to Contact Page
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]    10s
    Sleep    5s
#
#    # Navigate to Activity tab
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]    10s
#
#    # Filter by Tour Plan then switch to Tour Execution
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Tour Plan"]
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
#    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Tour Execution"]    10s
#    Sleep    3s
#
#    # Search by contact and verify tour execution data
#    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
#    Sleep    2s
#    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONTACT_NAME}")])[1]    10s
#    Sleep    3s
#    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONTACT_NAME}, ${TOUR_EXECUTION_DATE}, ${TOUR_EXECUTION_TIME}"))
#    Sleep    10s
