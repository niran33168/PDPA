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


Prepare_Data_For_API_Post_GeneralConsent_Submit
    [Arguments]         ${Test_Data}
    ${json_string}      Get Binary File    ${file_path_request}.json
    Log                 ${json_string}
    ${json}=            evaluate           json.loads('''${json_string}''')    json
    ${json_purpose}=    evaluate           json.loads('''${json_string}''')    json 

    ${string}         Run Keyword If                                                                          '${Test_Data['AgeRangeCode']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                 '${Test_Data['AgeRangeCode']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['AgeRangeCode']}'!='empty' and '${Test_Data['AgeRangeCode']}'!='None'      set to dictionary                           ${json}                   AgeRangeCode=${Test_Data['AgeRangeCode']}
    Run Keyword If    '${Test_Data['AgeRangeCode']}'=='format' or '${Test_Data['AgeRangeCode']}'=='length'    set to dictionary                           ${json}                   AgeRangeCode=${string}
    Run Keyword If    '${Test_Data['AgeRangeCode']}'=='missing'                                               Delete Object From Json                     ${json}                   $..AgeRangeCode

    ${string}         Run Keyword If                                                                                        '${Test_Data['CollectionPointGuid']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                               '${Test_Data['CollectionPointGuid']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['CollectionPointGuid']}'!='empty' and '${Test_Data['CollectionPointGuid']}'!='None'      set to dictionary                                  ${json}                   CollectionPointGuid=${Test_Data['CollectionPointGuid']}
    Run Keyword If    '${Test_Data['CollectionPointGuid']}'=='format' or '${Test_Data['CollectionPointGuid']}'=='length'    set to dictionary                                  ${json}                   CollectionPointGuid=${string}
    Run Keyword If    '${Test_Data['CollectionPointGuid']}'=='missing'                                                      Delete Object From Json                            ${json}                   $..CollectionPointGuid

    ${string}         Run Keyword If                                                                    '${Test_Data['CompanyId']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                           '${Test_Data['CompanyId']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['CompanyId']}'!='empty' and '${Test_Data['CompanyId']}'!='None'      set to dictionary                        ${json}                   CompanyId=${Test_Data['CompanyId']}
    Run Keyword If    '${Test_Data['CompanyId']}'=='format' or '${Test_Data['CompanyId']}'=='length'    set to dictionary                        ${json}                   CompanyId=${string}
    Run Keyword If    '${Test_Data['CompanyId']}'=='missing'                                            Delete Object From Json                  ${json}                   $..CompanyId

    ${string}         Run Keyword If                                                                    '${Test_Data['WebSiteId']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                           '${Test_Data['WebSiteId']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['WebSiteId']}'!='empty' and '${Test_Data['WebSiteId']}'!='None'      set to dictionary                        ${json}                   WebSiteId=${Test_Data['WebSiteId']}
    Run Keyword If    '${Test_Data['WebSiteId']}'=='format' or '${Test_Data['WebSiteId']}'=='length'    set to dictionary                        ${json}                   WebSiteId=${string}
    Run Keyword If    '${Test_Data['WebSiteId']}'=='missing'                                            Delete Object From Json                  ${json}                   $..WebSiteId

    ${string}         Run Keyword If                                                        '${Test_Data['Uid']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                               '${Test_Data['Uid']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Uid']}'!='empty' and '${Test_Data['Uid']}'!='None'      set to dictionary                  ${json}                   Uid=${Test_Data['Uid']}
    Run Keyword If    '${Test_Data['Uid']}'=='format' or '${Test_Data['Uid']}'=='length'    set to dictionary                  ${json}                   Uid=${string}
    Run Keyword If    '${Test_Data['Uid']}'=='missing'                                      Delete Object From Json            ${json}                   $..Uid

    ${string}         Run Keyword If                                                                  '${Test_Data['FullName']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                         '${Test_Data['FullName']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['FullName']}'!='empty' and '${Test_Data['FullName']}'!='None'      set to dictionary                       ${json}                   FullName=${Test_Data['FullName']}
    Run Keyword If    '${Test_Data['FullName']}'=='format' or '${Test_Data['FullName']}'=='length'    set to dictionary                       ${json}                   FullName=${string}
    Run Keyword If    '${Test_Data['FullName']}'=='missing'                                           Delete Object From Json                 ${json}                   $..FullName

    ${string}         Run Keyword If                                                            '${Test_Data['Email']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                   '${Test_Data['Email']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Email']}'!='empty' and '${Test_Data['Email']}'!='None'      set to dictionary                    ${json}                   Email=${Test_Data['Email']}
    Run Keyword If    '${Test_Data['Email']}'=='format' or '${Test_Data['Email']}'=='length'    set to dictionary                    ${json}                   Email=${string}
    Run Keyword If    '${Test_Data['Email']}'=='missing'                                        Delete Object From Json              ${json}                   $..Email

    ${string}         Run Keyword If                                                                        '${Test_Data['PhoneNumber']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                               '${Test_Data['PhoneNumber']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['PhoneNumber']}'!='empty' and '${Test_Data['PhoneNumber']}'!='None'      set to dictionary                          ${json}                   PhoneNumber=${Test_Data['PhoneNumber']}
    Run Keyword If    '${Test_Data['PhoneNumber']}'=='format' or '${Test_Data['PhoneNumber']}'=='length'    set to dictionary                          ${json}                   PhoneNumber=${string}
    Run Keyword If    '${Test_Data['PhoneNumber']}'=='missing'                                              Delete Object From Json                    ${json}                   $..PhoneNumber

    ${string}         Run Keyword If                                                                        '${Test_Data['FromBrowser']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                               '${Test_Data['FromBrowser']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['FromBrowser']}'!='empty' and '${Test_Data['FromBrowser']}'!='None'      set to dictionary                          ${json}                   FromBrowser=${Test_Data['FromBrowser']}
    Run Keyword If    '${Test_Data['FromBrowser']}'=='format' or '${Test_Data['FromBrowser']}'=='length'    set to dictionary                          ${json}                   FromBrowser=${string}
    Run Keyword If    '${Test_Data['FromBrowser']}'=='missing'                                              Delete Object From Json                    ${json}                   $..FromBrowser

    ${string}         Run Keyword If                                                                        '${Test_Data['FromWebsite']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                               '${Test_Data['FromWebsite']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['FromWebsite']}'!='empty' and '${Test_Data['FromWebsite']}'!='None'      set to dictionary                          ${json}                   FromWebsite=${Test_Data['FromWebsite']}
    Run Keyword If    '${Test_Data['FromWebsite']}'=='format' or '${Test_Data['FromWebsite']}'=='length'    set to dictionary                          ${json}                   FromWebsite=${string}
    Run Keyword If    '${Test_Data['FromWebsite']}'=='missing'                                              Delete Object From Json                    ${json}                   $..FromWebsite

    ${string}         Run Keyword If                                                                      '${Test_Data['VerifyType']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                             '${Test_Data['VerifyType']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['VerifyType']}'!='empty' and '${Test_Data['VerifyType']}'!='None'      set to dictionary                         ${json}                   VerifyType=${Test_Data['VerifyType']}
    Run Keyword If    '${Test_Data['VerifyType']}'=='format' or '${Test_Data['VerifyType']}'=='length'    set to dictionary                         ${json}                   VerifyType=${string}
    Run Keyword If    '${Test_Data['VerifyType']}'=='missing'                                             Delete Object From Json                   ${json}                   $..VerifyType

    ${string}         Run Keyword If                                                                    '${Test_Data['EventCode']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                           '${Test_Data['EventCode']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['EventCode']}'!='empty' and '${Test_Data['EventCode']}'!='None'      set to dictionary                        ${json}                   EventCode=${Test_Data['EventCode']}
    Run Keyword If    '${Test_Data['EventCode']}'=='format' or '${Test_Data['EventCode']}'=='length'    set to dictionary                        ${json}                   EventCode=${string}
    Run Keyword If    '${Test_Data['EventCode']}'=='missing'                                            Delete Object From Json                  ${json}                   $..EventCode

    ${string}         Run Keyword If                                                                          '${Test_Data['IdCardNumber']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                 '${Test_Data['IdCardNumber']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['IdCardNumber']}'!='empty' and '${Test_Data['IdCardNumber']}'!='None'      set to dictionary                           ${json}                   IdCardNumber=${Test_Data['IdCardNumber']}
    Run Keyword If    '${Test_Data['IdCardNumber']}'=='format' or '${Test_Data['IdCardNumber']}'=='length'    set to dictionary                           ${json}                   IdCardNumber=${string}
    Run Keyword If    '${Test_Data['IdCardNumber']}'=='missing'                                               Delete Object From Json                     ${json}                   $..IdCardNumber

    ${string}         Run Keyword If                                                                '${Test_Data['Expired']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                       '${Test_Data['Expired']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Expired']}'!='empty' and '${Test_Data['Expired']}'!='None'      set to dictionary                      ${json}                   Expired=${Test_Data['Expired']}
    Run Keyword If    '${Test_Data['Expired']}'=='format' or '${Test_Data['Expired']}'=='length'    set to dictionary                      ${json}                   Expired=${string}
    Run Keyword If    '${Test_Data['Expired']}'=='missing'                                          Delete Object From Json                ${json}                   $..Expired

    ${string}         Run Keyword If                                                                                  '${Test_Data['ConsentSignature']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                         '${Test_Data['ConsentSignature']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['ConsentSignature']}'!='empty' and '${Test_Data['ConsentSignature']}'!='None'      set to dictionary                               ${json}                   ConsentSignature=${Test_Data['ConsentSignature']}
    Run Keyword If    '${Test_Data['ConsentSignature']}'=='format' or '${Test_Data['ConsentSignature']}'=='length'    set to dictionary                               ${json}                   ConsentSignature=${string}
    Run Keyword If    '${Test_Data['ConsentSignature']}'=='missing'                                                   Delete Object From Json                         ${json}                   $..ConsentSignature

    ${string}         Run Keyword If                                                                                        '${Test_Data['Purpose.PurposeGuid']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                               '${Test_Data['Purpose.PurposeGuid']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Purpose.PurposeGuid']}'!='empty' and '${Test_Data['Purpose.PurposeGuid']}'!='None'      set to dictionary                                  ${json_purpose}           PurposeGuid=${Test_Data['Purpose.PurposeGuid']}
    Run Keyword If    '${Test_Data['Purpose.PurposeGuid']}'=='format' or '${Test_Data['Purpose.PurposeGuid']}'=='length'    set to dictionary                                  ${json}                   PurposeGuid=${string}
    Run Keyword If    '${Test_Data['Purpose.PurposeGuid']}'=='missing'                                                      Delete Object From Json                            ${json_purpose}           $..PurposeGuid

    ${string}         Run Keyword If                                                                              '${Test_Data['Purpose.Active']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                     '${Test_Data['Purpose.Active']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Purpose.Active']}'!='empty' and '${Test_Data['Purpose.Active']}'!='None'      set to dictionary                             ${json_purpose}           Active=${Test_Data['Purpose.Active']}
    Run Keyword If    '${Test_Data['Purpose.Active']}'=='format' or '${Test_Data['Purpose.Active']}'=='length'    set to dictionary                             ${json}                   Active=${string}
    Run Keyword If    '${Test_Data['Purpose.Active']}'=='missing'                                                 Delete Object From Json                       ${json_purpose}           $..Active

    ${string}         Run Keyword If                                                                                '${Test_Data['Purpose.Expired']}'=='format'    Generate_String_Format
    ...               ELSE IF                                                                                       '${Test_Data['Purpose.Expired']}'=='length'    Generate_String_Length
    Run Keyword If    '${Test_Data['Purpose.Expired']}'!='empty' and '${Test_Data['Purpose.Expired']}'!='None'      set to dictionary                              ${json_purpose}           Expired=${Test_Data['Purpose.Expired']}
    Run Keyword If    '${Test_Data['Purpose.Expired']}'=='format' or '${Test_Data['Purpose.Expired']}'=='length'    set to dictionary                              ${json}                   Expired=${string}
    Run Keyword If    '${Test_Data['Purpose.Expired']}'=='missing'                                                  Delete Object From Json                        ${json_purpose}           $..Expired

    ${status}          Run Keyword And Return Status    '${Test_Data['Purpose.PurposeGuid']}'!='empty' and '${Test_Data['Purpose.PurposeGuid']}'!='None' and '${Test_Data['Purpose.Active']}'!='empty' and '${Test_Data['Purpose.Active']}'!='None' and '${Test_Data['Purpose.Expired']}'!='empty' and '${Test_Data['Purpose.Expired']}'!='None'    Log                  true                                               ELSE                                     Log                                        false
    &{dict_purpose}    Run Keyword If                   '${status}' == 'False'                                                                                                                                                                                                                                                                      Create Dictionary    PurposeGuid=${Test_Data['Purpose.PurposeGuid']}    Active=${Test_Data['Purpose.Active']}    Expired=${Test_Data['Purpose.Expired']}    
    @{list}            Create List                      ${dict_purpose}

    Run Keyword If    '${Test_Data['Purpose.PurposeGuid']}'!='empty' and '${Test_Data['Purpose.PurposeGuid']}'!='None' and '${Test_Data['Purpose.Active']}'!='empty' and '${Test_Data['Purpose.Active']}'!='None' and '${Test_Data['Purpose.Expired']}'!='empty' and '${Test_Data['Purpose.Expired']}'!='None'    set to dictionary    ${json}    Purpose=${list}

    Log Dictionary     ${json}
    ${json_string}=    evaluate          json.dumps(${json})    json
    log many           ${json_string}
    log                ${json_string}
    [Return]           ${json_string}