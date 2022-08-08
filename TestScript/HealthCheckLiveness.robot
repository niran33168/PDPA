*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
HealthCheck Liveness Success
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckLiveness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Liveness
   #rowNo        statusCode                       testcaseNo
    2             200                         HL1001_000
    # 3             200                         HL1001_001

HealthCheck Liveness Handling
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckLiveness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Liveness
   #rowNo        statusCode                       testcaseNo
    4             404                         HL1002_200

HealthCheck Liveness Missing
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckLiveness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Liveness
   #rowNo        statusCode                       testcaseNo
    5             401                         HL1004_400

HealthCheck Liveness Empty value
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckLiveness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Liveness
   #rowNo        statusCode                       testcaseNo
    6             401                         HL1005_500

HealthCheck Liveness Invalid
    [Setup]       Run Keywords                Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                         Set Test Variable    ${SHEET_NAME}    ${SHEET_HealthCheckLiveness}
    [Teardown]    Close Browser
    [Template]    API_HealthCheck_Liveness
   #rowNo        statusCode                       testcaseNo
    7             500                         HL1006_600
