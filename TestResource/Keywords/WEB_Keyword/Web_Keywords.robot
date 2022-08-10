*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
PDPAManagement
    [Arguments]       ${rowNo}               ${statusCode}         ${testcaseName}
    ${data_test}      Read_Excel_For_Test    ${EXCEL_NAME}         ${SHEET_NAME}              ${rowNo}
    Run Keyword If    ${rowNo} < 5           Setting_User          ${data_test}
    ...               ELSE IF                4 < ${rowNo} < 8      Setting_Role               ${data_test}
    ...               ELSE IF                7 < ${rowNo} < 11     Master_Purpose_Category    ${data_test}    
    ...               ELSE IF                10 < ${rowNo} < 14    Master_Purpose             ${data_test}    
    ...               ELSE IF                13 < ${rowNo} < 17    Cookie_Concent             ${data_test}    
    ...               ELSE IF                21 < ${rowNo}         Cookie_Scanner             ${data_test}    

OpenWebPdpa
    [Arguments]                ${URL}    ${Browser}
    Open Browser               ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed         0.5s

InputValue
    [Arguments]                      ${locator}    ${value}      ${timeout}=none
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text                       ${locator}    ${value}

InputUserName
    [Arguments]    ${locator}    ${value_user}
    InputValue     ${locator}    ${value_user}

InputPassword
    [Arguments]    ${locator}    ${value_pass}
    InputValue     ${locator}    ${value_pass}

WaitAndClick
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element                    ${locator}

Login_PDPA_Management
    [Arguments]       ${data_test}
    OpenWebPdpa       ${URL}                                  ${BrowserChrome}
    InputUserName     ${TXT_USERNAME}                         ${data_test['username']}    
    InputPassword     ${TXT_PASSWORD}                         ${data_test['password']}
    Run Keyword If    '${data_test['remenber']}' == 'True'    WaitAndClick                ${CHK_REMEMBER}    ELSE    Log    False
    WaitAndClick      ${BTN_LOGIN}

Select_Menu
    Wait Until Element Is Visible    ${BTN_Profile}    ${timeout}
    WaitAndClick                     ${BTN_MENU}
    sleep                            2s

Select_Menu_Setting
    Select_Menu
    WaitAndClick    ${MENU_SETTING}

Select_Menu_Master
    [Arguments]           ${menu}                                                                                         ${data_test}
    Select_Menu
    Execute JavaScript    document.querySelector("#scrollviewPlan > div.dx-scrollable-wrapper > div").scrollTo(0,600);
    WaitAndClick          ${MENU_MASTER}
    WaitAndClick          ${MENU_CONSENT}
    WaitAndClick          ${MENU_SUB_CONSENT}
    Run Keyword If        '${menu}'=='purposecategory'                                                                    SubMenu_PurposeCategory    ${data_test}    ELSE    SubMenu_Purpose    ${data_test}    

Select_Menu_Consent
    [Arguments]       ${menu}                       ${data_test}
    Select_Menu
    WaitAndClick      ${MENU_MAIN_CONSENT}
    Run Keyword If    '${menu}'=='CookieConsent'    MenuCookieConsent    ${data_test}
    ...               ELSE IF                       '${menu}'=='CookieScanner'    MenuCookieScanner    ${data_test}

MenuCookieConsent
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_COOKIE_CONSENT}
    Wait Until Element Is Visible    ${HEADER_MENU_COOKIE}              ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddCookie                           ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    EditCookie      ${data_test}
    ...                              ELSE                               DeleteCookie

MenuCookieScanner
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_COOKIE_SCANNER}
    Wait Until Element Is Visible    ${HEADER_MENU_COOKIE_SCANNER}         ${timeout}
    InputValue                       xpath=//span[@id="txtfind"]//input    ${data_test['cookie.website']}
    WaitAndClick                     xpath=//span[@id="btnScan"]

SubMenu_User
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_USER}
    Wait Until Element Is Visible    ${HEADER_MENU_USER}                ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddUser                             ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    EditUser        ${data_test}
    ...                              ELSE                               DeleteUser

SubMenu_Role
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_ROLE}
    Wait Until Element Is Visible    ${HEADER_MENU_ROLE}                ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddRole                             ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    EditRole        ${data_test}
    ...                              ELSE                               DeleteRole

SubMenu_PurposeCategory
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_PURPOSE_CATEGORY}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}    ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddPurposeCategory                  ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    UpdatePurposeCategory    ${data_test}
    ...                              ELSE                               DeletePurposeCategory               ${data_test}

SubMenu_Purpose
    [Arguments]                      ${data_test}
    WaitAndClick                     ${MENU_PURPOSE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}             ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddPurpose                          ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    UpdatePurpose    ${data_test}
    ...                              ELSE                               DeletePurpose                       ${data_test}

