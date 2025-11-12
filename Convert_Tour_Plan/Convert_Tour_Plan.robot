*** Settings ***
Library    AppiumLibrary
Library    DateTime
Resource   ../Excel/Excel_Keywords.resource
Library    ../Touch_Keyword/Touch_Keyword.py

*** Variables ***
${EXCEL_TOUR_PLAN_SHEET}        Tour Plan
${EXCEL_CONVERT_PLAN_SHEET}     Convert Tour Plan
# Contact and appointment details
#${CONTACT_NAME}                 Eddie Davila
#${APPOINTMENT_DATE_OPTION}         2025-06-02
#${APPOINTMENT_TIME_OPTION}         14:30
#${APPOINTMENT_DATE_OPTION}      ${APPOINTMENT_DATE}
#${APPOINTMENT_TIME_OPTION}      ${APPOINTMENT_TIME}

# Survey content
${Survey_name}              MedRep Engagement Insights
${Question_1}               How frequently do you recommend our products to patients for specific health issues?
${Question_2}               How satisfied are you with the availability of our pharmaceutical products?
${Question_3}               What challenges do you face when recommending our products to patients?
${Answer_1}                 Rarely
${Answer_2}                 9
${Answer_3}                 Lack of patient awareness

# Product-specific survey
${Product_question}         How effective do you find Miconazole for treating fungal infections?
${Product_answer}           Very Effective

# S&T (Sales & Therapy) questions
${S&T_question_1}           What factors influence your decision to choose Miconazole for treatment?
${S&T_question_2}           How frequently do you prescribe Miconazole for ENT-related fungal infections compared to other antifungal medications?
${S&T_question_3}           What outcomes have you observed in patients using Miconazole for ENT fungal infections?
${S&T_answer_1}             Efficacy
${S&T_answer_2}             9
${S&T_answer_3}             Patients show significant symptom relief and improved recovery with minimal side effects.

# Brand discussion details
${Use_Case}                     Miconazole Treatment for Otomycosis (Fungal Ear Infection)
${Classification}               Detailed
${Product_message}              Rapid treatment for fungal infections in the ear, nose, and throat.
${Product}                      Miconazole
${Brand_Discuss_input_text}     Beneficial for infections in ear, nose, and throat.
${Product_Sku}                  Beclometasone nasal spray 20ml


*** Test Cases ***
Convert Tour Plan and execute Tour

    # Open Activities tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s

    #reading data from excel
    Open Workbook       ${EXCEL_PATH}
    ${SEARCH_CONTACT_NAME}=    Get Cell Value        A2    ${EXCEL_TOUR_PLAN_SHEET}
    ${SEARCH_APPOINTMENT_DATE}=    Get Cell Value    B2     ${EXCEL_TOUR_PLAN_SHEET}
    ${SEARCH_APPOINTMENT_TIME}=    Get Cell Value    C2     ${EXCEL_TOUR_PLAN_SHEET}

    Close Workbook

    # Try to check if "Tour Plan" is already visible
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Plan"]    5s

    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
    Tap At Coordinates  65  325

    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Plan"]    10s
    END


    Sleep    3s

    # Search for the contact in the Tour Plan tab
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${SEARCH_CONTACT_NAME}
    Sleep    2s

    # Wait until the contact name appears in the search results
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${SEARCH_CONTACT_NAME}")])[1]    10s
    Sleep    5s

