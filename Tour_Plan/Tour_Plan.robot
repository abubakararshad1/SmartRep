*** Settings ***
Library     AppiumLibrary
Library    DateTime
*** Variables ***
${CONTACT_NAME}     Sarah Thompson
${APPOINTMENT_DAY}      27


*** Test Cases ***

Create Tour Plan from Contact
#       Contact Tab Tour Plan Flow
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Contacts"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Contact")]     10s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    10s

#    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]     10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
    Sleep    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Alpha Hospital, Active"]/android.view.ViewGroup[5]/android.view.ViewGroup
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Tour Plan"]     10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup
    Sleep    20s
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup    10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="${APPOINTMENT_DAY}"]/android.view.ViewGroup
    Sleep    5s
    ${APPOINTMENT_DATE}=    Get Element Attribute    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup    content-desc
     Log To Console  Selected date is: ${APPOINTMENT_DATE}
    ${APPOINTMENT_DATE}=    Convert Date    ${APPOINTMENT_DATE}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Log To Console    Selected date is: ${APPOINTMENT_DATE}

    # Appointment - Time
     Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="00:00"]      10s
     Click Element    xpath=//android.view.ViewGroup[@content-desc="00:00"]

    Sleep    5s

   #Contact -- tour plan -- time --> Hours swipe code
     Swipe    1428    709    1280    0    800   # 1 swipe

 #   Swipe    1575    709    1280    0    800   # 2 swipes
      Sleep    2s

    #Contact -- tour plan -- time --> min  swipe code
      Swipe    1575    891    1280    0    800   # 2 swipes
      Sleep    2s
      Click Element    xpath=//android.view.ViewGroup[@content-desc="Select"]
      Sleep    2s

     ${APPOINTMENT_TIME}=    Get Element Attribute    xpath=//android.widget.TextView[@text="Time"]/following-sibling::android.view.ViewGroup[1]/android.view.ViewGroup    content-desc
     Log To Console  Selected time is: ${APPOINTMENT_TIME}




#Contact -- tour plan -- duration --> 10
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup      10s
    Click Element    xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup
    Sleep  10s
    Wait Until Element Is Visible    xpath=//android.widget.ScrollView/android.view.ViewGroup      10s
    Sleep  10s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="10"]
     #Contact -- tour plan -- save --> button
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Save"]     20s
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Save"]
#    Log To Console    ${CONTACT_NAME}
    Sleep    5s

# verify the contact page/name after saving the tour plan
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text, "Contact : ${CONTACT_NAME}")]     10s

    Sleep    5s
    #    Verify Tour Plan from the Activity Tab

    # Activities -- Click and search the contact
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Activities"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[contains(@text,"Activities")]     10s
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@resource-id="@undefined/input"]    ${CONTACT_NAME}
    Sleep    2s
    Wait Until Element Is Visible    xpath=(//android.widget.TextView[contains(@text,"${CONTACT_NAME}")])[1]     10s
    Sleep    3s
    Click Element    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().descriptionContains("${CONTACT_NAME}, ${APPOINTMENT_DATE}, ${APPOINTMENT_TIME}"))
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[@text="Tour Plan"]
    Sleep    3s