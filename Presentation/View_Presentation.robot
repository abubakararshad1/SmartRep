*** Settings ***
Library     AppiumLibrary
Library     ../Touch_Keyword/Touch_Keyword.py

*** Variables ***
${CONTACT_NAME}         Sarah Thompson
${PRESENTATION_NAME}    Presentation Sample 1

*** Test Cases ***
View Presentation
    [Documentation]    View a selected presentation from the Presentations tab and interact with it.

    # Navigate to the Presentations tab
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]

    # Wait for Presentations screen to fully load
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Presentations"])[1]    10s
    Sleep    5s

    # Click the 'View' button for the selected presentation
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${PRESENTATION_NAME}"]//following-sibling::android.view.ViewGroup[@content-desc="View"]
    Sleep    5s

    # Swipe left to move through slides
    Swipe    2300    804    2000    804    100
    Sleep    5s
    Swipe    2300    804    2000    804    100
    Sleep    5s
    Swipe    2300    804    2000    804    100
    Sleep    10s

    # Swipe right to go back to a previous slide
    Swipe    300    804    500    804    100
    Sleep    10s

    # Double tap to pause the presentation playback
    Double Tap    1280    804
    Sleep    10s

    # Wait for and click the 'Pause' button to pause presentation
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="PAUSE"]   10s
    Click Element    xpath=//android.widget.Button[@text="PAUSE"]
    Sleep    10s

    # Wait for and click the 'Resume' button to continue presentation
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="RESUME"]    10s
    Click Element    xpath=//android.widget.Button[@text="RESUME"]
    Sleep    5s

    # Swipe to next slide again during playback
    Swipe    2300    804    2000    804    100
    Sleep    5s

    # Double tap to bring up the finish option
    Double Tap    1280    804
    Sleep    5s
    # Wait for and click the 'Finish' button to end the presentation
    Wait Until Element Is Visible    xpath=//android.widget.Button[@text="FINISH"]   10s
    Click Element    xpath=//android.widget.Button[@text="FINISH"]
    Sleep    10s



