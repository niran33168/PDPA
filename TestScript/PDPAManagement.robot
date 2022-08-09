*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Setting User
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode                       testcaseNo
    2             200                   UI1001_000
    3             200                   UI1001_001
    4             200                   UI1001_002

Setting Role
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode                       testcaseNo
    5             200                   UI1002_000
    6             200                   UI1002_001
    7             200                   UI1002_002

Master Purpose category
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode                       testcaseNo
    8             200                   UI1003_000
    9             200                   UI1003_001
    10            200                   

Master Purpose
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode                       testcaseNo
    11            200                   UI1004_000
    12            200                   UI1004_001
    13            200                   UI1004_002