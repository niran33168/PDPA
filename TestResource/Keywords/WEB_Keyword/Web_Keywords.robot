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

OpenWebPdpa
    [Arguments]                ${URL}    ${Browser}
    Open Browser               ${URL}    ${Browser}
    Maximize Browser Window

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
    [Arguments]       ${menu}
    Select_Menu
    WaitAndClick      ${MENU_MASTER}
    WaitAndClick      ${MENU_CONSENT}
    Run Keyword If    '${menu}'=='purposecategory'    SubMenu_PurposeCategory    ELSE    SubMenu_Purpose    

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
    WaitAndClick                     ${MENU_PURPOSE_CATEGORY}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}    ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddPurposeCategory                  ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    UpdatePurposeCategory    ${data_test}
    ...                              ELSE                               DeleteAddPurposeCategory

SubMenu_Purpose
    WaitAndClick                     ${MENU_PURPOSE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE}             ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddPurpose                          ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    UpdatePurpose    ${data_test}
    ...                              ELSE                               DeleteAddPurpose

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
    Wait Until Element Is Visible    ${HEADER_ADD_ROLE}                                                                          ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                                                                            ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                                                                          ${data_test['role.details']}
    WaitAndClick                     ${BTN_STATUS}
    WaitAndClick                     xpath=//*[@id="gridContainer"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div
    WaitAndClick                     xpath=//tbody/tr[26]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CLOSE_POPUP}
    WaitAndClick                     xpath=//tbody/tr[35]//a[@title="Approve"]
    WaitAndClick                     xpath=//div[@id="btnCancel"]
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                                                                                ${timeout}

EditRole
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_EDIT}
    Wait Until Element Is Visible    ${HEADER_EDIT_ROLE}                          ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                             ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                           ${data_test['role.details']}
    WaitAndClick                     xpath=//tbody/tr[26]//a[@title="Approve"]
    WaitAndClick                     ${BTN_CLOSE_POPUP}
    WaitAndClick                     xpath=//tbody/tr[35]//a[@title="Approve"]
    WaitAndClick                     xpath=//div[@id="btnCancel"]
    Sleep                            5s
    Execute JavaScript               window.scrollTo(0, 0);
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                                 ${timeout}

DeleteRole
    WaitAndClick    ${BTN_DELETE}
    WaitAndClick    ${BTN_CONFIRM}

Setting_User
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Setting
    SubMenu_User             ${data_test}

AddPurposeCategory
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_MENU_ADD_PURPOSE_CATEGORY}    ${timeout}
    InputValue                       ${TXT_PURPOSE_CATEGORY_CODE}           ${data_test['purposecategory.categorycode']}
    InputValue                       ${TXT_PURPOSE_CATEGORY_DESCRIPTION}    ${data_test['purposecategory.details']}
    WaitAndClick                     ${BTN_STATUS}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}        ${timeout}

AddPurpose
    [Arguments]                      ${data_test}
    WaitAndClick                     ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_MENU_ADD_PURPOSE}                          ${timeout}
    WaitAndClick                     ${DDL_PURPOSE_TYPE}
    Run Keyword If                   '${data_test['purpose.purposetype']}'=='Consent'    WaitAndClick                            xpath=//div[contains(text(),'Consent')]
    ...                              ELSE                                                WaitAndClick                            xpath=//div[contains(text(),'Cookie')]
    WaitAndClick                     ${DDL_PURPOSE_CATEGORY}   
    InputValue                       ${TXT_PURPOSE_CODE}                                 ${data_test['purpose.categorycode']}
    InputValue                       ${TXT_PURPOSE_DESCRIPTION}                          ${data_test['purpose.details']}
    WaitAndClick                     ${BTN_STATUS}
    WaitAndClick                     ${BTN_SAVE}
    Wait Until Element Is Visible    ${HEADER_MENU_PURPOSE_CATEGORY}                     ${timeout}

Setting_Role
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_Setting
    SubMenu_Role             ${data_test}

Master_Purpose_Category
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_MASTER       purposecategory    

Master_Purpose
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_MASTER       purpose
