*** Settings ***
Library     RPA.Browser.Selenium


*** Keywords ***
Open My Browser
    [Arguments]    ${URL_BROWSER}
    Open Available Browser    ${URL_BROWSER}
    Maximize Browser Window

Login Browser
    [Arguments]    ${username}    ${password}    ${element_page}
    Input Username    ${username}
    Input Pwd    ${password}
    Submit Form
    Assert logged in    ${element_page}   

Input Username
    [Arguments]    ${username}
    Input Text    id:fld-uname    ${username}

Input Pwd
    [Arguments]    ${password}
    Input Password    id:fld-upass    ${password}

Assert logged in
    [Arguments]    ${element_page}    
    Wait Until Page Contains Element    ${element_page}

Submit Form Input    
    [Arguments]    ${song_title}        

Close Browsers
    Close All Browsers


