*** Variables ***
#### AUTHORIZATION ####
${token}               bearer urfuDNrngap1-aidikNl-XfP-vEqGEUkUqFQZB6lUfWTlZV4NkxXtNrPdXZYqt3_Yq6NilJZ--iiYSuVsxsf7Yt-NYynDIBuNGbXNetCl62IlRCfUGKazZwHHOylDwKsq2NHNmByTeVElFZMllT_4JGo73rJmR6LSuWxf15U1yfKzLSc0CY-BQfJf2pU7hCJfAzlA6DYUhKK9PFrypxzcSOlEeKsO-uwRlQOTz-svTL-o_60HimkovOD5oW3K17KOySWvNSYvEJucGGgX5N74witlu-IbaScK8zfq0-FnM0
${Content_Type}        application/json
${CurrentUtcOffset}    "+07:00"

#### Web ####
${URL}              https://vpdpa.viriyah.co.th/
${BrowserChrome}    Chrome
${timeout}          5s

#### Locator Xpath ####
${TXT_USERNAME}    xpath=//input[@id="txt_username"]
${TXT_PASSWORD}    xpath=//input[@id="txt_password"]
${CHK_REMEMBER}    xpath=//div[@id="chkbx_remember"]/div/span[2]
${BTN_LOGIN}       xpath=//button[@id="btn_login"]

#### API ####
${HOST_NAME}                    https://viriyah-pdpa-api.azurewebsites.net
&{API_COLLECTIONPOINT_LIST}     uat=/cms/collection-point/list                sit=/cms/collection-point/list
&{API_COLLECTIONPOINT_INFO}     uat=/cms/collection-point/                    sit=/cms/collection-point/
&{API_GENERALCONSENT_LIST}      uat=/cms/general-consent/list                 sit=/cms/general-consent/list
&{API_GENERALCONSENT_SUBMIT}    uat=/cms/general-consent/submit               sit=/cms/general-consent/submit
&{API_GENERALCONSENT_INFO}      uat=/cms/general-consent/info                 sit=/cms/general-consent/info
&{API_HEALTHCHECK_LIVENESS}     uat=/api/health/liveness                      sit=/api/health/liveness
&{API_HEALTHCHECK_READINESS}    uat=/api/health/readiness                     sit=/api/health/readiness

#### API ERROR ####
&{API_GENERALCONSENT_LIST_ERROR}      uat=/cms/general-consent/listERROR      sit=/cms/general-consent/listERROR
&{API_GENERALCONSENT_INFO_ERROR}      uat=/cms/general-consent/ERROR          sit=/cms/general-consent/ERROR
&{API_GENERALCONSENT_SUBMIT_ERROR}    uat=/cms/general-consent/submitERROR    sit=/cms/general-consent/submitERROR
&{API_GENERALCONSENT_INFO_ERROR}      uat=/cms/general-consent/infoERROR      sit=/cms/general-consent/infoERROR
&{API_HEALTHCHECK_LIVENESS_ERROR}     uat=/api/health/livenessERROR           sit=/api/health/livenessERROR
&{API_HEALTHCHECK_READINESS_ERROR}    uat=/api/health/readinessERROR          sit=/api/health/readinessERROR

${INVALID}    Invalid