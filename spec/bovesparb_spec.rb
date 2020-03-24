RSpec.describe Bovesparb do
  it "has a version number" do
    expect(Bovesparb::VERSION).not_to be nil
  end

  it "create a new client" do
    client = Bovesparb::Client.new
    expect(client.class).to eq Bovesparb::Client
  end

  it "search for a quote" do
    result = @client.quotes "BIDI4"
    quote = result[:ComportamentoPapeis][:Papel].first
    expect(quote[:Codigo]).to eq "BIDI4"
    expect(quote[:Nome]).to eq "BANCO INTER PN      N2"
  end
end
