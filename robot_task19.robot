*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Stored the URL, Locators in Scalar, List and Dictionary variables 
${URL}    https://robotsparebinindustries.com/
${BROWSER}    chrome
@{FIELDS}    id:username    id:password
&{USERINFO}    username=maria    password=thoushallnotpass  
${LOGIN}    xpath://button[contains(text(),'Log in')]
@{ASSERT}    id:firstname    xpath://label[contains(text(),'Sales target ($)')]
${LOGOUT}    id:logout


*** Test Cases ***
User Login and Logout
# Used Keywords like Open Browser, Maximize Browser Window, Input Text, Click Button, Page Should Contain Element from Selenium Library
# Used Builtin method of Sleep in order to load the webpage after login
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    ${FIELDS[0]}    ${USERINFO.username}
    Input Text    ${FIELDS[1]}     ${USERINFO.password}
    Click Button    ${LOGIN}
    Sleep    2s
    # Asserting elements on the webpage after successful login
    Page Should Contain Element    ${ASSERT[0]}
    Page Should Contain Element    ${ASSERT[1]}
    Click Button    ${LOGOUT}
    Close Browser