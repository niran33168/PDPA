*** Settings ***
Resource    ../AllKeywords.txt

*** Keywords ***
Generate_File_Path_Request
    [Arguments]              ${path_request}
    [Documentation]          - สร้าง path สำหรับไฟล์ request เพื่อให้ใช้ได้ทุกๆเครื่อง
    ${NEWDIR}=               Remove String                                                ${CURDIR}         ${/}Keywords${/}API_Keyword
    ${file_path_request}=    Catenate                                                     SEPARATOR=${/}    ${NEWDIR}${/}DataTest${/}${path_request}
    Set Suite Variable       ${path_request}
    Set Suite Variable       ${file_path_request}
