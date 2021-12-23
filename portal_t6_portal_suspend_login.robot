*** Settings ***
Resource        ../Resource/Variables/PhoenixCommonVariable.robot
Resource        ../Resource/keywords/sky_common_keywords.robot


Suite Teardown  Close Browser

Documentation    Suite description


*** Test Cases ***
Validate Login with correct Username and Password on SKY Portal
    [Documentation]
    ...     1. Go to https://10.138.40.47:3443/
    ...     2. Login with user = taweesis pass = Taw@2021
    ...     3. Click login ADMD
    ...     4. Verify Login successfully page

    Open SKY Portal
    Login To Sky Portal         ${sky_username}     ${sky_password}
    sleep   5


Validate logout on SKY Portal
    [Documentation]
    ...     1. Go to https://10.138.40.47:3443/
    ...     2. Login with user = taweesis pass = Taw@2021
    ...     3. Click login
    ...     4. Click logout

    Open SKY Portal
    Login To Sky Portal         ${sky_username}     ${sky_password}
    Logout From sky portal
    #close browser


Validate Login with wrong Username and Password on SKY Portal
    [Documentation]
    ...     1. Go to https://10.138.40.47:3443/
    ...     2. Login with user = abc pass = 000
    ...     3. Click login
    ...     4. Verify Login Popup error

    Open SKY Portal
    Login To Sky Portal wrong username and password         ${sky_wrong_username}     ${sky_wrong_password}
    Alert Should Not Be Present    action=ACCEPT,  timeout=2s



Validate Login with null Username and Password on SKY Portal
    [Documentation]
    ...     1. Go to https://10.138.40.47:3443/
    ...     2. Login with null user and pass
    ...     3. Click login
    ...     4. Verify error message

    Open SKY Portal
    click element       ${sky_btn_login}
    input text          ${sky_txt_username}     ${EMPTY}
    input password      ${sky_txt_password}     ${EMPTY}
    click element       ${sky_btn_signIn}
    sleep       7s
    element text should be      ${sky_username_valid}    Please fill username.
    element text should be      ${sky_password_valid}    Please fill password.
    capture page screenshot     Login_wrong_SKY.png
    #Textfield Value Should Be   ${EMPTY}
