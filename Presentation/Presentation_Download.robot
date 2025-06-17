*** Settings ***
Library     AppiumLibrary

*** Variables ***


*** Test Cases ***
Download All Presentations.
       Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
       Click Element    xpath=//android.view.ViewGroup[@content-desc="Presentations"]
       Wait Until Element Is Visible    xpath=//android.widget.ScrollView       10s
       Click Element    xpath=(//android.widget.TextView[@text="Presentations"])[1]//following-sibling::android.view.ViewGroup
       Sleep    10s