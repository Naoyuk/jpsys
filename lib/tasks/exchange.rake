namespace :exchange do
    desc "fetch exchange rate"
    task fetch_exchange_rate: :environment do
        require 'open-uri'
        require 'json'

        base_uri = "https://openexchangerates.org/api/"
        api = "latest.json"
        app_id = Rails.application.credentials.open_exchange_rates[:api_secret_key_base]
        uri = base_uri + api + "?app_id=" + app_id

        response = open(uri)
        response_code = response.status[0]        

        if response_code == '200'
            result = JSON.parse(response.read)
            usd_cad = result['rates']['CAD']
            usd_jpy = result['rates']['JPY']
            
            Exchange.create(currency: 'CAD', rate: usd_cad)
            Exchange.create(currency: 'JPY', rate: usd_jpy)

            logger = Logger.new 'log/fetch_rate.log'
        end
    end
end
