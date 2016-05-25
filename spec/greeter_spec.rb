require_relative '../greeter.rb'

# Proves that tests work
describe 'Greeter' do
  it "should say 'Hello World!' when it receives the greet() message" do
    greeter = Greeter.new
    greeting = greeter.greet
    expect(greeting).to eq 'Hello World!'
  end
end
