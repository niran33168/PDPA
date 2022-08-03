*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
API_GeneralConsent_List
    [Arguments]                   ${rowNo}                                         ${statusCode}                                   ${testcaseName}
    Generate_File_Path_Request    ${JSON_GeneralConsent_List}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                                   ${SHEET_NAME}                                       ${rowNo}
    ${request}                    Prepare_Data_For_API_Post_GeneralConsent_List    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} < 13                                   Validation_API_Post_GeneralConsent_List             ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE IF                                          12 < ${rowNo} < 15                              Validation_API_Post_GeneralConsent_List_Handling    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_API_Post_GeneralConsent_List_Fail    ${request}                                          ${statusCode}    ${rowNo}

Validation_API_Post_GeneralConsent_List
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentList               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTLIST}=                       create dictionary                Authorization=${token}        Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}=                                        Post On Session                  GeneralConsentList            ${API_GENERALCONSENT_LIST['${ENV}']}    data=${request}                         headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
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
    ${HEADER_GENERALCONSENTLIST}                        create dictionary                Authorization=${token}        Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Run Keyword If                   ${rowNo} == 13                Post On Session                 GeneralConsentList                      ${API_GENERALCONSENT_LIST_ERROR['${ENV}']}    data=${request}    headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    ...                                                 ELSE IF                          ${rowNo} == 14                Post On Session                 GeneralConsentList                      ${API_GENERALCONSENT_LIST['${ENV}']}          data={}            headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status} =                                         Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                   ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                        ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                             ${actual}

Validation_API_Post_GeneralConsent_List_Fail
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentList               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTLIST}                        Run Keyword If                   ${rowNo} == 15                create dictionary                       Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 16                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 17                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                 ELSE IF                          ${rowNo} == 31                create dictionary                       Authorization=${empty}          Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 32                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            CurrentUtcOffset=${empty}               IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 33                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${empty}
    ...                                                 ELSE IF                          ${rowNo} == 47                create dictionary                       Authorization=${INVALID}        Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 48                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            CurrentUtcOffset=${INVALID}             IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 49                create dictionary                       Authorization=${token}          Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${INVALID}    
    ...                                                 ELSE                             create dictionary             Authorization=${token}                  Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0                        
    ${response}=                                        Post On Session                  GeneralConsentList            ${API_GENERALCONSENT_LIST['${ENV}']}    data=${request}                 headers=${HEADER_GENERALCONSENTLIST}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status} =                                         Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                           ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                     ${actual}


API_GeneralConsent_Submit
    [Arguments]                   ${rowNo}                                           ${statusCode}                                     ${testcaseName}
    Generate_File_Path_Request    ${JSON_GeneralConsent_Submit}
    ${data_test}                  Read_Excel_For_Test                                ${EXCEL_NAME}                                     ${SHEET_NAME}                                         ${rowNo}
    ${request}                    Prepare_Data_For_API_Post_GeneralConsent_Submit    ${data_test}
    ${data}                       Run Keyword If                                     ${rowNo} < 16                                     Validation_API_Post_GeneralConsent_Submit             ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE IF                                            15 < ${rowNo} < 18                                Validation_API_Post_GeneralConsent_Submit_Handling    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                               Validation_API_Post_GeneralConsent_Submit_Fail    ${request}                                            ${statusCode}    ${rowNo}

Validation_API_Post_GeneralConsent_Submit
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentSubmit             ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTSUBMIT}                      create dictionary                Authorization=${token}        Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Post On Session                  GeneralConsentSubmit          ${API_GENERALCONSENT_SUBMIT['${ENV}']}    data=${request}                         headers=${HEADER_GENERALCONSENTSUBMIT}    expected_status=${statusCode}    
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                             ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                  ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                       ${actual}

Validation_API_Post_GeneralConsent_Submit_Handling
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentSubmit             ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTSUBMIT}                      create dictionary                Authorization=${token}        Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Run Keyword If                   ${rowNo} == 16                Post On Session                 GeneralConsentSubmit                    ${API_GENERALCONSENT_SUBMIT_ERROR['${ENV}']}    data=${request}    headers=${HEADER_GENERALCONSENTSUBMIT}    expected_status=${statusCode}
    ...                                                 ELSE IF                          ${rowNo} == 17                Post On Session                 GeneralConsentSubmit                    ${API_GENERALCONSENT_SUBMIT['${ENV}']}          data={}            headers=${HEADER_GENERALCONSENTSUBMIT}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                   ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                        ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                             ${actual}

