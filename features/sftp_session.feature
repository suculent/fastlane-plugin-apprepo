Feature: sftp session

  Docs
  
  Scenario: open sftp connection
  Given an Uploader
  When I send it the run message
  Then I should see "ruby-test"