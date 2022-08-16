*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
API Submit general consent Case insert
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    2             204                          GC1001_000
    3             204                          GC1001_001
    4             204                          GC1001_002
    5             204                          GC1001_003
    6             204                          GC1001_004
    7             204                          GC1001_005
    8             204                          GC1001_006

API Submit general consent Case Update
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    9             204                          GC1002_000
    10            204                          GC1002_001
    11            204                          GC1002_002
    12            204                          GC1002_003
    13            204                          GC1002_004
    14            204                          GC1002_005
    15            204                          GC1002_006

Submit general consent Case error from Handling error
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    16            404                          GC1003_200
    17            500                          GC1003_201

Submit general consent Business Case
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    18            204                          GC1004_400
    19            500                          GC1004_401
    20            500                          GC1004_402
    21            500                          GC1004_403
    22            500                          GC1004_404

Submit general consent Missing value
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    23            401                          GC1005_500
    24            400                          GC1005_501
    25            400                          GC1005_502
    26            204                          GC1005_503
    27            500                          GC1005_504
    28            500                          GC1005_505
    29            204                          GC1005_506
    30            204                          GC1005_507
    31            500                          GC1005_508
    32            500                          GC1005_509
    33            500                          GC1005_510
    34            500                          GC1005_511
    35            204                          GC1005_512
    36            500                          GC1005_513
    37            500                          GC1005_514
    38            500                          GC1005_515
    39            204                          GC1005_516
    40            204                          GC1005_517
    41            204                          GC1005_518
    42            500                          GC1005_519
    43            204                          GC1005_520
    44            204                          GC1005_521
    45            204                          GC1005_522
    46            204                          GC1005_523

Submit general consent Empty value
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    47            401                          GC1006_600
    48            204                          GC1006_601
    49            204                          GC1006_602
    50            204                          GC1006_603
    51            500                          GC1006_604
    52            500                          GC1006_605
    53            204                          GC1006_606
    54            204                          GC1006_607
    55            204                          GC1006_608
    56            204                          GC1006_609
    57            204                          GC1006_610
    58            500                          GC1006_611
    59            204                          GC1006_612
    60            204                          GC1006_613
    61            204                          GC1006_614
    62            204                          GC1006_615
    63            204                          GC1006_616
    64            204                          GC1006_617
    65            204                          GC1006_618
    66            500                          GC1006_619
    67            204                          GC1006_620
    68            204                          GC1006_621
    69            204                          GC1006_622
    70            204                          GC1006_623

Submit general consent Invalid value
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_PDPA}  
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    71            401                          GC1008_000
    72            204                          GC1008_001
    73            204                          GC1008_002
    74            204                          GC1008_003
    75            500                          GC1008_004
    76            500                          GC1008_005
    77            204                          GC1008_006
    78            204                          GC1008_007
    79            204                          GC1008_008
    80            204                          GC1008_009
    81            204                          GC1008_010
    82            204                          GC1008_011
    83            204                          GC1008_012
    84            204                          GC1008_013
    85            204                          GC1008_014
    86            204                          GC1008_015
    87            204                          GC1008_016
    88            204                          GC1008_017
    89            204                          GC1008_018
    90            500                          GC1008_019
    91            204                          GC1008_020
    92            204                          GC1008_021
    93            204                          GC1008_022
    94            204                          GC1008_023