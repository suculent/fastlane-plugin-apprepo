Feature: greeter says hello

  Docs
  
  Scenario: greeter says hello
  Given a Greeter
  When I send it the greet message
  Then I should see "Hello World!"