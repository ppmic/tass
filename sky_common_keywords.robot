*** Setting ***
Resource        PhoenixCommonKeyword.robot

*** Keywords ***

Open Menu Asset Information

    mouse over      ${menu_orderManagement}
    mouse over      ${asset_mgr_menu_li}
    mouse over      ${asset_mgr_menu_li2}
    click element   ${asset_mgr_menu_li2}
    wait until element is visible       ${asset_info_form}
    #capture page screenshot     Menu_Asset_Information.png

Open Menu Account Profile Change

    mouse over      ${menu_account}
    mouse over      ${menu_profile_change}
    click element   ${menu_profile_change}

Search Asset Information By Mobile Number

    [Arguments]     ${mobile_number}
    input text      ${txtbox_mobileNo}         ${EMPTY}
    input text      ${txtbox_mobileNo}        ${mobile_number}
    Select From List By Index       ${mobile_status_dropdown}       0
    capture page screenshot     Search_Asset_Info.png
    click element   ${btn_search_asset}
    sleep       5s
    capture page screenshot     Asset_search_Result.png

Verify Asset Information

    [Arguments]     ${element_locator}      ${text}
    Scroll Element Into View    ${element_locator}
    Element Text Should Be      ${element_locator}      ${text}

Verify Data Charging System

    [Arguments]     ${locator}      ${expected_value}
    Scroll Element Into View        ${locator}
    ${actual_value}=    Get Value      ${locator}
    Should Be Equal         ${actual_value}       ${expected_value}
    Log      ทำการเปรียบเทียบ ${actual_value} = ${expected_value}

Request to Get Token
    [Arguments]    ${params}
    ${header}=      Create Dictionary      Content-Type=application/json;charset=utf-8
    Create Session    tmd    ${host_url}       verify=False     headers=${header}
    ${resp}=    POST On Session   tmd   ${get_token_url}    data=${params}

    Return From Keyword    ${resp}
    Log To Console  ${resp}


Request post ordersuspend
    [Arguments]     ${token}
    ${url}=     set variable        https://phxdev-nginx1.intra.ais:2443/conductor/v1/order/suspend
    ${header}=      Create Dictionary      Content-Type=application/json;charset=utf-8              Authorization=${token}
    Create Session    tmd    ${url}       verify=False     headers=${header}
    ${json}=  Get file  ${json_path}
    # convert the data to a python object
    ${object}=  Evaluate  json.loads('''${json}''')  json
    # log the data
    ${jsondm}=      Json.Dumps      ${object}
    log  Hello, credit suspend content is ${object["publicIdType"]} ${object["publicIdValue"]}  WARN
    ${resp}=         post on session        tmd     /       data=${jsondm}
    #log     ${resp.json()}

    [Return]        ${resp}


Open Menu Search Order / Transaction History
    [Arguments]
    Mouse Over      ${menu_orderManagement}
    Mouse Over      ${order_transation_history_menu}
    Click Element   ${order_transation_history_menu}
    wait until element is visible       ${search_by_criteria_txt}

Search Order By Mobile Number
    [Arguments]     ${mobile_no}
    Input Text      ${searchOrder_mobile_no}           ${mobile_no}
    Click Element   ${searchOrder_search_btn}
    Wait Until Element Is Visible       ${searchOrder_result_txt}

Verify More Asset Information
    [Arguments]     ${locator}      ${expected_value}
    Scroll Element Into View    ${locator}
    ${actual_value}=       Get Value   ${locator}
    Should Be Equal As Strings      ${actual_value.replace(' ','')}    ${expected_value.replace(' ','')}
    Log      ทำการเปรียบเทียบ ${actual_value} = ${expected_value}

