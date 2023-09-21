*** Settings ***
Library	        Collections
Library	        RequestsLibrary
Library         String


*** Variables ***
${url}		        http://testovani.kitner.cz/
${app}              /regkurz/formsave.php
${urlapp}           ${url}${app}


*** Test Cases ***
Pos_Registration - usual person
    Registration for the course  2  Jan787878  Kroupa  jan.novak@abc.cz  777123123  fyz  Udolni 21, Brno  1  komentar  false  200

Pos_Registration - legal entity
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  777123123  pra  27232433  1  dekuji  false  200

Pos_Registration - carons and commas
    Registration for the course  2  Janěščřžýáíéů  Novakěščřžýáíéů  jan.novak@abc.cz  777123123  fyz  Udolniěščřžýáíéů, Brno  1  nic  false  200

Pos_Registration - usual person - empty comment
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  777123123  fyz  Udolni 21, Brno  1  ${EMPTY}  false  200

Neg_Registration - legal entity - empty course name
    Registration for the course      ${EMPTY}  Honza  Novak  jan.novak@abc.cz  777123123  pra  27232433  2  dekuji  false  500

Neg_Registration - legal entity - empty name
    Registration for the course  2  ${EMPTY}  Novak  jan.novak@abc.cz  777123123  pra  27232433  1  dekuji  false  500

Neg_Registration - usual person - empty surname
    Registration for the course  1  Jan787878  ${EMPTY}  jan.novak@abc.cz  777123123  fyz  Udolni 21, Brno  1  komentar  false  500

Neg_Registration - legal entity - empty e-mail
    Registration for the course  3  Jan787878  Novak  ${EMPTY}  777123123  pra  27232433  1  dekuji  false  500

Neg_Registration - usual person - empty phone number
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  ${EMPTY}  fyz  Udolni 21, Brno  1  komentar  false  500

Neg_Registration - legal entity - empty type of person
    Registration for the course  1  Honza  Novak  jan.novak@abc.cz  777123123  ${EMPTY}  27232433  1  dekuji  false  500

Neg_Registration - legal entity - empty IČO
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  777123123  pra  ${EMPTY}  1  dekuji  false  500

Neg_Registration - usual person - empty address
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  777123123  fyz  ${EMPTY}  1  komentar  false  500

Neg_Registration - legal entity - empty amount of people
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  777123123  pra  27232433  ${EMPTY}  ${EMPTY}  true  500

Neg_Registration - usual person - wrong phone number (too long)
    Registration for the course  2  Jan787878  Novak  jan.novak@abc.cz  7771231235976985467487698698  fyz  Udolni 21, Brno  1  komentar  false  500

Neg_Registration - legal entity - wrong e-mail format (thisisnotanemail.cz)
    Registration for the course  2  Jan787878  Novak  thisisnotanemail.cz  777123123  pra  27232433  1  dekuji  false  500

Neg_Registration - usual person - special characters - character $ in the phone number
    Registration for the course  2   Jan787878  Novak  jan.novak@abc.cz  $$$$$$$$$$$  fyz  Udolni 21, Brno  1  komentar  false  500

Neg_Registration - legal entity - special characters - character * in the e-mail
    Registration for the course  2  Jan787878  Novak  jan.novak*abc.cz  777123123  pra  27232433  1  dekuji  false  500

Neg_Registration - usual person - too many participants
    Registration for the course  2  Jan787878  Kroupa  jan.novak@abc.cz  777123123  fyz  Udolni 21, Brno  10000000000000000000000  komentar  false  500


*** Keywords ***
Registration for the course
    [Arguments]    ${course}  ${name}  ${surname}  ${email}  ${phone}  ${type_of_person}  ${address_ico}  ${amount_of_people}  ${comment}  ${consent}  ${status_code}

    #creating the body of the request message
    ${json}=      catenate  {"targetid":"","kurz":"${course}","name":"${name}","surname":"${surname}","email":"${email}","phone":"${phone}","person":"${type_of_person}","address":"${address_ico}","ico":"${address_ico}","count":"${amount_of_people}","comment":"${comment}","souhlas":${consent}}

    #conversion to UTF-8
    ${json_utf8} =     Encode String To Bytes     ${json}     UTF-8      #library String is needed

    #creating the header of the request message
    &{header}=         Create Dictionary   Content-Type=application/json

    #sending the request message and saving the response to ${resp}
    ${resp}=   Post   ${urlapp}   data=${json_utf8}   headers=${header}   expected_status=Anything

    #evaluation
    Status Should Be    ${status_code}
    Should Contain      ${json}    ${name}    ${surname}     ${email}    ${phone}    ${type_of_person}    ${address_ico}
    Log                 ${json}






