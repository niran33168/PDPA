*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
API_HealthCheck_Liveness
    [Arguments]                   ${rowNo}                                     ${statusCode}                               ${testcaseName}
    Generate_File_Path_Request    ${JSON_CollectionPoint}
    ${data_test}                  Read_Excel_For_Test                          ${EXCEL_NAME}                               ${SHEET_NAME}                          ${rowNo}
    ${request}                    Prepare_Data_For_API_HealthCheck_Liveness    ${data_test}
    ${data}                       Run Keyword If                               ${rowNo} < 3                                Validation_API_HealthCheck_Liveness    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                         Validation_API_HealthCheck_Liveness_Fail    ${request}                             ${statusCode}    ${rowNo}

API_HealthCheck_Readiness
    [Arguments]                   ${rowNo}                                      ${statusCode}                                ${testcaseName}
    Generate_File_Path_Request    ${JSON_CollectionPoint}
    ${data_test}                  Read_Excel_For_Test                           ${EXCEL_NAME}                                ${SHEET_NAME}                           ${rowNo}
    ${request}                    Prepare_Data_For_API_HealthCheck_Readiness    ${data_test}
    ${data}                       Run Keyword If                                ${rowNo} == 2                                Validation_API_HealthCheck_Readiness    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                          Validation_API_HealthCheck_Readiness_Fail    ${request}                              ${statusCode}    ${rowNo}

Validation_API_HealthCheck_Liveness
    [Arguments]                                 ${request}                       ${statusCode}                 ${rowNo}
    Create Session                              HealthCheck_Liveness             ${HOST_NAME}                  verify=${True}
    ${HEADER_HEALTHCHECK_LIVENESS}              create dictionary                Authorization=${token}        Content-Type=application/json            Accept=application/json
    ${response}=                                GET On Session                   HealthCheck_Liveness          ${API_HEALTHCHECK_LIVENESS['${ENV}']}    data=${request}            headers=${HEADER_HEALTHCHECK_LIVENESS}    expected_status=${statusCode}
    Log many                                    ${response.text}
    ${json}                                     Convert String To JSON           ${response.text}
    should Be Equal As Strings                  ${statusCode}                    ${response.status_code}
    Set Test Variable                           ${actual}                        ${response.text}
    ${status} =                                 Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                            ${response.status_code}
    Write_Result_Status_To_Excel_HealthCheck    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                 ${status}
    Run Keyword If                              ${status}==False                 Log                           Fail
    ...                                         ELSE IF                          ${status}==True               Log                                      ${actual}

Validation_API_HealthCheck_Liveness_Fail
    [Arguments]                                 ${request}                       ${statusCode}                 ${rowNo}
    Create Session                              HealthCheck_Liveness             ${HOST_NAME}                  verify=${True}
    ${HEADER_HEALTHCHECK_LIVENESS}              Run Keyword If                   ${rowNo} == 5                 create dictionary           Content-Type=application/json            Accept=application/json
    ...                                         ELSE IF                          ${rowNo} == 6                 create dictionary           Authorization=${empty}                   Content-Type=application/json                  Accept=application/json
    ...                                         ELSE                             create dictionary             Authorization=${INVALID}    Content-Type=application/json            Accept=application/json                        
    ${response}                                 Run Keyword If                   ${rowNo} == 4                 GET On Session              HealthCheck_Liveness                     ${API_HEALTHCHECK_LIVENESS_ERROR['${ENV}']}    data=${request}                           headers=${HEADER_HEALTHCHECK_LIVENESS}    expected_status=${statusCode}
    ...                                         ELSE                             GET On Session                HealthCheck_Liveness        ${API_HEALTHCHECK_LIVENESS['${ENV}']}    data=${request}                                headers=${HEADER_HEALTHCHECK_LIVENESS}    expected_status=${statusCode}
    Log many                                    ${response.text}
    should Be Equal As Strings                  ${statusCode}                    ${response.status_code}
    Set Test Variable                           ${actual}                        ${response.text}
    ${status} =                                 Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}               ${response.status_code}
    Write_Result_Status_To_Excel_HealthCheck    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                    ${status}
    Run Keyword If                              ${status}==False                 Log                           Fail
    ...                                         ELSE IF                          ${status}==True               Log                         ${actual}

Validation_API_HealthCheck_Readiness
    [Arguments]                                 ${request}                       ${statusCode}                 ${rowNo}
    Create Session                              HealthCheck_Readiness            ${HOST_NAME}                  verify=${True}
    ${HEADER_HEALTHCHECK_READINESS}=            create dictionary                Authorization=${token}        Content-Type=application/json             Accept=application/json
    ${response}=                                GET On Session                   HealthCheck_Readiness         ${API_HEALTHCHECK_READINESS['${ENV}']}    data=${request}            headers=${HEADER_HEALTHCHECK_READINESS}    expected_status=${statusCode}
    Log many                                    ${response.text}
    ${json}                                     Convert String To JSON           ${response.text}
    should Be Equal As Strings                  ${statusCode}                    ${response.status_code}
    Set Test Variable                           ${actual}                        ${response.text}
    ${status} =                                 Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                             ${response.status_code}
    Write_Result_Status_To_Excel_HealthCheck    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                  ${status}
    Run Keyword If                              ${status}==False                 Log                           Fail
    ...                                         ELSE IF                          ${status}==True               Log                                       ${actual}

Validation_API_HealthCheck_Readiness_Fail
    [Arguments]                                 ${request}                       ${statusCode}                 ${rowNo}
    Create Session                              HealthCheck_Readiness            ${HOST_NAME}                  verify=${True}
    ${HEADER_HEALTHCHECK_READINESS}             Run Keyword If                   ${rowNo} == 4                 create dictionary         Content-Type=application/json             Accept=application/json
    ...                                         ELSE IF                          ${rowNo} == 5                 create dictionary         Authorization=${empty}                    Content-Type=application/json                   Accept=application/json
    ...                                         ELSE IF                          ${rowNo} == 6                 create dictionary         Authorization=${INVALID}                  Content-Type=application/json                   Accept=application/json
    ...                                         ELSE                             create dictionary             Authorization=${token}    Content-Type=application/json             Accept=application/json                         
    ${response}                                 Run Keyword If                   ${rowNo} == 3                 GET On Session            HealthCheck_Readiness                     ${API_HEALTHCHECK_READINESS_ERROR['${ENV}']}    data=${request}                            headers=${HEADER_HEALTHCHECK_READINESS}    expected_status=${statusCode}
    ...                                         ELSE                             GET On Session                HealthCheck_Readiness     ${API_HEALTHCHECK_READINESS['${ENV}']}    data=${request}                                 headers=${HEADER_HEALTHCHECK_READINESS}    expected_status=${statusCode}
    Log many                                    ${response.text}
    should Be Equal As Strings                  ${statusCode}                    ${response.status_code}
    Set Test Variable                           ${actual}                        ${response.text}
    ${status} =                                 Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}             ${response.status_code}
    Write_Result_Status_To_Excel_HealthCheck    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                  ${status}
    Run Keyword If                              ${status}==False                 Log                           Fail
    ...                                         ELSE IF                          ${status}==True               Log                       ${actual}
