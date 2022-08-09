*** Variables ***
#### AUTHORIZATION ####
${token}                                bearer urfuDNrngap1-aidikNl-XfP-vEqGEUkUqFQZB6lUfWTlZV4NkxXtNrPdXZYqt3_Yq6NilJZ--iiYSuVsxsf7Yt-NYynDIBuNGbXNetCl62IlRCfUGKazZwHHOylDwKsq2NHNmByTeVElFZMllT_4JGo73rJmR6LSuWxf15U1yfKzLSc0CY-BQfJf2pU7hCJfAzlA6DYUhKK9PFrypxzcSOlEeKsO-uwRlQOTz-svTL-o_60HimkovOD5oW3K17KOySWvNSYvEJucGGgX5N74witlu-IbaScK8zfq0-FnM0
${Content_Type}                         application/json
${CurrentUtcOffset}                     "+07:00"

#### Web ####
${URL}                                  https://vpdpa.viriyah.co.th/
${BrowserChrome}                        Chrome
${timeout}                              30s

#### Locator Xpath ####
${TXT_USERNAME}                         xpath=//input[@id="txt_username"]
${TXT_PASSWORD}                         xpath=//input[@id="txt_password"]
${CHK_REMEMBER}                         xpath=//div[@id="chkbx_remember"]/div/span[2]
${BTN_LOGIN}                            xpath=//button[@id="btn_login"]

${BTN_MENU}                             xpath=//div[@id="menu-grid"]/div/div/div[2]
${BTN_MENU_SETTING}                     xpath=//span[contains(text(),'Settings')]/../img
${BTN_MENU_MASTER}                      xpath=//span[contains(text(),'Master Data')]/../img
${BTN_Profile}                          xpath=//div[@id="image-user-profile"]/div/div/div/div

${BTN_CLOSE_POPUP}                      xpath=//div[@class="dx-closebutton dx-button dx-button-normal dx-button-mode-text dx-widget dx-button-has-icon"]

#### MENU ###
${MENU_USER}                            xpath=//li[@data-item-id="SETTING_USER"]
${HEADER_MENU_USER}                     xpath=//div[@id="page-wrapper"]//span[contains(text(),'ข้อมูลผู้ใช้งาน')]
${MENU_ROLE}                            xpath=//li[@data-item-id="SETTING_ROLE"]
${HEADER_MENU_ROLE}                     xpath=//div[@id="page-wrapper"]//span[contains(text(),'สิทธิ์การใช้งาน')]

${BTN_ADD}                              xpath=//div[@id="icon-plus"]
${BTN_SAVE}                             xpath=//div[@id="icon-save"]

#### USER ###
${HEADER_ADD_USER}                      xpath=//div[@id="form"]//span[contains(text(),'เพิ่มผู้ใช้งาน')]
${HEADER_EDIT_USER}                     xpath=//div[@id="form"]//span[contains(text(),'แก้ไขผู้ใช้งาน')]
${TXT_TITLE}                            xpath=//div[@id="form"]//div[@title="คำนำหน้า"]
${TXT_FIRSTNAME}                        xpath=//div[@title="ชื่อ"]//input
${TXT_LASTNAME}                         xpath=//div[@title="นามสกุล"]//input
${TXT_BIRTHDATE}                        xpath=//input[@name="BirthDate"]/../div//input
${TXT_EMAIL}                            xpath=//div[@title="อีเมล"]//input
${TXT_CREATEUSERNAME}                   xpath=//div[@title="Username"]/..//input
${TXT_CREATEPASSWORD}                   xpath=//div[@title="รหัสผ่าน"]/..//input
${TXT_CONFIRMPASSWORD}                  xpath=//div[@title="ยืนยันรหัสผ่าน"]/../div//input
${TXT_WORKSTART}                        xpath=//input[@name="WorkStart"]/../div//input
${DDL_STATUS}                           xpath=//input[@name="Status"]/../div
${DDL_DEPARTMENT}                       xpath=//div[@title="แผนก"]/../div
${DDL_POSITION}                         xpath=//input[@name="PositionID"]/../div
${DDL_ROLE}                             xpath=//div[@id="gridContainer"]//input[@class="dx-texteditor-input"]
${BTN_SAVE_ROLEUSER}                    xpath=//div[@id="gridContainer"]/div/div[6]/div[2]//a[1]

#### ROLE ###
${HEADER_ADD_ROLE}                      xpath=//div[@id="form"]//span[contains(text(),'เพิ่มสิทธิ์การใช้งาน')]
${HEADER_EDIT_ROLE}                     xpath=//div[@id="form"]//span[contains(text(),'แก้ไขสิทธิ์การใช้งาน')]
${TXT_ROLE_CODE}                        xpath=//div[@title="รหัสสิทธ์การใช้งาน"]/..//input
${TXT_ROLD_DETAIL}                      xpath=//div[@title="รายละเอียด"]/..//textarea

${BTN_EDIT}                             xpath=//*[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[1]
${BTN_DELETE}                           xpath=//div[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[2]
${BTN_CONFIRM}                          xpath=//span[contains(text(),'ตกลง')]/../../div

#### MASTER ###
${TXT_CONSENT}                          xpath=//span[contains(text(),'Consent')]/../../div[@class="dx-item-content dx-treeview-item-content"]
${TXT_PURPOSE_CATEGORY}                 xpath=//span[contains(text(),'Purpose category')]/../../div[@class="dx-item-content dx-treeview-item-content"]
${TXT_PURPOSE}                          xpath=//span[contains(text(),'Purpose')]/../../div[@class="dx-item-content dx-treeview-item-content"]

#### API ####
${HOST_NAME}                            https://viriyah-pdpa-api.azurewebsites.net
&{API_COLLECTIONPOINT_LIST}             uat=/cms/collection-point/list    sit=/cms/collection-point/list
&{API_COLLECTIONPOINT_INFO}             uat=/cms/collection-point/    sit=/cms/collection-point/
&{API_GENERALCONSENT_LIST}              uat=/cms/general-consent/list    sit=/cms/general-consent/list
&{API_GENERALCONSENT_SUBMIT}            uat=/cms/general-consent/submit    sit=/cms/general-consent/submit
&{API_GENERALCONSENT_INFO}              uat=/cms/general-consent/info    sit=/cms/general-consent/info
&{API_HEALTHCHECK_LIVENESS}             uat=/api/health/liveness    sit=/api/health/liveness
&{API_HEALTHCHECK_READINESS}            uat=/api/health/readiness    sit=/api/health/readiness

#### API ERROR ####
&{API_GENERALCONSENT_LIST_ERROR}        uat=/cms/general-consent/listERROR    sit=/cms/general-consent/listERROR
&{API_GENERALCONSENT_INFO_ERROR}        uat=/cms/general-consent/ERROR    sit=/cms/general-consent/ERROR
&{API_GENERALCONSENT_SUBMIT_ERROR}      uat=/cms/general-consent/submitERROR    sit=/cms/general-consent/submitERROR
&{API_GENERALCONSENT_INFO_ERROR}        uat=/cms/general-consent/infoERROR    sit=/cms/general-consent/infoERROR
&{API_HEALTHCHECK_LIVENESS_ERROR}       uat=/api/health/livenessERROR    sit=/api/health/livenessERROR
&{API_HEALTHCHECK_READINESS_ERROR}      uat=/api/health/readinessERROR    sit=/api/health/readinessERROR

${INVALID}                              Invalid
