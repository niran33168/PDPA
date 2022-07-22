*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
Generate_String_Length
    ${string}    Generate Random String	257	[LOWER]
    [Return]     ${string}

Generate_String_Format
    ${string}    Generate Random String	10	[LETTERS]
    [Return]     ${string}


Prepare_Data_For_API_Get_CollectionPoint_List
    [Arguments]       ${Test_Data}
    ${json_string}    Get Binary File    ${file_path_request}.json
    Log               ${json_string}
    ${json}=          evaluate           json.loads('''${json_string}''')    json

    Log Dictionary     ${json}
    ${json_string}=    evaluate          json.dumps(${json})    json
    log many           ${json_string}
    log                ${json_string}
    [Return]           ${json_string}

Prepare_Data_For_API_HealthCheck_Liveness
    [Arguments]       ${Test_Data}
    ${json_string}    Get Binary File    ${file_path_request}.json
    Log               ${json_string}
    ${json}=          evaluate           json.loads('''${json_string}''')    json

    Log Dictionary     ${json}
    ${json_string}=    evaluate          json.dumps(${json})    json
    log many           ${json_string}
    log                ${json_string}
    [Return]           ${json_string}

Prepare_Data_For_API_HealthCheck_Readiness
    [Arguments]       ${Test_Data}
    ${json_string}    Get Binary File    ${file_path_request}.json
    Log               ${json_string}
    ${json}=          evaluate           json.loads('''${json_string}''')    json

    Log Dictionary     ${json}
    ${json_string}=    evaluate          json.dumps(${json})    json
    log many           ${json_string}
    log                ${json_string}
    [Return]           ${json_string}

