*** Settings ***
Library    Collections
Library    OperatingSystem
Documentation    The goal of these exercises was to explore how lists and dictionaries work while practicing the use of variables and keywords.


*** Variables ***
${greet}    Hello
${name}     Lucie
${y}        20


*** Test Cases ***
Testing logging outputs with variables and keywords
    ${greet} =  Set Variable     Hi
    Log To Console    ${greet}
    Log To Console    ${name}
    Log To Console    ${y}
    Should Be Equal   ${y}      20
    End
    Beginning
    Regards     Charles
    ${finalPlus}=   Sum     40   40
    Log To Console    ${finalPlus}

Exploring how lists work-01
    @{list} =     Create List        first  second  third  infinitum
    Log To Console    ${list}[2]
    Log To Console    ${list}[0]
    Log Many        ${list}
    Regards    Jane

Exploring how lists work-02
    # Create a list of strings
    @{my_list}=    Create List    apples    bananas    oranges

    # Create a list of integers
    @{my_numbers}=    Create List    1    2    3    4    5

    # Create an empty list
    @{empty_list}=    Create List

    # Append values to the empty list
    Append To List     ${empty_list}    42
    Append To List     ${empty_list}    99

    # Print the lists
    Log To Console    ${my_list}[0]
    Log To Console    ${my_numbers}[4]
    Log To Console    ${empty_list}[1]

Exploring how dictionaries work
    &{dictionary} =     Create Dictionary      chocolate, but only bitter=40  2=bananas, that's a lot  whipped cream=rather not
    Log To Console      ${dictionary}[chocolate, but only bitter]
    Log To Console      ${dictionary}[2]
    Log Many    &{dictionary}


*** Keywords ***
End
    Log To Console    This is the end of the beginning.

Beginning
    Log To Console    This is the beginning of the end.

Regards
    [Arguments]    ${name}
    Log To Console    Good morning ${name}

Sum
    [Arguments]     ${x}     ${y}
    ${plus} =  Evaluate    ${x} + ${y}
    ${oneString}=    Set Variable    The result of the addition is ${plus}.
    [Return]    ${oneString}




