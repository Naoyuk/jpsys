class ExchangeRateJob < ApplicationJob
    queue_as :default

    def perform
        require 'open-uri'
        require 'json'

        BASE_URI = "https://openexchangerates.org/api/"
        API = "latest.json"
        APP_ID = "57bb0e698d964543acaa408084125745"
        uri = BASE_URI + API + "?app_id=" + APP_ID

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