*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Get CollectionPointInfo Success
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointList}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    2             200                              CP1001_001

Get CollectionPointInfo Missing
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointList}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    3             401                              CP4001_001
    4             400                              CP4001_002
    5             400                              CP4001_003

Get CollectionPointInfo Empty value
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointList}
    [Teardown]    Close Browser
    [Template]    API_Get_Collection_Point_Info
   #rowNo        statusCode                       testcaseNo
    6             401                              CP6001_001
    7             400                              CP6001_002
    8             400                              CP6001_003