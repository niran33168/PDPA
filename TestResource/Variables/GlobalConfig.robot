*** Variables ***
#### AUTHORIZATION ####
${token}    bearer 0CktjiNAS3gzU2r47fNTwIw6Rx4d_iqaeOMWXwtn52YPGQKR270KRONZ5fpBUYG7cokhhuD_J5oPYL42_PXtm6UcPPaFvXoyVwReaqt6c7Zj3_oAUm30pPQweZTzzAqEc6SXUIdnsUcFRXpBXnX5nG1ffFnar2vJSovElso6XQnDmltYYJqNzN9D2VyV4yHpVa66SggCJ-xLPmVMa04DpUAIV7zaqVW0nJ7UvEua1cCPLDSian_7n12yyyDi50sLM-Mzgoi3VdUG0jztf_IL0QyoPhd4WKgSqsZJkrHzDFI

#### Web ####


#### API ####
${HOST_NAME}                    https://viriyah-pdpa-api.azurewebsites.net
&{API_COLLECTIONPOINT_LIST}     uat=/cms/collection-point/list                sit=/cms/collection-point/list
&{API_GENERALCONSENT_LIST}      uat=/cms/general-consent/list                 sit=/cms/general-consent/list
&{API_GENERALCONSENT_SUBMIT}    uat=/cms/general-consent/submit               sit=/cms/general-consent/submit
&{API_HEALTHCHECK_LIVENESS}     uat=/api/health/liveness                      sit=/api/health/liveness
&{API_HEALTHCHECK_READINESS}    uat=/api/health/readiness                     sit=/api/health/readiness

#### API ERROR ####
&{API_GENERALCONSENT_LIST_ERROR}      uat=/cms/general-consent/listAA      sit=/cms/general-consent/listAA
&{API_GENERALCONSENT_SUBMIT_ERROR}    uat=/cms/general-consent/submitAA    sit=/cms/general-consent/submitAA
&{API_HEALTHCHECK_LIVENESS_ERROR}     uat=/api/health/livenessAA           sit=/api/health/livenessAA
&{API_HEALTHCHECK_READINESS_ERROR}    uat=/api/health/readinessAA          sit=/api/health/readinessAA

${INVALID}    Invalid