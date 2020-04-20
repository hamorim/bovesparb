RSpec.describe Bovesparb do
  it "has a version number" do
    expect(Bovesparb::VERSION).not_to be nil
  end

  it "create a new client" do
    client = Bovesparb::Client.new
    expect(client.class).to eq Bovesparb::Client
  end

  it "search for a quote" do
    result = @client.quotes("BIDI4").first
    expect(result[:ticket]).to eq "BIDI4"
    expect(result[:name]).to eq "BANCO INTER PN      N2"
  end

  it "search for multiple quotes" do
    result = @client.quotes "BIDI4|MGLU3"
    expect(result.length).to eq 2
  end
end
