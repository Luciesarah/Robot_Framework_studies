*** Settings ***
Library    OperatingSystem
Library    String
Library    BuiltIn
Documentation    This exercise served to apply knowledge of variables, keywords, logging outputs, and documentation placement.


*** Variables ***
${answer01} =   The current version of Python on your computer is
${answer02} =   That's right, we have your folder here, and it's called
${answer03} =   Yes, I can calculate, your result is:
${answer04} =   The correct command to determine the Windows version on your PC is 'ver'; your faulty command will result in the answer:
${answer05} =   Your active network connections indeed do not contain
${answer06} =   The result in the console is the same as the expected string:


*** Test Cases ***
#Exercise 3: Create 2 positive automated command-line tests.
AT_01 positive
    [Documentation]    Which version of Python do I have installed?
    ${Python} =   Run  Python --version
    Should Contain    ${Python}  Python 3.11.3
    Answer    ${answer01}     ${Python}

AT_02 positive - Is there a file called this way?
    ${display} =  Run    dir
    Should Contain    ${display}  RobotFramework
    Answer    ${answer02}     RobotFramework

AT_03 positive - Can you count?
    ${result} =   Evaluate  5 + 5
    Should Be Equal As Integers     ${result}    10
    Answer     ${answer03}     10

#Exercise 4: Create 2 negative automated command-line tests.
AT_04 negative - Test the command ver
    ${WindowsVersion} =  Run  verz
    Log To Console    ${WindowsVersion}
    Should Contain    ${WindowsVersion}  'verz' is not recognized as an internal or external command
    Answer     ${answer04}    'verz' is not recognized as an internal or external command

AT_05 negative - Network connections does not include Non-acitvebalabla?
    ${active} =  Run    netstat
    Should Not Contain    ${active}  Non-acitvebalabla
    Answer    ${answer05}     Non-acitvebalabla

Experiment_01 - Greeting to Console
    ${string1} =    Run  echo Hello everybody
    Log To Console    ${string1}
    ${string2} =   Set Variable    Hello everybody
    ${resStr} =    Run Keyword And Return Status    Should Be Equal As Strings    ${string1}    ${string2}
    Answer    ${answer06}       Hello everybody


*** Keywords ***
Answer
    [Arguments]     ${a}    ${b}
    ${oneString} =   Catenate  ${a}    ${b}
    Log    ${oneString}
    [Return]    ${oneString}

























