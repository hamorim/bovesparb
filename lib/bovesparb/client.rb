module Bovesparb
  class Client
    API_ENDPOINT = "http://bvmf.bmfbovespa.com.br".freeze
    DICTIONARY = {
      Codigo: :ticket,
      Nome: :name,
      Data: :date,
      Abertura: :open,
      Minimo: :low,
      Maximo: :high,
      Medio: :average,
      Ultimo: :close,
      Oscilacao: :variation,
    }

    def quotes(stocks)
      response = request(params: { strListaCodigos: stocks })
      parser(response)
    end

    private

    def parser(response)
      tickets = response[:ComportamentoPapeis][:Papel].flatten
      tickets.collect do |ticket|
        ticket.transform_keys { |key| DICTIONARY[key] || key }
      end
    end

    def client
      @_client ||= Faraday.new(API_ENDPOINT, request: { open_timeout: 3, timeout: 5 }) do |client|
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