Prepare_Data_For_API_Post_GeneralConsent_List
    [Arguments]       ${Test_Data}
    ${json_string}    Get Binary File    ${file_path_request}.json
    Log               ${json_string}
    ${json}=          evaluate           json.loads('''${json_string}''')    json

    ${string}         Run Keyword If                                                                                                '${Test_Data['PaginationParams.Offset']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                       '${Test_Data['PaginationParams.Offset']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['PaginationParams.Offset']}'!='empty' and '${Test_Data['PaginationParams.Offset']}'!='None'      set to dictionary                                      ${json['PaginationParams']}    Offset=${Test_Data['PaginationParams.Offset']}
    Run Keyword If    '${Test_Data['PaginationParams.Offset']}'=='format' or '${Test_Data['PaginationParams.Offset']}'=='length'    set to dictionary                                      ${json['PaginationParams']}    Offset=${string}
    Run Keyword If    '${Test_Data['PaginationParams.Offset']}'=='missing'                                                          Delete Object From Json                                ${json}                        $..PaginationParams.Offset

    ${string}         Run Keyword If                                                                                              '${Test_Data['PaginationParams.Limit']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                     '${Test_Data['PaginationParams.Limit']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['PaginationParams.Limit']}'!='empty' and '${Test_Data['PaginationParams.Limit']}'!='None'      set to dictionary                                     ${json['PaginationParams']}    Limit=${Test_Data['PaginationParams.Limit']}
    Run Keyword If    '${Test_Data['PaginationParams.Limit']}'=='format' or '${Test_Data['PaginationParams.Limit']}'=='length'    set to dictionary                                     ${json['PaginationParams']}    Limit=${string}
    Run Keyword If    '${Test_Data['PaginationParams.Limit']}'=='missing'                                                         Delete Object From Json                               ${json}                        $..PaginationParams.Limit

    ${string}         Run Keyword If                                                                                              '${Test_Data['SortingParams.SortName']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                     '${Test_Data['SortingParams.SortName']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['SortingParams.SortName']}'!='empty' and '${Test_Data['SortingParams.SortName']}'!='None'      set to dictionary                                     ${json['SortingParams']}    SortName=${Test_Data['SortingParams.SortName']}
    Run Keyword If    '${Test_Data['SortingParams.SortName']}'=='format' or '${Test_Data['SortingParams.SortName']}'=='length'    set to dictionary                                     ${json['SortingParams']}    SortName=${string}
    Run Keyword If    '${Test_Data['SortingParams.SortName']}'=='missing'                                                         Delete Object From Json                               ${json}                     $..SortingParams.SortName

    ${string}         Run Keyword If                                                                                              '${Test_Data['SortingParams.SortDesc']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                     '${Test_Data['SortingParams.SortDesc']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['SortingParams.SortDesc']}'!='empty' and '${Test_Data['SortingParams.SortDesc']}'!='None'      set to dictionary                                     ${json['SortingParams']}    SortDesc=${Test_Data['SortingParams.SortDesc']}
    Run Keyword If    '${Test_Data['SortingParams.SortDesc']}'=='format' or '${Test_Data['SortingParams.SortDesc']}'=='length'    set to dictionary                                     ${json['SortingParams']}    SortDesc=${string}
    Run Keyword If    '${Test_Data['SortingParams.SortDesc']}'=='missing'                                                         Delete Object From Json                               ${json}                     $..SortingParams.SortDesc

    ${string}         Run Keyword If                                                                                                                  '${Test_Data['GeneralConsentFilterKey.FullName']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                                         '${Test_Data['GeneralConsentFilterKey.FullName']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.FullName']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.FullName']}'!='None'      set to dictionary                                               ${json['GeneralConsentFilterKey']}    FullName=${Test_Data['GeneralConsentFilterKey.FullName']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.FullName']}'=='format' or '${Test_Data['GeneralConsentFilterKey.FullName']}'=='length'    set to dictionary                                               ${json['GeneralConsentFilterKey']}    FullName=${string}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.FullName']}'=='missing'                                                                   Delete Object From Json                                         ${json}                               $..GeneralConsentFilterKey.FullName

    ${string}         Run Keyword If                                                                                                                        '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                                               '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'!='None'      set to dictionary                                                  ${json['GeneralConsentFilterKey']}    PhoneNumber=${Test_Data['GeneralConsentFilterKey.PhoneNumber']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='format' or '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='length'    set to dictionary                                                  ${json['GeneralConsentFilterKey']}    PhoneNumber=${string}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='missing'                                                                      Delete Object From Json                                            ${json}                               $..GeneralConsentFilterKey.PhoneNumber

    ${string}         Run Keyword If                                                                                                                          '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                                                 '${Test_Data['GeneralConsentFilterKey.PhoneNumber']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.IdCardNumber']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.IdCardNumber']}'!='None'      set to dictionary                                                  ${json['GeneralConsentFilterKey']}    IdCardNumber=${Test_Data['GeneralConsentFilterKey.IdCardNumber']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.IdCardNumber']}'=='format' or '${Test_Data['GeneralConsentFilterKey.IdCardNumber']}'=='length'    set to dictionary                                                  ${json['GeneralConsentFilterKey']}    IdCardNumber=${string}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.IdCardNumber']}'=='missing'                                                                       Delete Object From Json                                            ${json}                               $..GeneralConsentFilterKey.IdCardNumber

    ${string}         Run Keyword If                                                                                                            '${Test_Data['GeneralConsentFilterKey.Email']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                                                   '${Test_Data['GeneralConsentFilterKey.Email']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.Email']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.Email']}'!='None'      set to dictionary                                            ${json['GeneralConsentFilterKey']}    Email=${Test_Data['GeneralConsentFilterKey.Email']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.Email']}'=='format' or '${Test_Data['GeneralConsentFilterKey.Email']}'=='length'    set to dictionary                                            ${json['GeneralConsentFilterKey']}    Email=${string}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.Email']}'=='missing'                                                                Delete Object From Json                                      ${json}                               $..GeneralConsentFilterKey.Email

    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.StartDate']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.StartDate']}'!='None'    set to dictionary          ${json['GeneralConsentFilterKey']}    StartDate=${Test_Data['GeneralConsentFilterKey.StartDate']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.StartDate']}'=='missing'                                                                  Delete Object From Json    ${json}                               $..GeneralConsentFilterKey.StartDate

    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.EndDate']}'!='empty' and '${Test_Data['GeneralConsentFilterKey.EndDate']}'!='None'    set to dictionary          ${json['GeneralConsentFilterKey']}    EndDate=${Test_Data['GeneralConsentFilterKey.EndDate']}
    Run Keyword If    '${Test_Data['GeneralConsentFilterKey.EndDate']}'=='missing'                                                                Delete Object From Json    ${json}                               $..GeneralConsentFilterKey.EndDate

    Log Dictionary     ${json}
    ${json_string}=    evaluate          json.dumps(${json})    json
    log many           ${json_string}
    log                ${json_string}
    [Return]           ${json_string}
