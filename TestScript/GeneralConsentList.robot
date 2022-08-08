*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
GeneralConsent List Success
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_List
   #rowNo        statusCode                 testcaseNo
    2             200                        GC1001_000
    3             200                        GC1001_001
    4             200                        GC1001_002
    5             200                        GC1001_003
    6             200                        GC1001_004
    7             200                        GC1001_005
    8             200                        GC1001_006
    9             200                        GC1001_007
    10            200                        GC1001_008
    11            200                        GC1001_009
    12            200                        GC1001_010

GeneralConsent List Handling
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_List
   #rowNo        statusCode                       testcaseNo
    13            404                        GC1002_200
    14            500                        GC1002_101

GeneralConsent List Missing
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_List
   #rowNo        statusCode                       testcaseNo
    15            401                        GC1004_400
    16            400                        GC1004_401
    17            400                        GC1004_402
    18            500                        GC1004_403
    19            500                        GC1004_404
    20            500                        GC1004_405
    21            500                        GC1004_406
    22            500                        GC1004_407
    23            500                        GC1004_408
    24            200                        GC1004_409
    25            200                        GC1004_410
    26            200                        GC1004_411
    27            200                        GC1004_412
    28            200                        GC1004_413
    29            200                        GC1004_414
    30            200                        GC1004_415

GeneralConsent List Empty value
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_List
   #rowNo        statusCode                       testcaseNo
    31            401                        GC1005_500
    32            200                        GC1005_501
    33            200                        GC1005_502
    34            200                        GC1005_503
    35            200                        GC1005_504
    36            200                        GC1005_505
    37            200                        GC1005_506
    38            200                        GC1005_507
    39            200                        GC1005_508
    40            200                        GC1005_509
    41            200                        GC1005_510
    42            200                        GC1005_511
    43            200                        GC1005_512
    44            200                        GC1005_513
    45            200                        GC1005_514
    46            200                        GC1005_515

GeneralConsent List Invalid
    [Setup]       Run Keywords               Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                        Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_List
   #rowNo        statusCode                       testcaseNo
    47            500                        GC1006_800
    48            200                        GC1006_801
    49            200                        GC1006_802
    50            500                        GC1006_803
    51            500                        GC1006_804
    52            500                        GC1006_805
    53            500                        GC1006_806
    54            500                        GC1006_807
    55            200                        GC1006_808
    56            200                        GC1006_809
    57            200                        GC1006_810
    59            200                        GC1006_811
    60            200                        GC1006_812
    61            200                        GC1006_813
    62            200                        GC1006_814