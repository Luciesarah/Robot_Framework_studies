*** Settings ***
Library          Browser
Documentation    Testing login and logout on Rohlik.cz, adding items to the basket, and removing them from the basket. Please note that the locators are constantly changing on this web application, so the tests might fail. However, during the development phase, everything was running correctly. Of course, the best solution for this issue would be to ask the developers to add selectors data-test directly in the code.
Resource         Data_and_Config/Configuration.robot
Resource         Data_and_Config/TestData.robot
Resource         Data_and_Config/MyKeywords.robot

Suite Setup      Open the browser, set geolocation and accept all cookies
Test Setup       Before Each Test
Suite Teardown   Close it all
Test Timeout     ${TC_TIMEOUT_ROBOT_KW}


*** Test Cases ***
Login to rohlik.cz with valid credentials - Positive
    Login                                       ${VALID_EMAIL}          ${VALID_PASSWORD}
    Check that the login was successful         ${CHECK_VALID_LOGIN}
    [Teardown]      Logout

Login to rohlik.cz with an invalid password - Negative
    Login                                       ${VALID_EMAIL}          ${INVALID_PASSWORD}
    Check that the login was unsuccessful       ${CHECK_INVALID_LOGIN}

Login to rohlik.cz with an invalid email - Negative
    Login                                       ${INVALID_EMAIL}        ${VALID_PASSWORD}
    Check that the login was unsuccessful       ${CHECK_INVALID_LOGIN}

Logout from rohlik.cz - Positive
    Login                                       ${VALID_EMAIL}          ${VALID_PASSWORD}
    Check that the login was successful         ${CHECK_VALID_LOGIN}
    Logout
    Check that the logout was successful        ${CHECK_VALID_LOGOUT}

Adding and deleting items from the basket - Positive
    Login                                       ${VALID_EMAIL}          ${VALID_PASSWORD}
    Check that the login was successful         ${CHECK_VALID_LOGIN}
    Before shopping, make sure the basket is empty
    Add to the basket                           ${ITEM_1}               ${SEL_ITEM_1}
    Add to the basket                           ${ITEM_2}               ${SEL_ITEM_2}
    Closing the dialog box asking where to bring the products
    Add to the basket                           ${ITEM_3}               ${SEL_ITEM_3}
    Check that the items were added successfully
    Empty the basket
    [Teardown]      Logout

Looking for an item- Negative
    Non-existing item                           ${NON-EXISTING-ITEM_1}
    [Teardown]      Logout

Removing one item from the basket - Positive
    Remove one item from the basket             ${SEL_REMOVE_ITEM_3}
    [Teardown]      Logout






