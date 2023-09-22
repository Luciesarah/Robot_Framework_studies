*** Settings ***
Documentation     These exercises served to practice keywords. The task was to create keywords for the calculator.



*** Test Cases ***
Addition
        ${resPlus} =       Calculate    20  +  15
        ${resStrPlus} =    Compare ValuesCorrect    35    ${resPlus}

Subtraction
        ${resMinus} =       Calculate    20  -  15
        ${resStrMinus} =    Compare ValuesCorrect    5    ${resMinus}

Multiplication
        ${resMultiplication} =       Calculate    20  *  15
        ${resStrMultiplication} =    Compare ValuesCorrect    300    ${resMultiplication}

Division_positive
        ${resDivision} =    Calculate    20  /  15
        ${resStrDivision} =    Compare ValuesCorrect    1.333333333333333    ${resDivision}

Division_negative
        ${resDivision} =       Calculate    20  /  15
        ${resStrDivision} =    Compare ValuesCorrect    40    ${resDivision}



*** Keywords ***
Calculate
        [Arguments]     ${a}    ${o}    ${b}
        ${expressionNum} =   Catenate  ${a}    ${o}    ${b}
        ${resNum} =    Evaluate    ${expressionNum}
        Log    ${resNum}
        [Return]    ${resNum}

Compare ValuesCorrect
        [Arguments]    ${expected}    ${actual}
        ${resultValues} =    Run Keyword And Return Status    Should Be Equal As Numbers    ${expected}    ${actual}
        ${result_string} =    Run Keyword If    ${resultValues}    Set Variable    The result of the mathematical operation is ${actual}.    ELSE    Set Variable    You expect a result ${expected}, but the correct result is ${actual}. This test verified that the calculator can calculate correctly.
        Log    ${result_string}
        [Return]    ${result_string}
