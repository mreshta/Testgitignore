@Regression
Feature: Status Code Validation

  Background: Repeated steps are in the background
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken
    * def pPIDD = 400000000
    #if the numbers exceed the to billion it will throw error for pPIDD

  Scenario: Validate response code status 400
    Given path "/api/accounts/get-account"
    And header Authorization = Authorize
    And param primaryPersonId = pPIDD
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id "+pPIDD+" not found"
