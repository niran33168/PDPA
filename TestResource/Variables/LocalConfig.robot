*** Variables ***
#### PATH FILE ####

#### EXCEL ####
${EXCEL_2C2P_PAYMENT}            ./TestResource/DataTest/Excel_Script/PDPA_Script.xlsx
${SHEET_CollectionPointList}     CollectionPointList
${SHEET_GeneralConsentList}      GeneralConsentList
${SHEET_GeneralConsentSubmit}    GeneralConsentSubmit
${SHEET_HealthCheckLiveness}     HealthCheckLiveness
${SHEET_HealthCheckReadiness}    HealthCheckReadiness

#### JSON REQUEST ####
${JSON_CollectionPoint}          ./API_CollectionPoint/CollectionPointList
${JSON_GeneralConsent_List}      ./API_GeneralConsent/GeneralConsentList
${JSON_GeneralConsent_Submit}    ./API_GeneralConsent/GeneralConsentSubmit
