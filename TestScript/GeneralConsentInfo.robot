*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
GeneralConsent Info Success
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    2             200                        GI1001_000
    3             200                        GI1001_001
    4             200                        GI1001_002
    5             200                        GI1001_003
    6             200                        GI1001_004
    7             200                        GI1001_005

GeneralConsent Info Handling
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    8             404                        GC1002_200
    9             500                        GC1002_201

GeneralConsent Info Missing
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    10            401                        GC1004_400
    11            400                        GC1004_401
    12            400                        GC1004_402
    13            500                        GC1004_403
    14            500                        GC1004_404
    15            500                        GC1004_405
    16            500                        GC1004_406
    17            500                        GC1004_407

GeneralConsent Info Empty value
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    18            401                        GC1005_600
    19            200                        GC1005_601
    20            200                        GC1005_602
    21            200                        GC1005_603
    22            200                        GC1005_604
    23            200                        GC1005_605
    24            200                        GC1005_606
    25            200                        GC1005_607

GeneralConsent Info Invalid
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentInfo}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Info
   #rowNo        statusCode                       testcaseNo
    26            401                        GC1006_800
    27            200                        GC1006_801
    28            200                        GC1006_802
    29            200                        GC1006_803
    30            200                        GC1006_804
    31            200                        GC1006_805
    32            200                        GC1006_806
    33            200                        GC1006_807