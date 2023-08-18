Feature: Token Responses

  Scenario: Login With Wrong username Valid Password. Validating the response
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "wrongUsername", "password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"
