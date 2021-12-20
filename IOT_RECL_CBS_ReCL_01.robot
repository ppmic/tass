*** Settings ***
Resource        ../Resource/Keywords/IOT_RECL_CBS_ReCL_01_keyword.robot
Resource        ../Resource/Variables/IOT_RECL_CBS_ReCL_01_variables.robot

Suite Teardown  Close Browser

Documentation    Suite description


*** Test Cases ***
Verify Pre-Condition on SFF
    [Documentation]
    ...     1. Go to https://10.137.20.37:8103/SFFWeb/pages/home/portal.jsf
    ...     2. Login with user = chalotv49 pass = PPcv21#$
    ...     3. Go to Order Managment > Asset Information
    ...     4. Input mobile number
    ...     5. Select blank fot Mobile status field
    ...     6. Click Search
    ...     7. Verify Asset Status is  Suspend - Credit Limit
    ...     8. Verfy Billing System is IRB
    ...     9. Verify Data Charging Type is CBS
    ...     10. Verify Services
    [Tags]    DEBUG        IOT

    Open SFF PVT
    Login to SFF        ${sff_username}     ${sff_password}
    Open Menu Asset Information
    Search Asset Information By Mobile Number       ${mobileNo}
    Verify Asset Information        ${asset_status}     Suspend - Credit Limit
    Verify Asset Information        ${asset_billing_system}     Non BOS
    Verify Data Charging System     ${asset_data_charging_system}   CBS
    Logout From SFF
    close browser


API Test
    [Documentation]
    ...             API steps:
    ...             Get Token
    ...
    ...             เอา Token มาใส่ใน header ยิง POST https://phxdev-nginx1.intra.ais:2443/conductor/v1/order/suspend
    ...             จะได้ OrderNo กับ OrderRefNo เอามาเก็บใส่ตัวแปรไว้
    ...             ตัวแปรมายจะเอาไปใช้ใส่ใน test step
    [Tags]      API     IOT

    ${resp}=        Request to Get Token        ${get_token_body}
    Log  response=${resp.content}
    ${resDict}=      Evaluate     json.loads("""${resp.content}""")    json
    Log    ${resDict}
    ${orderResp}=       Request post ordersuspend       ${resDict["token"]}
    ${resp_body}=   Evaluate  json.loads("""${orderResp.content}""")  json
    ${resp_body_dm}=    Json.Dumps      ${resp_body}
    log     orderNo is ${resp_body["orderNo"]} | orderRefId is ${resp_body["orderRefId"]}
    ${orderNo}=     set variable     ${resp_body["orderNo"]}
    ${orderRefId}=      set variable     ${resp_body["orderRefId"]}
    set global variable       ${orderNo}
    set global variable       ${orderRefId}


Verify SKY Portal
    [Documentation]
    ...     1. Go to https://10.138.40.47:3443/
    ...     2. Login with user = taweesis pass = Taw@2021
    ...     3. Go to Conductor > Instance
    ...     4. Click Select search item
    ...     5. Input Order No SO-xxxx-xxxxxxxxxxx
    ...     6. Select datetime
    ...     7. Click search
    ...     8. Verify result in Suspend section should contains order
    ...     9. Go to Customer Orders > Instance
    ...     10. Click Select search item
    ...     11. Input Order No CO-xxxx-xxxxxxxxxxx
    ...     12. Select datetime
    ...     13. Click search
    ...     14. Verify result in Suspend section should contains order
    [Tags]    DEBUG        IOT

    Open SKY Portal
    Login To Sky Portal         ${sky_username}     ${sky_password}
    Go To Menu Conductor Instance
    SKY Search Order       ${orderNo}
    Verify SKY Order        ${sky_conductor_instances_id}       ${orderNo}
    Verify SKY Order        ${sky_conductor_instances_privateIdValue}         520035031001395
    Verify SKY Order        ${sky_conductor_instances_publicIdType}           mobileNo
    Verify SKY Order        ${sky_conductor_instances_state}                  Completed
    capture page screenshot     SKY_Conductor_Instances.png
    Go To Menu Conductor Task
    SKY Search Order             ${orderNo}T001
    Verify SKY Order        ${sky_conductor_task_instanceId}        ${orderNo}
    Verify SKY Order        ${sky_conductor_task_state}             Completed
    Verify SKY Order        ${sky_conductor_task_externalSystem}    customer order
    Verify SKY Order        ${sky_conductor_task_orderNo}           ${orderRefId}
    capture page screenshot     SKY_Conductor_Task.png
    Go To Menu Customer Orders Instance
    SKY Search Order        ${orderRefId}
    Verify SKY Order        ${sky_customer_orders_id}       ${orderRefId}
    Verify SKY Order        ${sky_customer_orders_publicIdType}     mobileNo
    Verify SKY Order        ${sky_customer_orders_mobileNo}         0893647895
    Verify SKY Order        ${sky_customer_orders_state}            Completed
    capture page screenshot     SKY_Customer_Orders_Instances.png
    Go To Menu Customer Orders Task
    SKY Search Order         ${orderRefId}T001
    SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
    SKY Search Order         ${orderRefId}T002
    SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
    SKY Search Order         ${orderRefId}T003
    SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
    SKY Search Order         ${orderRefId}T004
    SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
    SKY Search Order         ${orderRefId}T005
    SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
    close browser


