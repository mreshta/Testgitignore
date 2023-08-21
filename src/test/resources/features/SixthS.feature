@Smoke
Feature: Validating Response

  #Background: 
    #Given url "https://tek-insurance-api.azurewebsites.net"
    #* def tokenGenerate = callonce read("FirstS.feature")
    #* def validToken = tokenGenerate.response.token
    #And path "/api/token/verify"
#
  #Scenario Outline: 
    #And param username = "<username>"
    #And param token = "<validToken>"
    #When method get
    #Then status 400
    #And print response
    #And assert response.errorMessage == "<errorMessage>"
#
    #Examples: 
      #| username      | validToken | errorMessage                         |
      #| wrongUsername | validToken | Wrong Username send along with Token |
      #| supervisor    | wrongToken | Token Expired or Invalid Token       |
      
  Scenario: Validating response status of 400
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token/verify"
    And param  username = "supervisor"
    And param token = "token"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"
