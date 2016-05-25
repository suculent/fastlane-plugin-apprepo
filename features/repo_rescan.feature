Feature: uploader publishes app

  Docs
  
  Scenario: apprepo rescan
  Given an Uploader
  When I send it the rescan message
  Then I should see "rescan"