Feature: uploader publishes app

  Docs
  
  Scenario: Apprepo rescan
  Given an Uploader
  When I send it the rescan message
  Then I should see "rescan"