Verify EAI
    [Documentation]
    ...     1. Go to https://10.137.31.39:8103/SmartTrace/login.xhtml
    ...     2. Login with user = apicp560 pass = apicp560
    ...     3. Go to Menu > EAI > Order List
    ...     4. Input Order Number
    ...     5. Click Query
    ...     6. Verify result should contains:
    ...         - Order Type = Supend - Credit Limit
    ...         - Order No = CO-xxxx-xxxxxxxxx
    ...         - Order Status = Complete
    ...     7. Click on
    ...     8. Verify Status is Complete
    ...     9. Verify Response Status is Complete
    ...     10. Go to Sysc List
    ...     11. Input Order Number
    ...     12. Click Query
    ...     13. Verify result should contains:
    ...         - PluginSync Status = Complete
    ...         - PluginSO Status = Complete
    ...         - PluginWO Status = Complete
    [Tags]    DEBUG        IOT

    Open EAI Web
    Login To EAI        ${eai_username}     ${eai_password}
    Go To Menu EAI Order List
    Query Order List    ${orderRefId}     #Need to change to order no which gey from API
    Verify EAI Order Information        ${eai_OrderList_result_orderNo}     ${orderRefId}
    Verify EAI Order Information        ${eai_OrderList_result_orderType}       Suspend - Credit Limit
    Verify EAI order information        ${eai_OrderList_result_orderStatus}     Complete
    click element       ${eai_OrderList_result_more_btn}
    sleep   2
    Verify EAI Order Information      ${eai_OrderList_result_Status}          Complete
    Verify EAI Order Information     ${eai_OrderList_result_ResponseStatus}  Complete
    Capture page screenshot     EAI_OrderList_Query_Result.png
    Go To Menu EAI Sync List
    Query Sycn List     ${orderRefId}
    Verify EAI Sync List        ${eai_SyncList_plugInSync}      ${eai_SyncList_plugInSync_status}     Complete
    Verify EAI Sync List        ${eai_SyncList_plugInSO}        ${eai_SyncList_plugInSO_status}       Complete
    Verify EAI Sync List        ${eai_SyncList_plugInWO}        ${eai_SyncList_plugInWO_status}       Complete
    Capture page screenshot     EAI_SyncList_Query_Result.png
    Logout from EAI
    close browser