Validation_API_Post_GeneralConsent_Submit_Fail
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentSubmit             ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTSUBMIT}                      Run Keyword If                   ${rowNo} == 23                create dictionary                         Content-Type=${Content_Type}       CurrentUtcOffset=${CurrentUtcOffset}      IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 24                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 25                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                 ELSE IF                          ${rowNo} == 47                create dictionary                         Authorization=${empty}             Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 48                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              CurrentUtcOffset=${empty}               IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 49                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${empty}
    ...                                                 ELSE IF                          ${rowNo} == 71                create dictionary                         Authorization=bearer ${Invalid}    Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 72                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              CurrentUtcOffset=${Invalid}             IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 73                create dictionary                         Authorization=${token}             Content-Type=${Content_Type}              CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${Invalid}
    ...                                                 ELSE                             create dictionary             Authorization=${token}                    Content-Type=${Content_Type}       CurrentUtcOffset=${CurrentUtcOffset}      IsCurrentlyDst=0
    ${response}                                         Post On Session                  GeneralConsentSubmit          ${API_GENERALCONSENT_SUBMIT['${ENV}']}    data=${request}                    headers=${HEADER_GENERALCONSENTSUBMIT}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                             ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                  ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                       ${actual}

API_GeneralConsent_Info
    [Arguments]                   ${rowNo}                                         ${statusCode}                                   ${testcaseName}
    Generate_File_Path_Request    ${JSON_GeneralConsent_Submit}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                                   ${SHEET_NAME}                                       ${rowNo}
    ${request}                    Prepare_Data_For_API_Post_GeneralConsent_Info    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} < 8                                    Validation_API_Post_GeneralConsent_Info             ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE IF                                          7 < ${rowNo} < 10                               Validation_API_Post_GeneralConsent_Info_Handling    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_API_Post_GeneralConsent_Info_Fail    ${request}                                          ${statusCode}    ${rowNo}

Validation_API_Post_GeneralConsent_Info
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentInfo               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTINFO}                        create dictionary                Authorization=${token}        Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Post On Session                  GeneralConsentInfo            ${API_GENERALCONSENT_INFO['${ENV}']}    data=${request}                         headers=${HEADER_GENERALCONSENTINFO}    expected_status=${statusCode}    
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                           ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                     ${actual}

Validation_API_Post_GeneralConsent_Info_Handling
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentInfo               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTINFO}                        create dictionary                Authorization=${token}        Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Run Keyword If                   ${rowNo} == 8                 Post On Session                 GeneralConsentInfo                      ${API_GENERALCONSENT_INFO_ERROR['${ENV}']}    data=${request}    headers=${HEADER_GENERALCONSENTINFO}    expected_status=${statusCode}
    ...                                                 ELSE IF                          ${rowNo} == 9                 Post On Session                 GeneralConsentInfo                      ${API_GENERALCONSENT_INFO['${ENV}']}          data={}            headers=${HEADER_GENERALCONSENTINFO}    expected_status=${statusCode}    
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                   ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                        ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                             ${actual}

Validation_API_Post_GeneralConsent_Info_Fail
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      GeneralConsentInfo               ${HOST_NAME}                  verify=${True}
    ${HEADER_GENERALCONSENTINFO}                        Run Keyword If                   ${rowNo} == 10                create dictionary                       Content-Type=${Content_Type}       CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 11                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 12                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                 ELSE IF                          ${rowNo} == 18                create dictionary                       Authorization=${empty}             Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 19                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            CurrentUtcOffset=${empty}               IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 20                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${empty}
    ...                                                 ELSE IF                          ${rowNo} == 26                create dictionary                       Authorization=bearer ${Invalid}    Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 27                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            CurrentUtcOffset=${Invalid}             IsCurrentlyDst=0
    ...                                                 ELSE IF                          ${rowNo} == 28                create dictionary                       Authorization=${token}             Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${Invalid}
    ...                                                 ELSE                             create dictionary             Authorization=${token}                  Content-Type=${Content_Type}       CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Post On Session                  GeneralConsentInfo            ${API_GENERALCONSENT_INFO['${ENV}']}    data=${request}                    headers=${HEADER_GENERALCONSENTINFO}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                           ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                     ${actual}