Get Table Row By Order Id
    [Arguments]     ${order_no}
    ${total_row}=   Get Element Count   ${result_table}
    Log     ${total_row}
    FOR     ${index}    IN RANGE    1   ${total_row}
        ${RowData}=    Get Text    //tbody[@id="frmList:orderHistoryTable:tb"]/tr[${index}]
        ${IsEqual}=    Run Keyword And Return Status    Should Contain    ${RowData}    ${order_no}
        ${RowNo}=      Set Variable    ${index}
        Run Keyword If    '${IsEqual}'=='True'    Run Keywords    Log    Rownumber is ${RowNo}    AND    Exit For Loop
    END
    set test variable    ${RowData}
    Log  Row number = ${RowNo} Data = ${RowData}

Verify Order Information
    [Arguments]     ${order_no}     ${expected_value}
    Get Table Row By Order Id       ${order_no}
    Should Contain      ${RowData}      ${expected_value}
    Log     Order Information >> ${RowData}
    Log     Expected >> ${expected_value}

Go To Menu EAI Order List
    mouse over      ${eai_menu_list}
    mouse over      ${eai_menu_EAI}
    mouse over      ${eai_menu_OrderProcessing}
    click element   ${eai_menu_OrderList}
    wait until element is visible       ${eai_navigator_txt}

Query Order List
    [Arguments]     ${order_no}
    input text      ${eai_OrderList_OrderNo_txt}        ${order_no}
    click element   ${eai_OrderList_query_btn}
    sleep   2

Verify EAI Order Information
    [Arguments]     ${locator}      ${expected_value}
    ${actual_value}=    Get Text       ${locator}
    should be equal      ${actual_value}         ${expected_value}
    log     ทำการเปรียบเทียบค่า ${actual_value} = ${expected_value}

Go To Menu EAI Sync List
    mouse over      ${eai_menu_list}
    mouse over      ${eai_menu_EAI}
    mouse over      ${eai_menu_OrderProcessing}
    click element       ${eai_SyncList_menu}
    wait until element is visible       ${eai_SyncList_navigator_txt}

Query Sycn List
    [Arguments]     ${order_no}
    input text      ${eai_SyncList_orderNo_txt}     ${order_no}
    click element   ${eai_SyncList_query_btn}
    sleep   2

Verify EAI Sync List
    [Arguments]     ${destination_locator}      ${locator}      ${expected_value}
    ${destination}=     Get text        ${destination_locator}
    ${actual_value}=    Get Text        ${locator}
    should be equal      ${actual_value}         ${expected_value}
    log     ทำการเปรียบเทียบค่า ${destination}: ${actual_value} = ${expected_value}

Search on MD
    [Arguments]     ${msisdn}       ${imsi}
    input text      ${md_msisdn_txt}        ${mobile_no}
    input text      ${md_imsi_txt}          ${imsi}
    click element   ${md_search_btn}
    wait until element is visible       ${md_result_table}

Query HLR
    click element       ${md_hlr_query_icon}
    wait until element is visible       ${md_hlr_query_btn}
    click element       ${md_hlr_query_btn}
    Verify New Tab by URL       ${hlr_url_text}


Verify HLR and USMP
    [Arguments]     ${destination_locator}      ${locator}      ${expected_value}
    ${destination}=     Get text        ${destination_locator}
    ${actual_value}=    Get Text        ${locator}
    should be equal      ${actual_value}         ${expected_value}
    log     ทำการเปรียบเทียบค่า ${destination}: ${actual_value} = ${expected_value}


Query USMP
   click element        ${md_usmp_query_icon}
   Verify New Tab by URL       ${usmp_url_text}


SKY Search Order
    [Arguments]     ${order_no}
    SKY Display Setting
    click element   ${sky_X_btn}
    sleep   2
    press keys      ${sky_search_box}       CTRL+A+BACKSPACE
    input text      ${sky_search_box}       ${order_no}
    press keys      ${sky_search_box}       ENTER
    sleep   2


SKY Display Setting
    # if h4 not visible mean the table suspend not visible
    ${suspend_table_display}=           run keyword and return status              wait until element is visible           xpath=//h4[contains( text(), "Suspend")]      3
    capture page screenshot             suspend table
    run keyword if           "${suspend_table_display}"=="False"              SKY Display toogle to display table

