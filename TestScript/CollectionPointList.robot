*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
Get CollectionPointList Success
    [Setup]       Run Keywords                     Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}                   
    ...           AND                              Set Test Variable    ${SHEET_NAME}    ${SHEET_CollectionPointList}
    [Teardown]    Close Browser
    [Template]    apiGetCollectionPointList
   #rowNo        statusCode                       testcaseNo
    2             200                              CP1001_001
