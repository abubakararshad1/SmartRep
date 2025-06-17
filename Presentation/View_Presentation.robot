*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
Verify that user can view the presentation
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    
    Wait Until Element Is Visible    //android.widget.TextView[@text="Test 2 presentation"]     10s
    Click Element    //android.view.ViewGroup[@content-desc="Test 2 presentation"]//following-sibling::android.view.ViewGroup 
    Sleep    10s

    


