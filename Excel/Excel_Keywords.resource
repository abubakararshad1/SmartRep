*** Settings ***
Library    ExcelSage
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
*** Variables ***
${EXCEL_PATH}       Excel/Smart_Data.xlsx



*** Keywords ***
#Handle Event Excel Sheet
#    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${EXCEL_PATH}
#    IF    ${file_exists}
#        Open Workbook      ${EXCEL_PATH}
#    ELSE
#        Create Workbook    ${EXCEL_PATH}    overwrite_if_exists=True
#        Rename Sheet       Sheet    ${EXCEL_EVENT_SHEET}
#    END

Open Or Create Workbook And Sheet
    [Arguments]     ${SHEET_NAME}
    ${FILE_EXISTS}=    Run Keyword And Return Status    File Should Exist    ${EXCEL_PATH}
    IF    ${FILE_EXISTS}
        Open Workbook    ${EXCEL_PATH}
    ELSE
        Create Workbook    ${EXCEL_PATH}    overwrite_if_exists=True
        Rename Sheet       Sheet    ${SHEET_NAME}
    END

    ${SHEET}=    Get Sheets
    ${SHEET_EXISTS}=    Run Keyword And Return Status    List Should Contain Value    ${SHEET}    ${SHEET_NAME}

    IF    not ${SHEET_EXISTS}
        Add Sheet    ${SHEET_NAME}
    END


#Handle Activities Excel Sheet
#
#    Create Workbook     ${EXCEL_PATH}        overwrite_if_exists=True
#    ${file_exists}=    File Should Exist      ${EXCEL_PATH}    return_status=True
#    Run Keyword If    ${file_exists}    Open Workbook    ${EXCEL_PATH}
##    ...    ELSE    Create Workbook    ${EXCEL_PATH}
#    Rename Sheet    Sheet   ${EXCEL_EVENT_SHEET}
#
#    Write To Cell      A1    appointment_start_date     ${EXCEL_EVENT_SHEET}
#    Write To Cell      A2    abcdef         ${EXCEL_EVENT_SHEET}
#    Write To Cell      B1    appointment_time           ${EXCEL_EVENT_SHEET}
#    Write To Cell      B2    hospital1e abc         ${EXCEL_EVENT_SHEET}
#    Save Workbook
#
