*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Library    Browser

*** Test Cases ***
Deve poder cadastrar um novo dog walker

    ${name}              Set Variable    Willames Vital
    ${email}             Set Variable    willames@test.com
    ${cpf}               Set Variable    00000014141
    ${cep}               Set Variable    50030030
    ${addressStreet}     Set Variable    Rua da Alfândega
    ${addressDistrict}   Set Variable    Recife
    ${addressCityUf}     Set Variable    Recife/PE
    ${addressNumber}     Set Variable    35
    ${addressDetails}    Set Variable    3 andar


    New Browser    browser=chromium                     headless=False
    New Page       https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal      Faça seu cadastro

    Fill Text    css=input[name=name]     ${name}
    Fill Text    css=input[name=email]    ${email}
    Fill Text    css=input[name=cpf]      ${cpf}
    Fill Text    css=input[name=cep]      ${cep}

    Click    css=input[value="Buscar CEP"]

    Get Property    css=input[name=addressStreet]    value    equal    ${addressStreet}
    Get Property    css=input[name=addressDistrict]    value    equal    ${addressDistrict}   
    Get Property    css=input[name=addressCityUf]    value    equal    ${addressCityUf}   


    Fill Text    css=input[name=addressNumber]     ${addressNumber}
    Fill Text    css=input[name=addressDetails]    ${addressDetails}



    Take Screenshot
