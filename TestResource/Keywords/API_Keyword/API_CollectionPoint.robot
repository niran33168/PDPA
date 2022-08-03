*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
API_Get_Collection_Point_List
    [Arguments]                   ${rowNo}                                         ${statusCode}                          ${testcaseName}
    Generate_File_Path_Request    ${JSON_CollectionPoint}
    ${data_test}                  Read_Excel_For_Test                              ${EXCEL_NAME}                          ${SHEET_NAME}                               ${rowNo}
    ${request}                    Prepare_Data_For_API_Get_CollectionPoint_List    ${data_test}
    ${data}                       Run Keyword If                                   ${rowNo} != 2                          Validation_Get_CollectionPoint_List_Fail    ${request}       ${statusCode}    ${rowNo}
    ...                           ELSE                                             Validation_Get_CollectionPoint_List    ${request}                                  ${statusCode}    ${rowNo}

Validation_Get_CollectionPoint_List
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                       CollectionPointList              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTLIST}=                       create dictionary                Authorization=${token}        Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}    IsCurrentlyDst=0
    ${response}=                                         GET On Session                   CollectionPointList           ${API_COLLECTIONPOINT_LIST['${ENV}']}    data=${request}              headers=${HEADER_COLLECTIONPOINTLIST}    expected_status=${statusCode}
    Log many                                             ${response.text}
    ${json}                                              Convert String To JSON           ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status} =                                          Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                            ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                 ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                      ${actual}

Validation_Get_CollectionPoint_List_Fail
    [Arguments]                                          ${request}                       ${statusCode}                 ${rowNo}
    Create Session                                       CollectionPointList              ${HOST_NAME}                  verify=${True}
    ${HEADER_COLLECTIONPOINTLIST}                        Run Keyword If                   ${rowNo} == 3                 create dictionary                        Content-Type=${Content_Type}    CurrentUtcOffset=${CurrentUtcOffset}                IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 4                 create dictionary                        Authorization=${token}           Content-Type=${Content_Type}            IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 5                 create dictionary                        Authorization=${token}           Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}
    ...                                                  ELSE IF                          ${rowNo} == 6                 create dictionary                        Authorization=${EMPTY}           Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}        IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 7                 create dictionary                        Authorization=${token}           Content-Type=${Content_Type}            CurrentUtcOffset=${EMPTY}        IsCurrentlyDst=0
    ...                                                  ELSE IF                          ${rowNo} == 8                 create dictionary                        Authorization=${token}           Content-Type=${Content_Type}            CurrentUtcOffset=${CurrentUtcOffset}        IsCurrentlyDst=${EMPTY}    
    ${response}=                                         GET On Session                   CollectionPointList           ${API_COLLECTIONPOINT_LIST['${ENV}']}    data=${request}                  headers=${HEADER_COLLECTIONPOINTLIST}    expected_status=${statusCode}
    Log many                                             ${response.text}
    should Be Equal As Strings                           ${statusCode}                    ${response.status_code}
    Set Test Variable                                    ${actual}                        ${response.text}
    ${status} =                                          Run Keyword And Return Status    Should Be Equal As Strings    ${statusCode}                            ${response.status_code}
    Write_Result_Status_To_Excel_CollectionPoint_List    ${EXCEL_NAME}                    ${SHEET_NAME}                 ${rowNo}                                 ${status}
    Run Keyword If                                       ${status}==False                 Log                           Fail
    ...                                                  ELSE IF                          ${status}==True               Log                                      ${actual}
