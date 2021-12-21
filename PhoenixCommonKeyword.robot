*** Settings ***
Library          Selenium2Library
Library          BuiltIn
Library          RequestsLibrary
Library          String
Library          Collections
Library          OperatingSystem
Library          json
Library          HttpLibrary.HTTP


Resource         ../Repository/Web/PhoenixCommonRepository.robot
Resource         ../Variables/PhoenixCommonVariable.robot
Resource         ../Repository/Web/Sky_common_repository.robot

Documentation    All Sharing keywords need to put it here.

*** Keywords ***
Open SFF PVT
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser     ${sff_web_url}          ${browser}     options=add_argument("--ignore-certificate-errors")
    RUN KEYWORD IF      "${avoid-https}"=="True"        Avoid SSL Page


Avoid SSL Page
    ${ssl_check}=      Run keyword and return status            Wait until element is visible           ${ssl_header_error}         2
    run keyword if      "${ssl_check}"=="True"            Click element       ${ssl_advance_btn}
    run keyword if      "${ssl_check}"=="True"            Click element       ${ssl_proceed_link}

Login to SFF
    [Arguments]         ${user}         ${password}
    input text          ${txtbox_username}      ${user}
    input password      ${txtbox_password}      ${password}
    capture page screenshot     Login_to_SFF.png
    click element       ${btn_login}
    wait until element is visible           ${btn_logout}        5

Logout from SFF
    Click Element       ${btn_logout}

Open SKY Portal
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser        ${sky_portal_url}        ${browser}     options=add_argument("--ignore-certificate-errors")
    RUN KEYWORD IF      "${avoid-https}"=="True"        Avoid SSL Page
    maximize browser window

Login To Sky Portal
    [Arguments]         ${user}     ${password}
    click element       ${sky_btn_login}
    sleep   2
    input text          ${sky_txt_username}     ${user}
    input password      ${sky_txt_password}     ${password}
    capture page screenshot     Login_to_SKY.png
    click element       ${sky_btn_signIn}
    wait until element is visible       ${sky_name_display}     7

Go To Menu Conductor Instance
    wait until element is visible               ${sky_menu_order}
    click element       ${sky_menu_order}
    wait until element is visible       ${sky_menu_conductor}
    click element       ${sky_menu_conductor}
    wait until element is visible       ${sky_menu_conductor_instances}
    click element       ${sky_menu_conductor_instances}
    sleep   2

Go To Menu Conductor Task
    click element       ${sky_menu_conductor_task}
    sleep   2

Go To Menu Customer Orders Instance
    click element       ${sky_menu_customer_orders}
    wait until element is visible       ${sky_menu_customer_orders_instances}
    click element       ${sky_menu_customer_orders_instances}
    sleep   2

Go To Menu Customer Orders Task
    click element       ${sky_menu_customer_orders_task}
    sleep   2


Open EAI Web
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser        ${eai_url}        ${browser}     options=add_argument("--ignore-certificate-errors")
    RUN KEYWORD IF      "${avoid-https}"=="True"        Avoid SSL Page

Login To EAI
    [Arguments]         ${user}     ${password}
    input text          ${eai_txt_username}     ${user}
    input password      ${eai_txt_password}     ${password}
    capture page screenshot     Login_to_EAI.png
    click element       ${eai_btn_signIn}
    wait until element is visible       ${eai_welcome_txt}

Logout from EAI
    click element       ${eai_welcome_txt}
    click element       ${eai_logout}
    wait until element is visible       ${eai_login_block}

Open MD Routing Web
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser     ${md_url}          ${browser}     options=add_argument("--ignore-certificate-errors")
    RUN KEYWORD IF      "${avoid-https}"=="True"        Avoid SSL Page

Verify New Tab by URL
    [Arguments]     ${url_text}
    @{windows} =  Get Window Handles
    ${numWindows} =  Get Length  ${windows}
    ${indexLast} =  Evaluate  ${numWindows}-1
    Should Be True  ${numWindows} > 1
    Switch Window   @{windows}[${indexLast}]
    Location Should Contain     ${url_text}


# API Call Utitlity
HTTP Response Status should be Success
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200

Get Json Value and convert to Object
    [Arguments]    ${json_string}    ${path}
    # Verify json is a valid format and set it to dictionary:
    &{JSON}=  Evaluate  json.loads('''${json_string}''')  json
    # Get token from JSON
    ${value}=  Set Variable  ${JSON['${path}']}
    Log     jsonvalue ${value}
    ${len}=    Get Length    ${value}

    Return From Keyword    ${value}

JSON string to Dictionary
    [Arguments]    ${object}
    ${type} =       Evaluate    type($object).__name__
    ${ignore first} = 	Get Substring 	${object} 	1
    ${len}=    Get Length    ${ignore first}
    ${lastIndex} =  Evaluate  ${len} - 1
    ${ignore last} = 	Get Substring 	${ignore first}     0	    ${lastIndex}
    ${json_parse} =     Replace String  ${ignore last}      '       "
    ${JSON}=  evaluate  json.loads('''${json_parse}''')    json
    [return]    ${JSON}

HTTP Response Should Contain Keys
    [Arguments]    ${object}    ${expected_keys}
    ${JSON}=   JSON string to Dictionary       ${object}
    ${object_keys}    Get Dictionary Keys    ${JSON}
    Log             ${object_keys}
    Sort List    ${object_keys}
    Sort List    ${expected_keys}
    Log List    ${object_keys}
    Log List    ${expected_keys}
    Lists Should Be Equal    ${object_keys}    ${expected_keys}


Open CBS Web
    [Arguments]         ${browser}=gc       ${avoid-https}=True
    ${device}=          open browser        ${cbs_web_url}        ${browser}     options=add_argument("--ignore-certificate-errors")
    RUN KEYWORD IF      "${avoid-https}"=="True"        Avoid SSL Page


Login To CBS Web
    [Arguments]         ${user}     ${password}
    input text          ${cbs_username_txt}     ${user}
    input text          ${cbs_password_txt}     ${password}
    capture page screenshot     CBS_Login.png
    click element       ${cbs_login_btn}
    avoid login warning page
    wait until element is visible               ${cbs_logout_title}


Avoid Login Warning Page
    ${login_check}=      Run keyword and return status            wait until element is visible           ${cbs_login_continue_btn}
    run keyword if      "${login_check}"=="True"        Click element       ${cbs_login_continue_btn}

