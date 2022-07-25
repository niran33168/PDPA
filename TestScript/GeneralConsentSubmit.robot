*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
# Submit general consent Case insert
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo

# API Submit general consent Case Update
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo

Submit general consent Case error from Handling error
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                 testcaseNo
    6             404                          GC1003_200
    7             500                          GC1003_201

# Submit general consent Business Case
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo

Submit general consent Missing
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    13            401                          GC1005_500
    14            400                          GC1005_501
    15            400                          GC1005_502

Submit general consent Empty value
   [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
   ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
   [Teardown]    Close Browser
   [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    37            401                          GC1006_600
    38            400                          GC1006_601
    39            400                          GC1006_602

# Submit general consent Invalid
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
