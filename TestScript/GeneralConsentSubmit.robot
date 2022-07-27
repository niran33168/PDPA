*** Settings ***
Resource    ../TestResource/Keywords/AllKeywords.txt

*** Test Cases ***
# Submit general consent Case insert
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
#    2             204                          GC1001_000
#    3             204                          GC1001_001
#    4             204                          GC1001_002
#    5             204                          GC1001_003
#    6             204                          GC1001_004
#    7             204                          GC1001_005
#    8             204                          GC1001_006

# API Submit general consent Case Update
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
#    9             204                          GC1002_000
#    10            204                          GC1002_001
#    11            204                          GC1002_002
#    12            204                          GC1002_003
#    13            204                          GC1002_004
#    14            204                          GC1002_005
#    15            204                          GC1002_006

# Submit general consent Case error from Handling error
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
#    16            404                          GC1003_200
#    17            500                          GC1003_201

# Submit general consent Business Case
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
#    18            500                          GC1004_400
#    19            204                          GC1004_401
#    20            204                          GC1004_402
#    21            204                          GC1004_403
#    22            204                          GC1004_404

# Submit general consent Missing value
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
#    23            400                          GC1005_500
#    24            400                          GC1005_501
#    25            400                          GC1005_502
#    26            400                          GC1005_503
#    27            400                          GC1005_504
#    28            400                          GC1005_505
#    29            400                          GC1005_506
#    30            400                          GC1005_507
#    31            400                          GC1005_508
#    32            400                          GC1005_509
#    33            400                          GC1005_510
#    34            400                          GC1005_511
#    35            400                          GC1005_512
#    36            400                          GC1005_513
#    37            400                          GC1005_514
#    38            400                          GC1005_515
#    39            400                          GC1005_516
#    40            400                          GC1005_517
#    41            400                          GC1005_518
#    42            400                          GC1005_519
#    43            400                          GC1005_520
#    44            400                          GC1005_521
#    45            400                          GC1005_522
#    46            400                          GC1005_523

Submit general consent Empty value
    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentSubmit}
    [Teardown]    Close Browser
    [Template]    API_GeneralConsent_Submit
   #rowNo        statusCode                   testcaseNo
    47            401                          GC1006_600
    48            500                          GC1006_601
    49            500                          GC1006_602
    50            500                          GC1006_603
    51            500                          GC1006_604
    52            500                          GC1006_605
    53            500                          GC1006_606
    54            500                          GC1006_607
    55            500                          GC1006_608
    56            500                          GC1006_609
    57            500                          GC1006_610
    58            500                          GC1006_611
    59            500                          GC1006_612
    60            500                          GC1006_613
    61            500                          GC1006_614
    62            500                          GC1006_615
    63            500                          GC1006_616
    64            500                          GC1006_617
    65            500                          GC1006_618
    66            500                          GC1006_619
    67            500                          GC1006_620
    68            500                          GC1006_621
    69            500                          GC1006_622
    70            500                          GC1006_623

# Submit general consent Invalid value
#    [Setup]       Run Keywords                 Set Test Variable    ${EXCEL_NAME}    ${EXCEL_2C2P_PAYMENT}
#    ...           AND                          Set Test Variable    ${SHEET_NAME}    ${SHEET_GeneralConsentList}
#    [Teardown]    Close Browser
#    [Template]    API_GeneralConsent_Submit
#    #rowNo        statusCode                   testcaseNo
