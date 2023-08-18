Feature: Validation

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token

  Scenario: Validatiing with valid token and invalid username
    And path "/api/token/verify"
    And param token = validToken
    And param username = "wrongUsername"
    When method get
    Then status 400
    And print response
   
