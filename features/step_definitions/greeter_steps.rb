require './greeter.rb'

Given(/^a Greeter$/) do
  @greeter = Greeter.new
end

When(/^I send it the greet message$/) do
  @message = @greeter.greet
end

Then(/^I should see "([^"]*)"$/) do |_arg1|
  puts @message
end
