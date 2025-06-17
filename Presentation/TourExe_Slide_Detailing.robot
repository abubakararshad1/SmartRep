*** Settings ***
Library    AppiumLibrary
Library    DateTime
Library    Collections
Library    DoubleTapLibrary.py
*** Variables ***
${CONTACT_NAME}             Sarah Thompson
${APPOINTMENT_DAY}          27
${Survey_name}              MedRep Engagement Insights
${Question_1}               How frequently do you recommend our products to patients for specific health issues?
${Question_2}               How satisfied are you with the availability of our pharmaceutical products?
${Question_3}               What challenges do you face when recommending our products to patients?
${Answer_1}                 Rarely
${Answer_2}                 9
${Answer_3}                 Lack of product Knowledge
${Product_question}         How effective do you find Miconazole for treating fungal infections?
${Product_answer}           Very Effective
${S&T_question_1}           What factors influence your decision to choose Miconazole for treatment?
${S&T_question_2}           How frequently do you prescribe Miconazole for ENT-related fungal infections compared to other antifungal medications?
${S&T_question_3}           What outcomes have you observed in patients using Miconazole for ENT fungal infections?
${S&T_answer_1}             Efficacy
${S&T_answer_2}             9.5
${S&T_answer_3}             Positive outcomes


*** Test Cases ***

Verify that user can Present slides during the tour execution.     

    #verify tour execution from the contacts tab.
    Click Element   xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    10s

#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Alpha Hospital, Active"]/android.view.ViewGroup[6]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView[1]
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]

# Tour execution date
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    10s
    ${TOUR_EXECUTION_DATE}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Date"]/following-sibling::*[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected date is: ${TOUR_EXECUTION_DATE}
    Sleep    5s
    ${TOUR_EXECUTION_DATE}=    Convert Date    ${TOUR_EXECUTION_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${TOUR_EXECUTION_DATE}

    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]
    Sleep    5s

   #Contact -- tour execution -- time --> Hours swipe code
#    Swipe    1428    709    1280    0    800   # 1 swipe

    Swipe    1575    709    1280    0    800   # 2 swipes
    Sleep    2s

    #Contact -- tour execution -- time --> min  swipe code
    Swipe    1575    891    1280    0    800   # 2 swipes
    Sleep    2s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]

    Sleep    5s
    ${TOUR_EXECUTION_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
    Log To Console  Selected time is: ${TOUR_EXECUTION_TIME}

    #Detailing presentation from the tour execution page.
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup        10s
    Sleep    10s
    Click Element    //android.view.ViewGroup[@content-desc="Presentation"]
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup          10s
    Click Element    //android.widget.TextView[@text="Test 2 presentation"]
    # Get element to swipe
    Wait Until Element Is Visible    xpath=//android.view.View[@resource-id="dropzone"]    20s
    Sleep    2s
    ${slide_element}=    Get Webelement    xpath=//android.view.View[@resource-id="dropzone"]

    # Get location and size of the element
    ${location}=    Get Element Location    xpath=//android.view.View[@resource-id="dropzone"]
    ${size}=        Get Element Size        xpath=//android.view.View[@resource-id="dropzone"]

    # Ensure we access dictionary keys properly
    ${start_x}=    Get From Dictionary    ${location}    x
    ${start_y}=    Get From Dictionary    ${location}    y
    ${width}=      Get From Dictionary    ${size}        width
    ${height}=     Get From Dictionary    ${size}        height

    # Calculate center of element (ensure output is int)
    ${x_center}=    Evaluate    int(${start_x} + (${width} / 2))
    ${y_center}=    Evaluate    int(${start_y} + (${height} / 2))

    Log To Console    >>> X Center = ${x_center}
    Log To Console    >>> Y Center = ${y_center}

    # Swipe Left
    Log To Console    >>> Swiping left
    ${swipe_start_x}=    Evaluate    ${start_x} + 400
    Swipe    ${swipe_start_x}    ${start_y}    -400    0    500
    Sleep    1s

    # Swipe Right
    Log To Console    >>> Swiping right
    Swipe    ${start_x}    ${start_y}    400    0    500
    Sleep    5s

   # Double tap to pause presentation
    Log To Console    >>> performing double tap
    Double Tap    1280    804
    Sleep    5s

    #pause and then resume the presentation
    Wait Until Element Is Visible    //android.widget.Button[@resource-id="pause"]      10s
    Click Element    //android.widget.Button[@resource-id="pause"]
    Sleep    5s
    Wait Until Element Is Visible    //android.widget.Button[@resource-id="play"]       10s
    Click Element    //android.widget.Button[@resource-id="play"] 
    Sleep    5s

    #Swipe again
    Log To Console    >>> Swiping left
    ${swipe_start_x}=    Evaluate    ${start_x} + 400
    Swipe    ${swipe_start_x}    ${start_y}    -400    0    500
    Sleep    1s

    Log To Console    >>> Swiping left
    ${swipe_start_x}=    Evaluate    ${start_x} + 400
    Swipe    ${swipe_start_x}    ${start_y}    -400    0    500
    Sleep    1s

    #again perform double tap
    Log To Console    >>>> again performing double tap
    Double Tap    1280    804
    Sleep    5s

     #Click the finish button
     Wait Until Element Is Visible    //android.widget.Button[@resource-id="finish"]     10s
     Click Element    //android.widget.Button[@resource-id="finish"]
     Sleep    5s

     #verify the tour execution page and save the tour
     Wait Until Element Is Visible    //android.widget.TextView[@text="Tour Execution"]     10s
     Sleep    5s

     #Click save button
     Click Element    //android.view.ViewGroup[@content-desc="Save"]

     #verify contact page is visible after saving the tour
     Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact")]    10s