SKY Display toogle to display table
     # input type="checkbox" class=""
    click element       ${sky_setting_btn}
    log source
   # wait until element is visible       xpath=//*[@class="px-6"]/ul/li[1]/div[1]/input        3
   # wait until element is visible       xpath=//input[@class="input-switch vs-switch--input"]         3
    @{childs}=    Get Child WebElements    xpath=//*[@class="px-6"]/ul/li[1]/div[1]/button
    ${clickToElement}=      set variable            .
    ${itemsize}=            Get length        ${childs}
    Log    itemsize=${itemsize}
    FOR    ${echild}    IN    @{childs}
        ${text}=        Get text      ${echild}
        ${for_value}=   Get Element Attribute   ${echild}  class
        ${clickToElement}=      Set Variable If	 "${for_value}"=="input-switch vs-switch--input" 	    ${echild}       xpath=//*[@class="px-6"]/ul/li[1]/div[1]/button
        Log To Console  ${for_value}
        Log      element text =${text}
    END

    ${toggle}=       RUN KEYWORD AND RETURN STATUS        wait until element is visible       ${clickToElement}         3
    log     ${toggle}
    # RUN KEYWORD IF      "${toggle}"=="True"
    Click Element        ${clickToElement}
    Log     after click toggle then close
    click element       ${sky_search_close}
    sleep   2

Get Child Webelements
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${children}     Call Method
    ...                ${element}
    ...                find_elements
    ...                  by=xpath    value=child::*

    [Return]      ${children}



SKY Verify Customer Orders Tasks
    [Arguments]     ${task_status_path}     ${task_name}       ${task_id}       ${expected}
    ${actual_status}=       Get Text        ${task_status_path}
    ${id}=      Get Text        ${task_id}
    ${name}=    Get Text        ${task_name}
    should be equal         ${actual_status}        ${expected}
    log     Id: ${id} | ${name} is ${actual_status}
    capture page screenshot     SKY_Customer_Order_Task_${name}.png



Rest API Request Should Success and return data
    [Arguments]     ${user}         ${password}

    Create Http Context   ${host_url}    http
    Set Request Header    Content-Type    application/json
    Set Request Header    Authorization    Bearer
    ${dict}=    Create Dictionary    username    ${user}      password    ${password}
    ${value}=    Stringify Json    ${dict}
    Set Request Body    ${value}
    HttpLibrary.HTTP.POST    ${get_token_url}
    Response Status Code Should Equal    200
    ${result_text}=    Get Response Body
    ${result_json}=    Parse Json    ${result_text}
    Return From Keyword    ${result_json}


Verify SKY Order
    [Arguments]         ${locator}      ${expected_value}
    wait until element is visible       ${locator}
    ${actual_value}=    Get Text        ${locator}
    should be equal      ${actual_value}         ${expected_value}
    log     ทำการเปรียบเทียบค่า ${actual_value} = ${expected_value}


Go To CBS Ingegration Query
    click element       ${cbs_system_menu}
    wait until element is visible       ${cbs_customer_care}
    mouse over          ${cbs_customer_care}
    wait until element is visible       ${cbs_point_of_sale}
    mouse over          ${cbs_point_of_sale}
    click element       ${cbs_integration_query}
    sleep   2


Query on CBS
    [Arguments]         ${moblie_no}
    ${number}=      replace string      ${mobile_no}        0       ${EMPTY}        count=1
    log source
    Select Frame        xpath=//iframe[@id="tabPage_301001004_iframe"]
    log source
    wait until element is visible              ${cbs_search_box}        5
    Input Text           ${cbs_search_box}       ${number}
    click element        ${cbs_search_btn}
    wait until element is visible           ${cbs_subscriber}
    click element       ${cbs_subscriber}
    sleep   2

Verify CBS Status
    [Arguments]         ${locator}      ${expected_value}
    log source
    Select Frame        xpath=//iframe[@id="subscriberTab_iframe"]
    ${actual_value}=    Get Text        ${locator}
    should be equal      ${actual_value}         ${expected_value}
    log     ทำการเปรียบเทียบค่า status: ${actual_value} = ${expected_value}





