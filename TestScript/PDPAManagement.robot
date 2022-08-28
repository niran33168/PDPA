*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Setting User
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    2             200                   UI1001_000
    3             200                   UI1001_001
    4             200                   UI1001_002

Setting Role
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    5             200                   UI1002_000
    6             200                   UI1002_001
    7             200                   UI1002_002

Master Purpose category
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    8             200                   UI1003_000
    9             200                   UI1003_001
    10            200                   UI1003_002           

Master Purpose
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    11            200                   UI1004_000
    12            200                   UI1004_001
    13            200                   UI1004_002

Cookie Consent
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    14            200                   UI1005_000
    15            200                   UI1005_001
    16            200                   UI1005_002 

Collection Point
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    17            200                   UI1006_000
    18            200                   UI1006_001
    19            200                   UI1006_002
    20            200                   UI1006_003

General Consent
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    21            200                   UI1007_000           

Cookie Scanner
    [Setup]       Run Keywords          Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}    
    ...           AND                   Set Test Variable    ${SHEET_NAME}    ${SHEET_UI}
    [Teardown]    Close All Browsers
    [Template]    PDPAManagement
   #rowNo        statusCode            testcaseNo
    22            200                   UI1008_000           
