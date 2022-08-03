*** Variables ***
#### AUTHORIZATION ####
${token}               bearer urfuDNrngap1-aidikNl-XfP-vEqGEUkUqFQZB6lUfWTlZV4NkxXtNrPdXZYqt3_Yq6NilJZ--iiYSuVsxsf7Yt-NYynDIBuNGbXNetCl62IlRCfUGKazZwHHOylDwKsq2NHNmByTeVElFZMllT_4JGo73rJmR6LSuWxf15U1yfKzLSc0CY-BQfJf2pU7hCJfAzlA6DYUhKK9PFrypxzcSOlEeKsO-uwRlQOTz-svTL-o_60HimkovOD5oW3K17KOySWvNSYvEJucGGgX5N74witlu-IbaScK8zfq0-FnM0
${Content_Type}        application/json
${CurrentUtcOffset}    "+07:00"

#### Web ####


#### API ####
${HOST_NAME}                    https://viriyah-pdpa-api.azurewebsites.net
&{API_COLLECTIONPOINT_LIST}     uat=/cms/collection-point/list                sit=/cms/collection-point/list
&{API_GENERALCONSENT_LIST}      uat=/cms/general-consent/list                 sit=/cms/general-consent/list
&{API_GENERALCONSENT_SUBMIT}    uat=/cms/general-consent/submit               sit=/cms/general-consent/submit
&{API_GENERALCONSENT_INFO}      uat=/cms/general-consent/info                 sit=/cms/general-consent/info
&{API_HEALTHCHECK_LIVENESS}     uat=/api/health/liveness                      sit=/api/health/liveness
&{API_HEALTHCHECK_READINESS}    uat=/api/health/readiness                     sit=/api/health/readiness

#### API ERROR ####
&{API_GENERALCONSENT_LIST_ERROR}      uat=/cms/general-consent/listAA      sit=/cms/general-consent/listAA
&{API_GENERALCONSENT_SUBMIT_ERROR}    uat=/cms/general-consent/submitAA    sit=/cms/general-consent/submitAA
&{API_GENERALCONSENT_INFO_ERROR}      uat=/cms/general-consent/infoAA      sit=/cms/general-consent/infoAA
&{API_HEALTHCHECK_LIVENESS_ERROR}     uat=/api/health/livenessAA           sit=/api/health/livenessAA
&{API_HEALTHCHECK_READINESS_ERROR}    uat=/api/health/readinessAA          sit=/api/health/readinessAA

${INVALID}    Invalid