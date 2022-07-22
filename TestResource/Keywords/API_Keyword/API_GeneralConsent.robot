*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
API_GeneralConsent_List
    [Arguments]                   ${rowNo}                                         ${statusCode}                                   ${testcaseName}
    Generate_File_Path_Request    ${JSON_GeneralConsent}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                                   ${SHEET_NAME}                                       ${rowNo}
    ${request}                    Prepare_Data_For_API_Post_GeneralConsent_List    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} < 13                                   Validation_API_Post_GeneralConsent_List             ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE IF                                          12 < ${rowNo} < 15                              Validation_API_Post_GeneralConsent_List_Handling    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_API_Post_GeneralConsent_List_Fail    ${request}                                          ${statusCode}    ${rowNo}

Validation_API_Post_GeneralConsent_List
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentList               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTLIST}=                       create dictionary                Authorization=${token}        Content-Type=application/json           CurrentUtcOffset="+07:00"    IsCurrentlyDst=0
    ${response}=                                        Post On Session                  GeneralConsentList            ${API_GENERALCONSENT_LIST['${ENV}']}    data=${request}              headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    Log many                                            ${response.text}
    ${json}                                             Convert String To JSON           ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status} =                                         Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                           ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                     ${actual}

Validation_API_Post_GeneralConsent_List_Handling
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentList               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTLIST}                        create dictionary                Authorization=${token}        Content-Type=application/json    CurrentUtcOffset="+07:00"    IsCurrentlyDst=0
    ${response}                                         Run Keyword If                   ${rowNo} == 13                Post On Session                  GeneralConsentList           ${API_GENERALCONSENT_LIST_ERROR['${ENV}']}    data=${request}    headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    ...                                                 ELSE IF                          ${rowNo} == 14                Post On Session                  GeneralConsentList           ${API_GENERALCONSENT_LIST['${ENV}']}          data={}            headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status} =                                         Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                    ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                         ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                              ${actual}

Validation_API_Post_GeneralConsent_List_Fail
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentList               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTLIST}                        Run Keyword If                   ${rowNo} == 15                create dictionary                       Content-Type=application/json    CurrentUtcOffset="+07:00"               IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 16                create dictionary                       Authorization=${token}           Content-Type=application/json           IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 17                create dictionary                       Authorization=${token}           Content-Type=application/json           CurrentUtcOffset="+07:00"
    ...                                                 ELSE IF                          ${rowNo} == 31                create dictionary                       Authorization=${empty}           Content-Type=application/json           CurrentUtcOffset="+07:00"        IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 32                create dictionary                       Authorization=${token}           Content-Type=application/json           CurrentUtcOffset=${empty}        IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 33                create dictionary                       Authorization=${token}           Content-Type=application/json           CurrentUtcOffset="+07:00"        IsCurrentlyDst=${empty}
    ...                                                 ELSE IF                          ${rowNo} == 47                create dictionary                       Authorization=${INVALID}         Content-Type=application/json           CurrentUtcOffset="+07:00"        IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 48                create dictionary                       Authorization=${token}           Content-Type=application/json           CurrentUtcOffset=${INVALID}      IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 49                create dictionary                       Authorization=${token}           Content-Type=application/json           CurrentUtcOffset="+07:00"        IsCurrentlyDst=${INVALID}    
    ...                                                 ELSE                             create dictionary             Authorization=${token}                  Content-Type=application/json    CurrentUtcOffset="+07:00"               IsCurrentlyDst=0                 
    ${response}=                                        Post On Session                  GeneralConsentList            ${API_GENERALCONSENT_LIST['${ENV}']}    data=${request}                  headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status} =                                         Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                           ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                     ${actual}