#     Scroll to the specific tour plan entry using the contact name, date, and time
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${SEARCH_CONTACT_NAME}, ${SEARCH_APPOINTMENT_DATE}, ${SEARCH_APPOINTMENT_TIME}"))
    Sleep    10s

    # Open Tour Plan and convert to Tour Execution
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]       10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Convert 1:1"]
    Sleep    10s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s
    Sleep   5s

    # Capture and convert execution date & time
    ${TOUR_EXECUTION_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected date is: ${TOUR_EXECUTION_DATE}
    ${TOUR_EXECUTION_DATE}=    Convert Date    ${TOUR_EXECUTION_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}
#    Set Global Variable    ${TOUR_EXECUTION_DATE}
    Sleep    5s

    ${TOUR_EXECUTION_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected time is: ${TOUR_EXECUTION_TIME}
#    Set Global Variable    ${TOUR_EXECUTION_TIME}
    Sleep    5s


    # Start Survey
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Survey"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Survey"]/android.view.ViewGroup/com.horcrux.svg.SvgView
    Sleep    5s


#   Swipe to Show Survey Questions
   Swipe    1280    1295    1280    519    500
#    Swipe    1280    919    1280    519    500
    Sleep    2s


    # Fill general survey questions
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Survey_name}"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Survey_name}"]/android.view.ViewGroup/com.horcrux.svg.SvgView
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Question_1}"]        10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Answer_1}"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Question_2}"]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]    ${Answer_2}
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Question_3}"]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]    ${Answer_3}
    Sleep    5s

    # Wait and Click on Product Survey Tab
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Product"]    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Product"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Product"]
    Sleep    10s

    # Fill product section
    Log To Console   >>>> Product section is selected
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Product_question}"]    10s
    Sleep  5s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.RectView
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${Product_answer}"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Product_answer}"]
    Sleep    5s


    # Wait and Click on S&T Survey Tab
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="S And T"]     10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="S And T"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="S And T"]
    Sleep    10s


##   Need to comment below 2 lines after general and product survey is displayed.
#    Click Element    xpath=//android.view.ViewGroup[@content-desc="Pharma Product Distribution & Demand Survey(ENT)"]/android.view.ViewGroup/com.horcrux.svg.SvgView
#    Sleep    5s


    # Fill S&T section
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${S&T_question_1}"]        10s
    Click Element    xpath =//android.view.ViewGroup[@content-desc="Default"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${S&T_answer_1}"]
    Sleep    5s

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${S&T_question_2}"]      10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Answer number"]    ${S&T_answer_2}
    Sleep    5s

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${S&T_question_3}"]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input" and @text="Answer"]    ${S&T_answer_3}
    Sleep    5s

    #   Swipe to Show Brand Discussion Section
    Swipe    1280    1295    1280    519    500
#    Swipe    1280    919    1280    519    500

    # Fill Brand discussion

    Wait Until Element Is Visible    //android.widget.TextView[@text="Prio 1 - Brand Discussed"]        10s
