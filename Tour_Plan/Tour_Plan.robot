*** Settings ***
Library    AppiumLibrary
Library    DateTime

*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${HOSPITAL_NAME}    Alpha Hospital
${APPOINTMENT_DAY}  27

*** Test Cases ***
Create Tour Plan from Contact

    # Navigate to the "Contacts" tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s

    # Search and select the contact
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
    Sleep    10s

    # Open "Tour Plan" option under selected contact
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${HOSPITAL_NAME}, Active"]/android.view.ViewGroup[5]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]     10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup
    Sleep    20s

    # Select the date from calendar using appointment day variable
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${APPOINTMENT_DAY}"]/android.view.ViewGroup
    Sleep    5s

    # Get and format selected appointment date
    ${APPOINTMENT_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup    content-desc
    Log To Console    Selected date is: ${APPOINTMENT_DATE}
    ${APPOINTMENT_DATE}=    Convert Date    ${APPOINTMENT_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Formatted date is: ${APPOINTMENT_DATE}
    Set Global Variable    ${APPOINTMENT_DATE}

    # Select time (hours and minutes) for the tour plan
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
    Sleep    5s

    # Swipe on hour wheel to set desired hour
    Swipe    1428    709    1280    0    800
    Sleep    2s

    # Swipe on minute wheel to set desired minute
    Swipe    1575    891    1280    0    800
    Sleep    2s

    # Confirm time selection
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]
    Sleep    2s

    # Get and log the selected time
    ${APPOINTMENT_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console    Selected time is: ${APPOINTMENT_TIME}
    Set Global Variable    ${APPOINTMENT_TIME}

    # Set tour duration to 10 minutes
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup      10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="10"]

    # Save the tour plan
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]     10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Sleep    5s

    # Verify contact screen is reloaded after saving tour
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact : ${CONTACT_NAME}")]     10s
    Sleep    5s


View Tour Plan

    #    Verify Tour Plan from the Activity Tab

    # Navigate to Activities tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s

    # Try to check if "Tour Plan" is already visible
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Plan"]    5s

    # If "Tour Plan" is NOT visible, perform steps to open it
    Run Keyword Unless    ${is_visible}    Run Keywords
    ...    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    ...    AND    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
    ...    AND    Click Element    xpath=//android.widget.TextView[@text="Tour Plan"]
    ...    AND    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Plan"]    10s

    Sleep    3s

    # Search for the contact in the Tour Plan tab
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    2s

    # Wait until the contact name appears in the search results
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONTACT_NAME}")])[1]    10s
    Sleep    3s

    # Scroll to the specific tour plan entry using the contact name, date, and time
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONTACT_NAME}, ${APPOINTMENT_DATE}, ${APPOINTMENT_TIME}"))
    Sleep    5s

    # Wait for the "Tour Plan" label to confirm the correct entry is loaded
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]    10s
    Sleep    5s
