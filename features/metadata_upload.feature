Feature: uploader sends json

  Docs
  
  Scenario: metadata upload
  Given an Uploader
  When I send it the run message
  Then I should see "Apprepo:Uploader"