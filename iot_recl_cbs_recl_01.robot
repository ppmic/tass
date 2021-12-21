*** Settings ***
Resource        ../Resource/Variables/iot_recl_cbs_01_variables.robot
Resource        ../Resource/keywords/sky_common_keywords.robot


Suite Teardown  Close Browser

Documentation    Suite description


*** Test Cases ***
Verify Pre-Condition on SFF
    [Documentation]
    ...     1. Go to https://10.137.31.32:8103/SFFWeb/pages/home/portal.jsf
    ...     2. Login with user = chalotv49 pass = PPcv21#$
    ...     3. Go to Order Managment > Asset Information
    ...     4. Input mobile number
    ...     5. Select blank fot Mobile status field
    ...     6. Click Search
    ...     7. Verify Asset Status is  Suspend - Credit Limit
    ...     8. Verfy Billing System is IRB
    ...     9. Verify Data Charging Type is CBS
    ...     #10. Verify Special Account BA is Null
    ...     #11. Verify Blacklist CA is 10
    ...     #12. Verfy Calegorey is Residential
    ...     13. Verify Services
    [Tags]    DEBUG        IOT

    Open SFF PVT
    Login to SFF        ${sff_username}     ${sff_password}
#    Open Menu Asset Information
#    Search Asset Information By Mobile Number       ${mobileNo}
#    Verify Asset Information        ${asset_status}     Suspend - Credit Limit      ${suspend_type}     All
#    Verify Asset Information        ${asset_billing_system}     Non BOS
#    Verify Data Charging System     ${asset_data_charging_system}   CBS
    Open Menu Account Profile Change



#    #Connect Database    ${DBName}
#    #Get My IP Address
#    #Update Close Shift by Terminal
#
#    Logout From SFF
#    close browser


#API Test
#    [Documentation]
#    ...             API steps:
#    ...             Get Token
#    ...
#    ...             เอา Token มาใส่ใน header ยิง POST https://phxdev-nginx1.intra.ais:2443/mobile-postpaid/reconnect/conductor/v1/order
#    ...             จะได้ OrderNo กับ OrderRefNo เอามาเก็บใส่ตัวแปรไว้
#    ...             ตัวแปรจะเอาไปใช้ใส่ใน test step
#    [Tags]      API     IOT
#    ${resp}=        Request to Get Token        ${get_token_body}
#    Log  response=${resp.content}
#    ${resDict}=      Evaluate     json.loads("""${resp.content}""")    json
#    Log    ${resDict}
#    ${orderResp}=       Request post orderreconnect       ${resDict["token"]}
#    ${resp_body}=   Evaluate  json.loads("""${orderResp.content}""")  json
#    ${resp_body_dm}=    Json.Dumps      ${resp_body}
#    log     orderNo is ${resp_body["orderNo"]} | orderRefId is ${resp_body["orderRefId"]}
#    ${orderNo}=     set variable     ${resp_body["orderNo"]}
#    ${orderRefId}=      set variable     ${resp_body["orderRefId"]}
#    set global variable       ${orderNo}
#    set global variable       ${orderRefId}


#Verify SKY Portal
#    [Documentation]
#    ...     1. Go to https://10.138.40.47:3443/
#    ...     2. Login with user = taweesis pass = Taw@2021
#    ...     3. Go to Conductor > Instance
#    ...     4. Click Select search item
#    ...     5. Input Order No SO-xxxx-xxxxxxxxxxx
#    ...     6. Select datetime
#    ...     7. Click search
#    ...     8. Verify result in Suspend section should contains order
#    ...     9. Go to Customer Orders > Instance
#    ...     10. Click Select search item
#    ...     11. Input Order No CO-xxxx-xxxxxxxxxxx
#    ...     12. Select datetime
#    ...     13. Click search
#    ...     14. Verify result in Suspend section should contains order
#    [Tags]    DEBUG        IOT
#
#    Open SKY Portal
#    Login To Sky Portal         ${sky_username}     ${sky_password}
#    Go To Menu Conductor Instance
#    SKY Search Order       ${orderNo}
#    Verify SKY Order        ${sky_conductor_instances_id}       ${orderNo}
#    Verify SKY Order        ${sky_conductor_instances_privateIdValue}         520035031001395
#    Verify SKY Order        ${sky_conductor_instances_publicIdType}           mobileNo
#    Verify SKY Order        ${sky_conductor_instances_state}                  Completed
#    capture page screenshot     SKY_Conductor_Instances.png
#    Go To Menu Conductor Task
#    SKY Search Order             ${orderNo}T001
#    Verify SKY Order        ${sky_conductor_task_instanceId}        ${orderNo}
#    Verify SKY Order        ${sky_conductor_task_state}             Completed
#    Verify SKY Order        ${sky_conductor_task_externalSystem}    customer order
#    Verify SKY Order        ${sky_conductor_task_orderNo}           ${orderRefId}
#    capture page screenshot     SKY_Conductor_Task.png
#    Go To Menu Customer Orders Instance
#    SKY Search Order        ${orderRefId}
#    Verify SKY Order        ${sky_customer_orders_id}       ${orderRefId}
#    Verify SKY Order        ${sky_customer_orders_publicIdType}     mobileNo
#    Verify SKY Order        ${sky_customer_orders_mobileNo}         0893647895
#    Verify SKY Order        ${sky_customer_orders_state}            Completed
#    capture page screenshot     SKY_Customer_Orders_Instances.png
#    Go To Menu Customer Orders Task
#
#    ${status_condition}=        set variable        Completed
#    ${index} =    Set Variable    0
#    ${LIST} =    Create List      1       2       3       4        5
#    Log     Trying to search order from ${orderRefId}T001  to ${orderRefId}T005
#
#    FOR    ${item}    IN    @{LIST}
#        ${index} =    Evaluate    ${index} + 1
#        Log   checking sky order for order=${orderRefId}T00${index} with status is ${status_condition}
#        SKY Search Order         ${orderRefId}T00${index}
#        SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     ${status_condition}
#    END
#
#    #SKY Search Order         ${orderRefId}T001
#    #SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
#    #SKY Search Order         ${orderRefId}T002
#    #SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
#    #SKY Search Order         ${orderRefId}T003
#    #SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
#    #SKY Search Order         ${orderRefId}T004
#    #SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
#    #SKY Search Order         ${orderRefId}T005
#    #SKY Verify Customer Orders Tasks      ${sky_task_status}        ${sky_task_name}      ${sky_task_id}     Completed
#    close browser
