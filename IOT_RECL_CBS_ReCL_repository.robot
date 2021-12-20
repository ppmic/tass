*** Variable ***
${menu_orderManagement}         //div[@class="icon2"]
${asset_mgr_menu_li}            //a[contains(text(), "Asset Information")]
${asset_mgr_menu_li2}           //*[@id="ddsubmenu3"]/li[1]/ul/li[1]/a
${asset_info_form}              //form[@id="assetFormId"]
${txtbox_mobileNo}              //*[@id="assetFormId:txtmobile"]
${mobile_status_dropdown}       //*[@id="assetFormId:assStatusSearch"]
${btn_search_asset}             //*[@id="assetFormId:btnSearchAsset"]
${asset_search_result}          //div[@id="simpleTogglePanelAssetDetail"]
${asset_status}                 //td[@id="assetFormListId:AstLx:0:status"]
${asset_billing_system}         //td[@id="assetFormListId:AstLx:0:billingSystem"]
${asset_data_charging_system}   //input[@id="dataChargingSystem"]
${asset_status_reason}          //input[@id="astMIStatusReason"]
${suspend_type}                 //input[@id="astMISuspendType"]
${order_transation_history_menu}    //a[contains(text(), "Search Order / Transaction History")]
${search_by_criteria_txt}           //div[contains(text(), "Search by Criteria")]
${searchOrder_mobile_no}            //input[@id="frmSearch:mobileNo"]
${searchOrder_search_btn}           //input[@id="frmSearch:SearchButton"]
${searchOrder_result_txt}           //div[contains(text(), "Result : Search Order History")]
${searhOrder_result_first_row}      //tr[@class="rich-table-row rich-table-firstrow cur"]
${result_table}                     //tbody[@id="frmList:orderHistoryTable:tb"]/tr
${eai_menu_list}                    //li[@id="menubarForm:menu"]
${eai_menu_EAI}                     //a/span[contains(text(), "EAI")]
${eai_menu_OrderProcessing}         //a/span[contains(text(), "Order Processing")]
${eai_menu_OrderList}               //a/span[contains(text(), "Order List")]
${eai_navigator_txt}                //label[contains(text(), "EAI > Order Processing > Order List")]
${eai_OrderList_OrderNo_txt}        //input[@id="tab:eaiOpOrderListForm:items:3:orderNumber"]
${eai_OrderList_query_btn}          //button[@id="tab:eaiOpOrderListForm:query"]
${eai_OrderList_result_orderNo}     //tbody[@id="tab:eaiOpOrderListForm:orderTable_data"]/tr/td[4]
${eai_OrderList_result_orderType}   //tbody[@id="tab:eaiOpOrderListForm:orderTable_data"]/tr/td[5]
${eai_OrderList_result_orderStatus}     //tbody[@id="tab:eaiOpOrderListForm:orderTable_data"]/tr/td[6]
${eai_OrderList_result_more_btn}        //button[@id="tab:eaiOpOrderListForm:orderTable:0:j_idt301"]
${eai_OrderList_result_Status}          //tbody[@id="tab:eaiOpOrderListForm:orderSiTable_data"]/tr/td[8]
${eai_OrderList_result_ResponseStatus}          //tbody[@id="tab:eaiOpOrderListForm:orderSiTable_data"]/tr/td[9]
${eai_SyncList_menu}                //a/span[contains(text(), "Sync List")]
${eai_SyncList_navigator_txt}       //label[contains(text(), "EAI > Order Processing > Sync List")]
${eai_SyncList_orderNo_txt}         //input[@id="tab:eaiOpSyncListForm:items:1:orderNumber"]
${eai_SyncList_query_btn}           //button[@id="tab:eaiOpSyncListForm:query"]
${eai_SyncList_plugInSync}          //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[1]/td[4]
${eai_SyncList_plugInSync_status}           //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[1]/td[7]
${eai_SyncList_plugInSO}                    //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[2]/td[4]
${eai_SyncList_plugInSO_status}             //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[2]/td[7]
${eai_SyncList_plugInWO}                    //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[3]/td[4]
${eai_SyncList_plugInWO_status}             //*[@id="tab:eaiOpSyncListForm:syncTable_data"]/tr[3]/td[7]
${md_msisdn_txt}                            //input[@id="MSISDN"]
${md_imsi_txt}                              //input[@id="IMSI"]
${md_search_btn}                            //button[@id="Search"]
${md_result_table}                          //div[@class="table-responsive"]
${md_hlr_query_icon}                        //*/tbody/tr[2]/td[4]/img[@src="img/query.gif"]
${md_hlr_query_btn}                         //button[contains(text(), "Query")]
${md_hlr_msisdn}                        //*[@id="page-wrapper"]/div/div/div/div/table[1]/tbody/tr[2]/td[1]/font
${md_hlr_msisdn_value}                  //*[@id="page-wrapper"]/div/div/div/div/table[1]/tbody/tr[2]/td[2]/font
${md_hlr_imsi}                          //*[@id="page-wrapper"]/div/div/div/div/table[1]/tbody/tr[3]/td[1]/font
${md_hlr_imsi_value}                    //*[@id="page-wrapper"]/div/div/div/div/table[1]/tbody/tr[3]/td[2]/font
${md_hlr_5G_SA}                         //*[@id="page-wrapper"]/div/div/div/div/table[3]/tbody/tr[4]/td[1]/font
${md_hlr_5G_SA_value}                   //*[@id="page-wrapper"]/div/div/div/div/table[3]/tbody/tr[4]/td[2]/font
${md_hlr_SUSP_IN}                       //*[@id="page-wrapper"]/div/div/div/div/table[5]/tbody/tr[2]/td[1]/font
${md_hlr_SUSP_IN_value}                 //*[@id="page-wrapper"]/div/div/div/div/table[5]/tbody/tr[2]/td[2]/font
${md_hlr_SUSP_OUT}                      //*[@id="page-wrapper"]/div/div/div/div/table[5]/tbody/tr[3]/td[1]/font
${md_hlr_SUSP_OUT_value}                //*[@id="page-wrapper"]/div/div/div/div/table[5]/tbody/tr[3]/td[2]/font
${md_hlr_section_2}                     //*[@id="page-wrapper"]/div/div/div/div/table[6]/tbody/tr[4]/td[1]/font
${md_usmp_query_icon}                   //img[@onclick="openwin('USMP');"]
${md_usmp_msisdn}                       //*[@id="page-wrapper"]/div/div/div/table[1]/tbody/tr[2]/td[1]/font
${md_usmp_msisdn_value}                 //*[@id="page-wrapper"]/div/div/div/table[1]/tbody/tr[2]/td[2]/font
${md_usmp_imsi}                         //*[@id="page-wrapper"]/div/div/div/table[1]/tbody/tr[3]/td[1]/font
${md_usmp_imsi_value}                   //*[@id="page-wrapper"]/div/div/div/table[1]/tbody/tr[3]/td[2]/font
${md_usmp_state}                        //*[@id="page-wrapper"]/div/div/div/table[2]/tbody/tr[12]/td[1]/font
${md_usmp_state_value}                  //*[@id="page-wrapper"]/div/div/div/table[2]/tbody/tr[12]/td[2]/font
${sky_search_box}                       //*[@id="content-area"]/div[3]/div/div/div/div/div/div[2]/div/div[1]/div/div[1]/div/input
${sky_X_btn}                            //span[@class="text-danger"]
${sky_bg}                               //div[@class="vx-card__body"]
${sky_selectSearchItem_btn}             //*[@id="content-area"]/div[3]/div/div/div/div/div/div[2]/div/div[1]/div/button
${sky_instanceId_txt}                   //input[@name="instanceId"]
${sky_search_close}                     //div[@class="customizer-header mt-6 flex items-center justify-between px-6"]/span
${sky_conductor_task_search_btn}        //*/button/span[contains(text(), "Search")]
${sky_conductor_instances_id}                   //*/table/tr/td[3]/span/pre
${sky_conductor_instances_privateIdValue}       //*/table/tr/td[5]/span/pre
${sky_conductor_instances_publicIdType}         //*/table/tr/td[6]/span/pre
${sky_conductor_instances_state}                //*/table/tr/td[9]/span/div/span
${sky_conductor_task_instanceId}                //*/table/tr/td[4]/span/pre
${sky_conductor_task_state}                     //*/table/tr/td[8]/span/div/span
${sky_conductor_task_externalSystem}            //*/table/tr/td[10]/span/pre
${sky_conductor_task_orderNo}                   //*/table/tr/td[5]/span/pre
${sky_customer_orders_id}                       //*/table/tr/td[3]/span/pre
${sky_customer_orders_publicIdType}             //*/table/tr/td[6]/span/pre
${sky_customer_orders_mobileNo}                 //*/table/tr/td[7]/span/pre
${sky_customer_orders_state}                    //*/table/tr/td[9]/span/div/span
${sky_customer_orders_taks_tbl}                 //*/table[@class="vs-table vs-table--tbody-table"]/tr
${sky_task_id}                          //*/table/tr[1]/td[3]/span/pre
${sky_task_name}                        //*/table/tr[1]/td[5]/span/pre
${sky_task_status}                      //*/table/tr[1]/td[7]/span/div/span
${sky_setting_btn}                        //button[@class="vs-component vs-button customizer-btn vs-button-primary vs-button-filled includeIcon includeIconOnly"]
${sky_setting_suspend_off}                //*/li[1]/div[1]/button/input[@class="vs-component vs-switch vs-switch-primary"]
${sky_instance_id_show}                   //*/ul[1]/li[2]/button[@style="font-weight: bold;"]
${sky_instance_id_txt}                    //*/ul[1]/li[2]/button
${sky_select_search}                      //*/input[@class="input-select vs-select--input"]
${sky_search_task_close_btn}              //span[@class"cursor-pointer feather-icon select-none relative"]
${cbs_sitemap}                          //div[@id="sitemap"]
${cbs_integration_query}                //a[@title="Integration Query"]
${cbs_search_box}                       //input[@name="searchFor"]
${cbs_search_btn}                       //span[@id="frameset_submit" ]
${cbs_system_menu}                      //div[@id="systemMenu"]
${cbs_customer_care}                    //a[@title="Customer Care"]
${cbs_point_of_sale}                    //a[@title="Point of Sale"]
${cbs_subscriber}                       //div[@id="subscriberTab_title"]
${cbs_status}                           //*[@id="select_1491553546563_48059"]