Verify HLR
  [Documentation]
    ...     1. Go to http://10.252.56.5:44080/Routing2/index.jsp
    ...     2. Input MSISDN
    ...     3. Input IMSI
    ...     4. Click Search
    ...     5. On HLR section, click to query
    ...     6. On pop up, click Query
    ...     7. Verify result should contains:
    ...         - MSISDN : 0893647501
    ...         - IMSI : 520035031001001
    ...         - 5G SA  = มี (Bar)
    ...         - SUSP_IN = suspend (ALL)
    ...         - SUSP_OUT = suspend (ALL)
    [Tags]    DEBUG        IOT

    Open MD Routing Web
    Search on MD        ${mobileNo}     ${imsi}
    Query HLR
    Verify HLR and USMP          ${md_hlr_msisdn}        ${md_hlr_msisdn_value}      66893647895
    Verify HLR and USMP          ${md_hlr_imsi}          ${md_hlr_imsi_value}        520035031001395
    Verify HLR and USMP          ${md_hlr_5G_SA}         ${md_hlr_5G_SA_value}       ไม่มี
    Capture Page Screenshot         HLR_Result_1.png
    scroll element into view        ${md_hlr_section_2}
    Verify HLR and USMP         ${md_hlr_SUSP_IN}       ${md_hlr_SUSP_IN_value}     suspend (ALL)
    Verify HLR and USMP          ${md_hlr_SUSP_OUT}      ${md_hlr_SUSP_OUT_value}    suspend (ALL)
    capture page screenshot         HLR_Result_2.png
    Close Browser


Verify USMP
  [Documentation]
    ...     1. Go to http://10.252.56.5:44080/Routing2/index.jsp
    ...     2. Input MSISDN
    ...     3. Input IMSI
    ...     4. Click Search
    ...     5. On USMP section, click to query
    ...     6. On pop up, click Query
    ...     7. Verify result should contains:
    ...         - MSISDN : 0893647501
    ...         - IMSI : 520035031001001
    ...         - STATE = suspendDebt1Way (5)
    [Tags]    DEBUG        IOT
    Open MD Routing Web
    Search on MD        ${mobileNo}     ${imsi}
    Query USMP
    Verify HLR and USMP     ${md_usmp_msisdn}       ${md_usmp_msisdn_value}     66893647895
    Verify HLR and USMP     ${md_usmp_imsi}         ${md_usmp_imsi_value}       520035031001395
    Verify HLR and USMP     ${md_usmp_state}        ${md_usmp_state_value}      creditLimitted (5)
    capture page screenshot     USMP_Result.png
    close browser


Verify CBS Web
    Open CBS Web
    Login To CBS Web            ${cbs_username}         ${cbs_password}
    Go To CBS Ingegration Query
    Query on CBS            ${mobileNo}
    Verify CBS Status       ${cbs_status}       Active
    capture page screenshot    CBS_Result.png


Verify order created successful on SFF
    [Documentation]
    ...     1. Go to SFF > Order Management > Search Order History
    ...     2. Input mobile number in Mobile No field
    ...     3. Click Search
    ...     4. Verify in result table should contains:
    ...         - Order Type "Suspend - Credit Limit"
    ...         - Correct "Order No"
    ...         - Order Status is Completed
    ...         - Channel is Batch
    ...     5. Go to Order Managment > Asset Information
    ...     6. Verify Status is Suspend
    ...     7. Verify Status Reason is 814-ยอดใช้ในประเทศเกิน Creedit Limit
    ...     8. Suspend Type is All
    [Tags]    DEBUG        IOT

    Open SFF PVT
    Login to SFF        ${sff_username}     ${sff_password}
    Open Menu Search Order / Transaction History
    Search Order By Mobile Number   ${mobileNo}
    Sleep  5
    #For Verify Order Information, order number will get from API response.
    Verify Order Information        ${orderRefId}       Suspend - Credit Limit
    Verify Order Information        ${orderRefId}       ${orderRefId}
    Verify Order Information        ${orderRefId}       Completed
    Verify Order Information        ${orderRefId}       814-ยอดใช้ในประเทศเกิน Credit Limit
    Open Menu Asset Information
    Search Asset Information By Mobile Number       ${mobileNo}
    sleep   3
    Verify Asset Information        ${asset_status}            Suspend - Credit Limit
    Verify More Asset Information   ${suspend_type}            All
    Verify More Asset Information   ${asset_status_reason}     814-ยอดใช้ในประเทศเกิน Credit Limit
    Logout From SFF
    close browser

