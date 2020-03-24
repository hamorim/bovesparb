module Bovesparb
  class Client
    API_ENDPOINT = 'http://bvmf.bmfbovespa.com.br'.freeze

    def quotes(stocks)
      request params: { strListaCodigos: stocks }
    end

    private

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method: :get, endpoint: "cotacoes2000/FormConsultaCotacoes.asp", params: {})
      response = client.public_send(http_method, endpoint, params)
      Ox.load(response.body, mode: :hash)
    end
  end
end
