@Regression
Feature: 

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    Given path "/api/token/verify"

  Scenario: Verify valid token and response
    And param token = validToken
    And param username = "supervisor"
    When method get
    Then status 200
    And print response
    And assert response == "true"

  Scenario: Validating with valid token and invalid username
    And param token = validToken
    And param username = "wrongUsername"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"

  Scenario: Validating with invalid token valid username
    And param  username = "supervisor"
    And param token = "wrongtoken"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"
