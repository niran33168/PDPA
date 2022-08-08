*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
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
    OpenWebPdpa           ${URL}                                  ${BrowserChrome}
    InputUserName         ${TXT_USERNAME}                         ${data_test['username']}    
    InputPassword         ${TXT_PASSWORD}                         ${data_test['password']}
    Run Keyword If        '${data_test['remenber']}' == 'TRUE'    Click Element               ${CHK_REMEMBER}    ELSE    Log    False
    Click Element         ${BTN_LOGIN}
    sleep                 5s                                      
    Close All Browsers

PDPAManagement
    [Arguments]       ${rowNo}               ${statusCode}              ${testcaseName}
    ${data_test}      Read_Excel_For_Test    ${EXCEL_NAME}              ${SHEET_NAME}      ${rowNo}
    Run Keyword If    ${rowNo} < 5           Setting_PDPA_Management

Setting_PDPA_Management
    Login_PDPA_Management