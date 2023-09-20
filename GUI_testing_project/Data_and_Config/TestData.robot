*** Variables ***
#web page
${TITLE} =              Online supermarket Rohlik.cz — nejrychlejší doručení ve městě
${COOKIES} =            id=CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll

#login
${SEL_LOGIN-BTN} =          [class="sc-33d19302-0 gLxZbZ"][data-test="button"]
${SEL_CONFIRM-LOGIN} =      css=[class="sc-33d19302-0 jpkyuK"]
${SEL_LOGIN_EMAIL} =        id=email
${SEL_LOGIN_PASSWORD} =     id=password

#users
${VALID_EMAIL} =        lucispucis89@gmail.com
${INVALID_EMAIL} =      lucispucis89@gmail.cz
${VALID_PASSWORD} =     Testing.333
${INVALID_PASSWORD} =   Testing.3355

#check valid/invalid login/logout
${SEL_CHECK_VALID_LOGIN} =      [data-test="user-box-logout-button"]
${CHECK_VALID_LOGIN} =          Odhlásit se
${SEL_CHECK_INVALID_LOGIN} =    [class="sc-98ddbc07-0 bKggcS"][data-test="notification-content"]
${CHECK_INVALID_LOGIN} =        Zadal(a) jste nesprávný e-mail nebo heslo.
${SEL_CHECK_VALID_LOGOUT} =     css=[class="sc-33d19302-0 gLxZbZ"]
${CHECK_VALID_LOGOUT} =         Účet

#logout
${SEL_LOGOUT-ICON} =            css=[class="sc-c54407f5-6 gYYdTT"]
${SEL_LOGOUT-BTN} =             data-test=user-box-logout-button

#selectors for the basket
${SEL_GLOBAL_SEARCH} =          id=searchGlobal
${SEL_CLOSE_DIALOG_BOX} =       css=[class="modal-close-class"][data-test="IconCloseX"]
${SEL_HEADER_PRICE} =           data-test=headerPrice
${SEL_PRICE_IN_BASKET} =        data-test=cs-price
${SEL_EMPTY_BASKET} =           css=[class="clearCart"]

${BASKET_VALUE} =               0,00

#before shopping / borrowed selectors from CV55
${SEL_STRING_BASKET} =          css=[class="sc-5d90023e-0 izZryh u-mb--12"]
${TEXT_EmptyCart} =             Vysypat košík
${SEL_CartReview} =             id=cartReviewMainTitle

#shopping items
${SEL_ITEM_1} =     [class="sc-d5c9bdd8-4 cDMYXL"] [class="sc-a2945aee-0 iXYNHt"] [data-product-id="1411188"]   #Bio mrkev, balení
${ITEM_1} =         mrkev
${SEL_ITEM_2} =     [class="sc-d5c9bdd8-4 cDMYXL"] [data-test="counter"] [data-product-id="1349785"]    #Banán Chiquita 1 ks
${ITEM_2} =         banán
${SEL_ITEM_3} =     [class="sc-d5c9bdd8-4 cDMYXL"] [data-test="counter"] [data-product-id="1357593"]    #Cuketa kulatá 1 ks
${ITEM_3} =         cuketa

${SEL_REMOVE_ITEM_3} =      [class="sc-dc1a1dcf-0 sc-1d8203d7-0 dGHGjO noqlD"] [data-product-id="1357593"] [data-test="IconMinus"]

#non-existing item
${SEL_ERROR} =              data-test=whisperer-no-results-header
${ERROR_TEXT} =             Je nám líto, takový produkt jsme nenašli
${NON-EXISTING-ITEM_1} =    blbost