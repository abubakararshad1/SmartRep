*** Settings ***
Library    ExcelSage
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
*** Variables ***
${EXCEL_PATH}          ../Excel/Smart_Data.xlsx

*** Keywords ***
Open Or Create Workbook And Sheet
    [Arguments]     ${sheet_name}
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${excel_path}
    IF    ${file_exists}
        Open Workbook    ${excel_path}
    ELSE
        Create Workbook    ${excel_path}    overwrite_if_exists=True
        Rename Sheet       Sheet    ${sheet_name}
    END

    ${sheets}=    Get Sheets
    ${sheet_exists}=    Run Keyword And Return Status    List Should Contain Value    ${sheets}    ${sheet_name}

    IF    not ${sheet_exists}
        Add Sheet    ${sheet_name}
    END
