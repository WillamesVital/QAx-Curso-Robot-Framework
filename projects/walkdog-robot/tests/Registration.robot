*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke

    ${dog_walker}    Create Dictionary
    ...   name=Willames Vital
    ...   email=willames@test.com
    ...   cpf=00000014141
    ...   cep=50030030
    ...   street=Rua da Alfândega
    ...   district=Recife
    ...   city_uf=Recife/PE
    ...   number=35
    ...   details=3 andar
    ...   cnh=toretto.jpg

    Given go to registration page
    When fill out the registration form   ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se o cpf for incorreto
    [Tags]   cpf_inv 

    ${dog_walker}    Create Dictionary
    ...   name=Willames Vital
    ...   email=willames@test.com
    ...   cpf=000000141aa
    ...   cep=50030030
    ...   street=Rua da Alfândega
    ...   district=Recife
    ...   city_uf=Recife/PE
    ...   number=35
    ...   details=3 andar
    ...   cnh=toretto.jpg

    Given go to registration page
    When fill out the registration form    ${dog_walker}
    Submit signup form

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]   required 

    Given go to registration page   
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice
        
    ${dog_walker}    Create Dictionary
    ...   name=Will Vital
    ...   email=will@test.com
    ...   cpf=00000014141
    ...   cep=50030030
    ...   street=Rua da Alfândega
    ...   district=Recife
    ...   city_uf=Recife/PE
    ...   number=35
    ...   details=3 andar
    ...   cnh=toretto.jpg

    Given go to registration page
    When fill out the registration form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    aservice
        
    ${dog_walker}    Create Dictionary
    ...   name=Will Vital
    ...   email=will@test.com
    ...   cpf=00000014141
    ...   cep=50030030
    ...   street=Rua da Alfândega
    ...   district=Recife
    ...   city_uf=Recife/PE
    ...   number=35
    ...   details=3 andar
    ...   cnh=toretto.jpg
    ...   additional_service=Adestrar

    Given go to registration page
    When fill out the registration form   ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