AddUser
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_ADD_USER}                                                                                                     ${timeout}
    WaitAndClick                     ${TXT_TITLE}
    WaitAndClick                     xpath=//div[@class="dx-scrollable-container"]//div[@class="dx-item dx-list-item"][3]
    InputValue                       ${TXT_FIRSTNAME}                                                                                                       ${data_test['user.firstname']}
    InputValue                       ${TXT_LASTNAME}                                                                                                        ${data_test['user.lastname']}
    Run Keyword If                   '${data_test['user.gender']}'=='male'                                                                                  Execute JavaScript                      document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(1)").click();
    ...                              ELSE                                                                                                                   Execute JavaScript                      document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(2)").click();
    InputValue                       ${TXT_BIRTHDATE}                                                                                                       ${data_test['user.birthdate']}
    InputValue                       ${TXT_EMAIL}                                                                                                           ${data_test['user.email']}
    InputValue                       ${TXT_CREATEUSERNAME}                                                                                                  ${data_test['user.username']}
    InputValue                       ${TXT_CREATEPASSWORD}                                                                                                  ${data_test['user.password']}
    InputValue                       ${TXT_CONFIRMPASSWORD}                                                                                                 ${data_test['user.confirmpassword']}
    WaitAndClick                     ${DDL_STATUS}
    Run Keyword If                   '${data_test['user.status']}'=='open'                                                                                  WaitAndClick                            xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'เปิดใช้งาน')]
    ...                              ELSE                                                                                                                   WaitAndClick                            xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ปิดใช้งาน')]
    WaitAndClick                     ${DDL_DEPARTMENT}
    Run Keyword If                   '${data_test['user.department']}'=='IT'                                                                                WaitAndClick                            xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'IT-001 : แผนก IT')]
    ...                              ELSE                                                                                                                   WaitAndClick                            xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ฝ่ายรับประกันภัย : ฝ่ายรับประกันภัย')]
    WaitAndClick                     ${DDL_POSITION}
    WaitAndClick                     xpath=//div[@class="dx-item dx-list-item"]/div[contains(text(),'ADMIN : Administrator')]
    InputValue                       ${TXT_WORKSTART}                                                                                                       ${data_test['user.workstart']}
    WaitAndClick                     xpath=//div[@id="gridContainer"]//div[@class="dx-item-content dx-toolbar-item-content"]
    WaitAndClick                     ${DDL_ROLE}
    WaitAndClick                     xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ROLE-002 : สำหรับผู้ดูแลระบบ viriyah')]
    WaitAndClick                     ${BTN_SAVE_ROLEUSER}
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_USER}                                                                                                           ${timeout}

EditUser
    [Arguments]                      ${data_test}
    WaitAndClick                     xpath=//*[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[6]/td[1]/a[2]
    Wait Until Element Is Visible    ${HEADER_EDIT_USER}                                                              ${timeout}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_USER}                                                                     ${timeout}

DeleteUser

AddRole
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_ADD_ROLE}                           ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                             ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                           ${data_test['role.details']}
    WaitAndClick                     ${BTN_STATUS}
    WaitAndClick                     xpath=//tbody/tr[26]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CANCEL}
    WaitAndClick                     xpath=//tbody/tr[35]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CANCEL}
    Wait Until Element Is Visible    ${BTN_SAVE}                                  ${timeout}
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                                 ${timeout}

EditRole
    [Arguments]                      ${data_test}
    InputValue                       ${TXT_SEARCH}                                AD001
    WaitAndClick                     ${BTN_EDIT}
    Wait Until Element Is Visible    ${HEADER_EDIT_ROLE}                          ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                             ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                           ${data_test['role.details']}
    WaitAndClick                     xpath=//tbody/tr[26]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CANCEL}
    WaitAndClick                     xpath=//tbody/tr[35]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CANCEL}
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                                 ${timeout}

DeleteRole
    InputValue      ${TXT_SEARCH}     AD900
    WaitAndClick    ${BTN_DELETE}
    WaitAndClick    ${BTN_CONFIRM}

Setting_User
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Setting
    SubMenu_User             ${data_test}

AddPurposeCategory
    [Arguments]                      ${data_test}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}        ${timeout}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_MENU_ADD_PURPOSE_CATEGORY}    ${timeout}
    InputValue                       ${TXT_PURPOSE_CATEGORY_CODE}           ${data_test['purposecategory.categorycode']}
    InputValue                       ${TXT_PURPOSE_CATEGORY_DESCRIPTION}    ${data_test['purposecategory.details']}
    WaitAndClick                     ${BTN_STATUS}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}        ${timeout}

