namespace :exchange_rate do
    desc "Runs: Exchange::GetExchangeRateJob"
    task get_exchange_rate: :environment do
        Exchange::GetExchangeRateJob.perform_now
    end
end