#    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
    Click Element    xpath=(//android.widget.EditText[@text="Search Usecases.."])[1]
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup      20s
    Sleep    5s
    Click Element    //android.view.ViewGroup[@content-desc="${Use_Case}"]
    Sleep    5s
    Click Element    //android.view.ViewGroup[@content-desc="Select Option"]/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Classification}"]        10s
    Click Element    //android.view.ViewGroup[@content-desc="${Classification}"]
    Sleep    5s

    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[5]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product_message}"]     10s
    Click Element    //android.view.ViewGroup[@content-desc="${Product_message}"]
    Sleep    5s

    Click Element    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
    Wait Until Element Is Visible    //android.widget.TextView[@text="${Product}"]          10s
    Click Element    //android.view.ViewGroup[@content-desc="${Product}"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=(//android.view.ViewGroup[@resource-id="@undefined/container"])[3]/android.view.ViewGroup      20s
    Input Text    xpath=(//android.view.ViewGroup[@resource-id="@undefined/container"])[3]//following-sibling::android.widget.EditText    ${Brand_Discuss_input_text}

    # Swipe to reach the Sample delivery section
    Swipe    1280    1295    1280    519    500
    Swipe    1280    1295    1280    519    500
    Swipe    1280    1295    1280    519    500
    Swipe    1280    1295    1280    519    500

    # Sample delivery section
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Add New"]
    Sleep    10s

    Click Element    xpath=//android.view.ViewGroup[@content-desc="${Product_Sku}, ${Product_Sku}"]
    Sleep    5s

    Wait Until Element Is Visible    xpath= (//android.widget.EditText[@resource-id="@undefined/input"])[2]    10s
    Clear Text    xpath= (//android.widget.EditText[@resource-id="@undefined/input"])[2]
    Sleep    3s
    Input Text    xpath= (//android.widget.EditText[@resource-id="@undefined/input"])[2]    10
    Sleep    5s

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="OK"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="OK"]
    Sleep    5s

    # Swipe to reach the Sample delivery Product section
    Swipe    1280    1295    1280    919    500

    Open Or Create Workbook And Sheet       ${EXCEL_CONVERT_PLAN_SHEET}
#   Rename Sheet    Sheet   ${EXCEL_EVENT_SHEET}
    Write To Cell    A1    Convert Plan Contact Name       ${EXCEL_CONVERT_PLAN_SHEET}
    Write To Cell    A2    ${SEARCH_CONTACT_NAME}       ${EXCEL_CONVERT_PLAN_SHEET}
    Write To Cell    B1    Convert Plan Appointment Date    ${EXCEL_CONVERT_PLAN_SHEET}
    Write To Cell    B2    ${TOUR_EXECUTION_DATE}     ${EXCEL_CONVERT_PLAN_SHEET}
    Write To Cell    C1    Convert Plan Appointment Time        ${EXCEL_CONVERT_PLAN_SHEET}
    Write To Cell    C2    ${TOUR_EXECUTION_TIME}       ${EXCEL_CONVERT_PLAN_SHEET}
    Save Workbook

    # Save tour execution
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]     10s
    Sleep    20s


View the Executed Tour

    #    Verify Tour Execution from the Activity Tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Sleep    5s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s

    # Try to check if "Tour Execution" is already visible
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]    5s

    # If NOT visible, execute the steps
#    Run Keyword Unless    ${is_visible}    Run Keywords
#    ...    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
#    ...    AND    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup    10s
#    ...    AND    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
#    ...    AND    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]    10s

    IF    not ${is_visible}
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]
    Sleep    2s
#    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2 ]/android.view.ViewGroup    10s
#    Click Element    xpath=//android.widget.TextView[@text="Tour Execution"]
    Tap At Coordinates  105   400
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[@content-desc="Tour Execution"]    10s
    END

    Sleep    3s

    Open Workbook       ${EXCEL_PATH}
    ${CONVERT_PLAN_CONTACT_NAME}=        Get Cell Value     A2     ${EXCEL_CONVERT_PLAN_SHEET}
    ${CONVERT_PLAN_DATE}=    Get Cell Value    B2     ${EXCEL_CONVERT_PLAN_SHEET}
    ${CONVERT_PLAN_TIME}=    Get Cell Value    C2     ${EXCEL_CONVERT_PLAN_SHEET}
    Log To Console    \n${CONVERT_PLAN_CONTACT_NAME}\n${CONVERT_PLAN_DATE}\n${CONVERT_PLAN_TIME}\n

    # Search and select the contact from the Tour Execution list

    # Input the contact name in the search bar
    # This helps to filter and locate the relevant activity record quickly.
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONVERT_PLAN_CONTACT_NAME}
    Sleep    2s

    # Wait until the contact name appears in the search results
    # Ensures that the app has loaded the result before attempting any further action.
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONVERT_PLAN_CONTACT_NAME}")])[1]     10s
    Sleep    3s

    # Scroll through the list to find the matching tour execution entry based on contact name, date, and time
    # This step ensures we're selecting the exact planned activity for execution verification.
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONVERT_PLAN_CONTACT_NAME}, ${CONVERT_PLAN_DATE}, ${CONVERT_PLAN_TIME}"))
    Sleep    10s

    # Wait for the "Tour Execution" label to confirm that the correct entry has been opened
    # This acts as a validation step that the navigation to the right screen was successful.
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Execution"]        10s

    Sleep    10s