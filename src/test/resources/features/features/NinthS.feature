@Regression
Feature: Validating response

  Background: Repeated steps are here
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token
    * def Authorize = "Bearer " + validToken

  Scenario: Validating response is JSON Array of 4 Objects
    And path "/api/plans/get-all-plan-code"
    And header Authorization = Authorize
    When method get
    Then status 200
    And print response
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false
