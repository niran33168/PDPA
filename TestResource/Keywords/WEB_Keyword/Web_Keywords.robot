*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
PDPAManagement
    [Arguments]       ${rowNo}               ${statusCode}              ${testcaseName}
    ${data_test}      Read_Excel_For_Test    ${EXCEL_NAME}              ${SHEET_NAME}      ${rowNo}
    Run Keyword If    ${rowNo} < 5           Setting_PDPA_Management    ${data_test}

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
    OpenWebPdpa           ${URL}                                  ${BrowserChrome}
    InputUserName         ${TXT_USERNAME}                         ${data_test['username']}    
    InputPassword         ${TXT_PASSWORD}                         ${data_test['password']}
    Run Keyword If        '${data_test['remenber']}' == 'True'    Click Element               ${CHK_REMEMBER}    ELSE    Log    False
    Click Element         ${BTN_LOGIN}

Select_Menu_setting
    Wait Until Element Is Visible    ${BTN_Profile}    ${timeout}
    Click Element    ${BTN_MENU}
    Wait Until Element Is Visible    ${BTN_MENU_SETTING}    ${timeout}
    Click Element         ${BTN_MENU_SETTING}

SubMenu_User
    [Arguments]       ${data_test}
    Wait Until Element Is Visible    ${MENU_USER}    ${timeout}
    Click Element         ${MENU_USER}
    Wait Until Element Is Visible    ${HEADER_MENU_USER}    ${timeout}
    Run Keyword If    '${data_test['method']}'=='add'    AddUser    ${data_test}
    ...    ELSE IF    '${data_test['method']}'=='edit'    EditUser    ${data_test}
    ...    ELSE    DeleteUser    ${data_test}

AddUser
    [Arguments]       ${data_test}
    Click Element         ${BTN_ADD_USER}
    Wait Until Element Is Visible    ${HEADER_ADD_USER}    ${timeout}
    Click Element         ${TXT_TITLE}
    Click Element         xpath=//div[@class="dx-scrollable-container"]//div[@class="dx-item dx-list-item"][3]
    InputValue    ${TXT_FIRSTNAME}    ${data_test['user.firstname']}
    InputValue    ${TXT_LASTNAME}    ${data_test['user.lastname']}
    Run Keyword If    '${data_test['user.gender']}'=='male'    Execute JavaScript    document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(1)").click();
    ...    ELSE    Execute JavaScript    document.querySelector("#form > div > div > div > div:nth-child(1) > div > div > div > div > div > div > div > div > div > div > div:nth-child(2) > div > div > div > div > div > div > div > div > div:nth-child(4) > div > div > div > div > div > div:nth-child(2)").click();
    InputValue    ${TXT_BIRTHDATE}    ${data_test['user.birthdate']}
    InputValue    ${TXT_EMAIL}    ${data_test['user.email']}
    InputValue    ${TXT_USERNAME}    ${data_test['user.username']}
    InputValue    ${TXT_PASSWORD}    ${data_test['user.password']}
    InputValue    ${TXT_CONFIRMPASSWORD}    ${data_test['user.confirmpassword']}
    Click Element     xpath=//input[@name="Status"]/../div
    Run Keyword If    '${data_test['user.status']}'=='open'    Click Element    xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'เปิดใช้งาน')]
    ...    ELSE    Click Element    xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ปิดใช้งาน')]
    Click Element     xpath=//div[@title="แผนก"]/../div
    Run Keyword If    '${data_test['user.department']}'=='it'    Click Element    xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'IT-001 : แผนก IT')]
    ...    ELSE    Click Element    xpath=//div[@class="dx-item-content dx-list-item-content"][contains(text(),'ฝ่ายรับประกันภัย : ฝ่ายรับประกันภัย')]
   
EditUser
    [Arguments]       ${data_test}

DeleteUser
    [Arguments]       ${data_test}

Setting_PDPA_Management
    [Arguments]       ${data_test}
    Login_PDPA_Management    ${data_test}
    Select_Menu_setting
    SubMenu_User    ${data_test}
