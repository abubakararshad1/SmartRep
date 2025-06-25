*** Settings ***

Library     AppiumLibrary

*** Variables ***

${Coaching_Template_Name}       Doctor Engagement & Product Coaching Template

*** Test Cases ***
Verify that user can View the details of the Coaching.
#Click on the Coaching tab
    Sleep    3s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Coaching"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.GroupView/com.horcrux.svg.RectView
#search coaching
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${Coaching_Template_Name}
#click on the coaching template
    Sleep    3s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
    