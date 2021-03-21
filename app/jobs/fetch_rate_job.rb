class FetchRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    require 'open-uri'
    require 'json'

    base_uri = "https://openexchangerates.org/api/"
    api = "latest.json"
    app_id = Rails.application.credentials.api_secret_key_base
    uri = base_uri + api + "?app_id=" + app_id

    response = open(uri)
    response_code = response.status[0]        

    if response_code == '200'
        result = JSON.parse(response.read)
        
        # get CAD/JPY rate
        usd_cad = result['rates']['CAD']
        usd_jpy = result['rates']['JPY']
        
        Exchange.create(currency: 'CAD', rate: usd_cad)
        Exchange.create(currency: 'JPY', rate: usd_jpy)
    end
  end
end
