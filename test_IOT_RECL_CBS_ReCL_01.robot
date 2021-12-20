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
    Verify Asset Information        ${asset_billing_system}     NON BOS
    Verify Data Charging System     ${asset_data_charging_system}   CBS
    Logout From SFF
    close browser


