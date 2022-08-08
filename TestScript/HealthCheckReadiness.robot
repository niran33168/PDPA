*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
HealthCheck Readiness Success
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckReadiness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Readiness
   #rowNo        statusCode                       testcaseNo
    2             200                          HR1001_001

HealthCheck Readiness Handling
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckReadiness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Readiness
   #rowNo        statusCode                       testcaseNo
    3             404                         HL1002_200

HealthCheck Readiness Missing
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckReadiness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Readiness
   #rowNo        statusCode                       testcaseNo
    4             401                          HL1004_400

HealthCheck Readiness Empty value
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckReadiness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Readiness
   #rowNo        statusCode                       testcaseNo
    5             401                          HL1005_500

HealthCheck Readiness Invalid
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckReadiness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Readiness
   #rowNo        statusCode                       testcaseNo
    6             500                         HL1006_600
