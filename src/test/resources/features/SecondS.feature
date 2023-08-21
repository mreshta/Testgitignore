@Smoke
Feature: Token Responses

  Scenario: Validating the response with wrong username valid password. 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "wrongUsername", "password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"
