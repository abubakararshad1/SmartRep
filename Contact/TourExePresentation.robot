*** Settings ***
Library     AppiumLibrary
Library    Collections

*** Variables ***
${Contact_XPATH}   //android.view.ViewGroup[@content-desc="Contacts"]
${Visible_element_XPATH}        //android.widget.TextView[@text="Jason Patel"]
${Tour_Exe_XPATH}       //android.view.ViewGroup[@content-desc="Jason Patel, Pharmacist, CarePlus Pharmacy, 0/1, C"]/android.view.ViewGroup[9]/android.view.ViewGroup
${Visible_element_XPATH_2}      //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup
${Presentation_btn_XPATH}       //android.view.ViewGroup[@content-desc="Presentation"]
${Visible_element_XPATH_3}      //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${Presentation_XPATH}       //android.widget.TextView[@text="Test 2 presentation"]
${SLIDE_XPATH}         //android.view.View[@resource-id="dropzone"]


*** Test Cases ***

Present slides during the tour execution.
    Click Element    ${Contact_XPATH}
    Click Element    ${Contact_XPATH}
    Wait Until Element Is Visible    ${Visible_element_XPATH}
    Sleep    20s
    Click Element    ${Tour_Exe_XPATH}
    Sleep    10s
    Wait Until Element Is Visible    ${Visible_element_XPATH_2}        10s
    Sleep    10s
    Click Element    ${Presentation_btn_XPATH}
    Wait Until Element Is Visible    ${Visible_element_XPATH_3}          10s
    Click Element    ${Presentation_XPATH}


    # Get element to swipe
    Wait Until Element Is Visible    ${SLIDE_XPATH}       10s
    Sleep    10s
    ${slide_element}    Get Webelement     ${SLIDE_XPATH}

    ${location}=        Get Element Location    ${slide_element}
    ${size}=            Get Element Size        ${slide_element}

# Log these values to ensure they are dictionaries
    Log To Console    >>> Location = ${location}
    Log To Console    >>> Size = ${size}

# Safely extract values
    ${start_x}=    Evaluate    dict(${location}).get('x', 0)
    ${start_y}=    Evaluate    dict(${location}).get('y', 0)
    ${width}=      Evaluate    dict(${size}).get('width', 0)
    ${height}=     Evaluate    dict(${size}).get('height', 0)


    ${end_x_right}      Evaluate    "${start_x} + ${width} - 10"
    ${end_x_left}       Set Variable    ${start_x}


    # Swipe left
    Log To Console    >>> Swiping left
    Swipe    ${start_x + 400}    ${start_y}    -400    0    500
    Sleep    1s

    # Swipe right
    Log To Console    >>> Swiping right
    Swipe    ${start_x}    ${start_y}    400    0    500
    Sleep    1s

    Log To Console    >>> Performing double tap

    # Ensure location and size are dictionaries
    ${start_x}=    Get From Dictionary    ${location}    x
    ${start_y}=    Get From Dictionary    ${location}    y
    ${width}=      Get From Dictionary    ${size}        width
    ${height}=     Get From Dictionary    ${size}        height

    # Calculate center of the element
    ${x}=    Evaluate    str(${start_x} + (${width} // 2))
    ${y}=    Evaluate    str(${start_y} + (${height} // 2) + 200)

    Log To Console    >>> Tapping at X=${x}, Y=${y}

    # Perform double tap
    Tap With Positions    ${x}    ${y}
    Sleep    0.1s
    Tap With Positions    ${x}    ${y}

    Sleep    10s

