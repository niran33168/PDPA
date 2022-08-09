*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
PDPAManagement
    [Arguments]       ${rowNo}               ${statusCode}              ${testcaseName}
    ${data_test}      Read_Excel_For_Test    ${EXCEL_NAME}              ${SHEET_NAME}      ${rowNo}
    Run Keyword If    ${rowNo} < 5           Setting_User    ${data_test}
    ...    ELSE IF    4 < ${rowNo} < 8    Setting_Role    ${data_test}    

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

Login_PDPA_Management
    [Arguments]       ${data_test}
    OpenWebPdpa       ${URL}                                  ${BrowserChrome}
    InputUserName     ${TXT_USERNAME}                         ${data_test['username']}    
    InputPassword     ${TXT_PASSWORD}                         ${data_test['password']}
    Run Keyword If    '${data_test['remenber']}' == 'True'    Click Element               ${CHK_REMEMBER}    ELSE    Log    False
    Click Element     ${BTN_LOGIN}

Select_Menu_setting
    Wait Until Element Is Visible    ${BTN_Profile}         ${timeout}
    Click Element                    ${BTN_MENU}
    sleep     2s
    Wait Until Element Is Visible    ${BTN_MENU_SETTING}    ${timeout}
    Click Element                    ${BTN_MENU_SETTING}

SubMenu_User
    [Arguments]                      ${data_test}
    Wait Until Element Is Visible    ${MENU_USER}                       ${timeout}
    Click Element                    ${MENU_USER}
    Wait Until Element Is Visible    ${HEADER_MENU_USER}                ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddUser                             ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    EditUser        ${data_test}
    ...                              ELSE                               DeleteUser

SubMenu_Role
    [Arguments]                      ${data_test}
    Wait Until Element Is Visible    ${MENU_ROLE}                       ${timeout}
    Click Element                    ${MENU_ROLE}
    Wait Until Element Is Visible    ${HEADER_MENU_ROLE}                ${timeout}
    Run Keyword If                   '${data_test['method']}'=='add'    AddRole                             ${data_test}
    ...                              ELSE IF                            '${data_test['method']}'=='edit'    EditRole        ${data_test}
    ...                              ELSE                               DeleteRole

AddUser
    [Arguments]                      ${data_test}
    Click Element                    ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_ADD_USER}                                                                                     ${timeout}
    Click Element                    ${TXT_TITLE}
    Click Element                    xpath=//div[@class="dx-scrollable-container"]//div[@class="dx-item dx-list-item"][3]
    InputValue                       ${TXT_FIRSTNAME}                                                                                       ${data_test['user.firstname']}
    InputValue                       ${TXT_LASTNAME}                                                                                        ${data_test['user.lastname']}
    Run Keyword If                   '${data_test['user.gender']}'=='male'                                                                  Execute JavaScript                      document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(1)").click();
    ...                              ELSE                                                                                                   Execute JavaScript                      document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(2)").click();
    InputValue                       ${TXT_BIRTHDATE}                                                                                       ${data_test['user.birthdate']}
    InputValue                       ${TXT_EMAIL}                                                                                           ${data_test['user.email']}
    InputValue                       ${TXT_CREATEUSERNAME}                                                                                        ${data_test['user.username']}
    InputValue                       ${TXT_CREATEPASSWORD}                                                                                        ${data_test['user.password']}
    InputValue                       ${TXT_CONFIRMPASSWORD}                                                                                 ${data_test['user.confirmpassword']}
    Click Element                    ${DDL_STATUS}
    Run Keyword If                   '${data_test['user.status']}'=='open'                                                                  Click Element                           xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'เปิดใช้งาน')]
    ...                              ELSE                                                                                                   Click Element                           xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ปิดใช้งาน')]
    Click Element                    ${DDL_DEPARTMENT}
    Run Keyword If                   '${data_test['user.department']}'=='IT'                                                                Click Element                           xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'IT-001 : แผนก IT')]
    ...                              ELSE                                                                                                   Click Element                           xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ฝ่ายรับประกันภัย : ฝ่ายรับประกันภัย')]
    Click Element                    ${DDL_POSITION}
    Click Element                    xpath=//div[@class="dx-item dx-list-item"]/div[contains(text(),'ADMIN : Administrator')]
    InputValue                       ${TXT_WORKSTART}    ${data_test['user.workstart']}
    Click Element                    xpath=//div[@id="gridContainer"]//div[@class="dx-item-content dx-toolbar-item-content"]
    Click Element                    ${DDL_ROLE}
    Click Element                    xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ROLE-002 : สำหรับผู้ดูแลระบบ viriyah')]
    Click Element                    xpath=//div[@id="gridContainer"]/div/div[6]/div[2]//a[1]
    Execute JavaScript    window.scrollTo(0, 0);
    Click Element                    ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_USER}                       ${timeout}
    Close Browser

