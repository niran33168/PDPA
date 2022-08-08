*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
PDPA Management
    [Setup]       Run Keywords      Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND               Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close Browser
    [Template]    PDPAManagement
   #rowNo        statusCode                       testcaseNo
    2             200               UI1001_000
    3             200               UI1001_001
