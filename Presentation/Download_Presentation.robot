*** Settings ***
Library     AppiumLibrary


*** Test Cases ***
Download Presentation
    [Documentation]    Download Presentation from Presentation Tab.
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
#    Click Element    xpath=//android.widget.TextView[@text="Presentations"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[@text="Presentations"])[1]//following-sibling::android.view.ViewGroup[@content-desc="Download All"]     10s
#    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Download All"]     10s
    Sleep    5s
    Click Element    xpath=(//android.widget.TextView[@text="Presentations"])[1]//following-sibling::android.view.ViewGroup[@content-desc="Download All"]//android.widget.TextView
    Sleep    5s
#    Click Element    xpath=//android.widget.TextView[contains(@text,"Download All")]
    Wait Until Page Does Not Contain Element    xpath=//android.widget.TextView[@text="Download"]     480s
#    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Download All")]     10s
    Sleep    10s