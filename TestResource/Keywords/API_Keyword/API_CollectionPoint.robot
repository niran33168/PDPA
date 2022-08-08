*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
API_Get_Collection_Point_List
    [Arguments]                   ${rowNo}                                         ${statusCode}                          ${testcaseName}
    Generate_File_Path_Request    ${JSON_CollectionPoint_List}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                          ${SHEET_NAME}                               ${rowNo}
    ${request}                    Prepare_Data_For_API_Get_CollectionPoint_List    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} != 2                          Validation_Get_CollectionPoint_List_Fail    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_Get_CollectionPoint_List    ${request}                                  ${statusCode}    ${rowNo}

Validation_Get_CollectionPoint_List
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                       CollectionPointList              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTLIST}                        create dictionary                Authorization=${token}        Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                          GET On Session                   CollectionPointList           ${API_COLLECTIONPOINT_LIST['${ENV}']}    data=${request}                         headers=${HEADER_COLLECTIONPOINTLIST}    expected_status=${statusCode}
    Log many                                             ${response.text}
    ${json}                                              Convert String To JSON           ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status}                                            Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                            ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                 ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                      ${actual}

Validation_Get_CollectionPoint_List_Fail
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                       CollectionPointList              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTLIST}                        Run Keyword If                   ${rowNo} == 3                 create dictionary                        Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}     IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 4                 create dictionary                        Authorization=${token}          Content-Type=${Content_Type}             IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 5                 create dictionary                        Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                  ELSE IF                          ${rowNo} == 6                 create dictionary                        Authorization=${EMPTY}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 7                 create dictionary                        Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${EMPTY}               IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 8                 create dictionary                        Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${EMPTY}    
    ${response}                                          GET On Session                   CollectionPointList           ${API_COLLECTIONPOINT_LIST['${ENV}']}    data=${request}                 headers=${HEADER_COLLECTIONPOINTLIST}    expected_status=${statusCode}
    Log many                                             ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status}                                            Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                            ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                 ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                      ${actual}

API_Get_Collection_Point_Info
    [Arguments]                   ${rowNo}                                         ${statusCode}                               ${testcaseName}
    Generate_File_Path_Request    ${JSON_CollectionPoint_Info}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                               ${SHEET_NAME}                                   ${rowNo}
    ${request}                    Prepare_Data_For_API_Get_CollectionPoint_Info    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} == 2                               Validation_Get_CollectionPoint_Info             ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE IF                                          ${rowNo} == 3                               Validation_Get_CollectionPoint_Info_Handling    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_Get_CollectionPoint_Info_Fail    ${request}                                      ${statusCode}    ${rowNo}

Validation_Get_CollectionPoint_Info
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    ${json_object}                                       Convert String to JSON           ${request}
    ${values}                                            Get Value From Json              ${json_object}                $..collectionpoint	
    ${json_str}                                          Convert JSON To String           ${values}
    ${values}                                            Remove String                    ${json_str}                   ["                                                "]
    Create Session                                       CollectionPointInfo              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTINFO}                        create dictionary                Authorization=${token}        Content-Type=${Content_Type}                      CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                          GET On Session                   CollectionPointInfo           ${API_COLLECTIONPOINT_INFO['${ENV}']}${values}    data={}                                 headers=${HEADER_COLLECTIONPOINTINFO}    expected_status=${statusCode}
    Log many                                             ${response.text}
    ${json}                                              Convert String To JSON           ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status}                                            Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                                     ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                          ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                               ${actual}

Validation_Get_CollectionPoint_Info_Handling
    [Arguments]                                         ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                      CollectionPointInfo              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTINFO}                       create dictionary                Authorization=${token}        Content-Type=${Content_Type}                  CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}                                         Post On Session                  CollectionPointInfo           ${API_GENERALCONSENT_INFO_ERROR['${ENV}']}    data=${request}                         headers=${HEADER_COLLECTIONPOINTINFO}    expected_status=${statusCode}
    Log many                                            ${response.text}
    should Be Equal As Strings                          ${statusCode}                    ${response.status_code}
    Set Test Variable                                   ${actual}                        ${response.text}
    ${status}                                           Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                                 ${response.status_code}
    Write_Result_Status_To_Excel_GeneralConsent_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                      ${status}
    Run Keyword If                                      ${status}==False                 Log                           Fail
    ...                                                 ELSE IF                          ${status}==True               Log                                           ${actual}

Validation_Get_CollectionPoint_Info_Fail
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    ${json_object}                                       Convert String to JSON           ${request}
    ${values}                                            Get Value From Json              ${json_object}                $..collectionpoint	
    ${json_str}                                          Convert JSON To String           ${values}
    ${values}                                            Remove String                    ${json_str}                   ["                                                "]
    Create Session                                       CollectionPointInfo              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTINFO}                        Run Keyword If                   ${rowNo} == 4                 create dictionary                                 Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}     IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 5                 create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 6                 create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                  ELSE IF                          ${rowNo} == 7                 create dictionary                                 Authorization=${EMPTY}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 8                 create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${EMPTY}               IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 9                 create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${EMPTY}
    ...                                                  ELSE IF                          ${rowNo} == 11                create dictionary                                 Authorization=${INVALID}        Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 12                create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${INVALID}             IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 13                create dictionary                                 Authorization=${token}          Content-Type=${Content_Type}             CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=${INVALID}    
    ...                                                  ELSE                             create dictionary             Authorization=${token}                            Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}     IsCurrentlyDst=0                        
    ${response}                                          GET On Session                   CollectionPointInfo           ${API_COLLECTIONPOINT_INFO['${ENV}']}${values}    data={}                         headers=${HEADER_COLLECTIONPOINTINFO}    expected_status=${statusCode}
    Log many                                             ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status}                                            Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                                     ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                          ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                               ${actual}
