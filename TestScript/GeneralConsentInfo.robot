*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
GeneralConsent Info Success
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    2             200                        GC1001_001