UpdatePurposeCategory
    [Arguments]                      ${data_test}
    InputValue                       ${TXT_SEARCH_ENG}                         Category01
    WaitAndClick                     ${BTN_EDIT}
    Wait Until Element Is Visible    ${HEADER_MENU_UPDATE_PURPOSE_CATEGORY}    ${timeout}
    InputValue                       ${TXT_PURPOSE_CATEGORY_CODE}              ${data_test['purposecategory.categorycode']}
    InputValue                       ${TXT_PURPOSE_CATEGORY_DESCRIPTION}       ${data_test['purposecategory.details']}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}           ${timeout}                                      

DeletePurposeCategory
    [Arguments]                      ${data_test}
    InputValue                       ${TXT_SEARCH_ENG}                  ${data_test['purposecategory.categorycode']}
    WaitAndClick                     ${BTN_DELETE}
    WaitAndClick                     ${BTN_CONFIRM_YES}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}    ${timeout}                                      

AddPurpose
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_MENU_ADD_PURPOSE}                            ${timeout}
    WaitAndClick                     ${DDL_PURPOSE_TYPE}
    Run Keyword If                   '${data_test['purpose.purposetype']}'=='Consent'      WaitAndClick                      xpath=//div[contains(text(),'Consent')]
    ...                              ELSE                                                  WaitAndClick                      xpath=//div[contains(text(),'Cookie')]
    WaitAndClick                     ${DDL_PURPOSE_CATEGORY}
    WaitAndClick                     xpath=//div[@class="dx-item dx-list-item"][5]//div
    InputValue                       ${TXT_PURPOSE_CODE}                                   ${data_test['purpose.code']}
    InputValue                       ${TXT_PURPOSE_DESCRIPTION}                            ${data_test['purpose.detail']}
    Execute JavaScript               window.scrollTo(0, 600);
    WaitAndClick                     ${BTN_STATUS}
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}                                ${timeout}

UpdatePurpose
    [Arguments]                      ${data_test}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}        ${timeout}
    InputValue                       ${TXT_SEARCH_ENG}             Con01
    WaitAndClick                     ${BTN_EDIT}
    InputValue                       ${TXT_PURPOSE_CODE}           ${data_test['purpose.code']}
    InputValue                       ${TXT_PURPOSE_DESCRIPTION}    ${data_test['purpose.detail']}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}        ${timeout}                        

DeletePurpose
    [Arguments]                      ${data_test}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}    ${timeout}
    InputValue                       ${TXT_SEARCH_ENG}         ${data_test['purpose.code']}
    WaitAndClick                     ${BTN_DELETE}
    WaitAndClick                     ${BTN_CONFIRM_YES}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}    ${timeout}                      

AddCookie
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_MENU_ADD_COOKIE}                                                           ${timeout}
    WaitAndClick                     xpath=//input[@name="WebsiteID"]/..//div[@class="dx-texteditor-input-container"]
    WaitAndClick                     xpath=//div[contains(text(),'${data_test['cookie.website']}')]                      
    InputValue                       xpath=//textarea[@name="Message"]                                                   ${data_test['cookie.footermessage']}
    InputValue                       xpath=//textarea[@name="PopupMessage"]                                              ${data_test['cookie.popupmessage']}
    WaitAndClick                     xpath=//table/tbody/tr[4]/td[3]/../td[1]/div
    WaitAndClick                     xpath=//table/tbody/tr[5]/td[3]/../td[1]/div
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_COOKIE}                                                               ${timeout}

EditCookie
    [Arguments]                      ${data_test}
    InputValue                       ${TXT_SEARCH_ENG}                         รายละเอียด
    WaitAndClick                     ${BTN_EDIT}
    Wait Until Element Is Visible    ${HEADER_MENU_UPDATE_COOKIE}              ${timeout}
    InputValue                       xpath=//textarea[@name="Message"]         ${data_test['cookie.footermessage']}
    InputValue                       xpath=//textarea[@name="PopupMessage"]    ${data_test['cookie.popupmessage']}
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_COOKIE}                     ${timeout}

DeleteCookie
    InputValue                       ${TXT_SEARCH_ENG}                              แก้ไข รายละเอียด
    WaitAndClick                     xpath=//div[2]/table/tbody/tr[1]/td[1]/a[3]
    WaitAndClick                     ${BTN_CONFIRM_YES}
    Wait Until Element Is Visible    ${HEADER_MENU_COOKIE}                          ${timeout}          

Setting_Role
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Setting
    SubMenu_Role             ${data_test}
    Close All Browsers

Master_Purpose_Category
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_MASTER       purposecategory    ${data_test}
    Close All Browsers

Master_Purpose
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_MASTER       purpose         ${data_test}
    Close All Browsers

Cookie_Concent
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Consent      CookieConsent    ${data_test}
    Close All Browsers

Cookie_Scanner
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Consent      CookieScanner    ${data_test}
    Close All Browsers
