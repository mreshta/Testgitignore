Feature: Response Validation

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def tokenGenerate = callonce read("FirstS.feature")
    * def validToken = tokenGenerate.response.token

  Scenario: Sending a valid primary id and validating response
	And path "/api/accounts/get-account"
	