EditUser
    [Arguments]    ${data_test}

DeleteUser
    
AddRole
    [Arguments]    ${data_test}
    Click Element                    ${BTN_ADD}
    Wait Until Element Is Visible    ${HEADER_ADD_ROLE}                                                                                     ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                                                                                       ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                                                                                       ${data_test['role.details']}
    Click Element                    xpath=//*[@id="form"]/div/div/div/div/div/div/div/div/div/div/div/div/div[3]/div/div/div/div
    Wait Until Element Is Visible    xpath=//*[@id="gridContainer"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div     ${timeout}
    Click Element                    xpath=//*[@id="gridContainer"]/div/div[6]/div/div/div[1]/div/table/tbody/tr[1]/td[3]/div
    Click Element                    xpath=//tbody/tr[26]//a[@title="Approve"]
    Wait Until Element Is Visible    ${BTN_CLOSE_POPUP}     ${timeout}
    Click Element                    ${BTN_CLOSE_POPUP}
    Click Element                    xpath=//tbody/tr[35]//a[@title="Approve"]
    Wait Until Element Is Visible    xpath=//div[@id="btnCancel"]     ${timeout}
    Click Element                    xpath=//div[@id="btnCancel"]
    Execute JavaScript    window.scrollTo(0, 0);
    Wait Until Element Is Visible    ${BTN_SAVE}     ${timeout}
    Click Element                    ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                       ${timeout}
    Close Browser

EditRole
    [Arguments]    ${data_test}
    Wait Until Element Is Visible    xpath=//*[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[1]                       ${timeout}
    Click Element                    xpath=//*[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[1]
    Wait Until Element Is Visible    ${HEADER_EDIT_ROLE}                                                                                     ${timeout}
    InputValue                       ${TXT_ROLE_CODE}                                                                                       ${data_test['role.code']}
    InputValue                       ${TXT_ROLD_DETAIL}                                                                                       ${data_test['role.details']}
    Wait Until Element Is Visible    xpath=//tbody/tr[26]//a[@title="Approve"]     ${timeout}
    Click Element                    xpath=//tbody/tr[26]//a[@title="Approve"]
    Wait Until Element Is Visible    ${BTN_CLOSE_POPUP}     ${timeout}
    Click Element                    ${BTN_CLOSE_POPUP}
    Click Element                    xpath=//tbody/tr[35]//a[@title="Approve"]
    Wait Until Element Is Visible    xpath=//div[@id="btnCancel"]     ${timeout}
    Click Element                    xpath=//div[@id="btnCancel"]
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, 0);
    Wait Until Element Is Visible    ${BTN_SAVE}     ${timeout}
    Click Element                    ${BTN_SAVE}
    Wait Until Element Is Visible    ${MENU_ROLE}                       ${timeout}
    Close Browser

DeleteRole
    Wait Until Element Is Visible    xpath=//div[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[2]                       ${timeout}
    Click Element                    xpath=//div[@id="gridContainer"]/div/div[6]/div[2]/table/tbody/tr[1]/td[1]/a[2]
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ตกลง')]/../../div                       ${timeout}
    Click Element                    xpath=//span[contains(text(),'ตกลง')]/../../div
    Close Browser

Setting_User
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_setting
    SubMenu_User             ${data_test}

Setting_Role
    [Arguments]              ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_setting
    SubMenu_Role             ${data_test}
