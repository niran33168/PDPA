*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Get CollectionPointInfo Success
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointInfo}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    2             200                              CP1001_001

Get CollectionPointInfo Handling
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointInfo}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    3             404                              CP4001_001

Get CollectionPointInfo Missing
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointInfo}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    4             401                              CP1003_400
    5             400                              CP1003_401
    6             400                              CP1003_402

Get CollectionPointInfo Empty value
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointInfo}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    7             401                              CP1004_600
    8             200                              CP1004_601
    9             200                              CP1004_602
    10            404                              CP1004_603

Get CollectionPointInfo Invalid
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointInfo}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    11            500                              CP1005_800
    12            200                              CP1005_801
    13            200                              CP1005_802
    14            200                              CP1005_803

