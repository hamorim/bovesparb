require "bundler/setup"
require "bovesparb"

RSpec.configure do |config|
  config.color = true
	config.before(:all) do
		@client = Bovesparb::Client.new
	end
end
