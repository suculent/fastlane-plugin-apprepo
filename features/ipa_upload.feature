Feature: upload IPA

  Docs
  
  Scenario: upload ipa.file
  Given a Uploader
  When I send it the run message
  Then I should see "success"