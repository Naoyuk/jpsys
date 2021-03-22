set :output, "log/cron_log.log"
set :environment, ENV['RAILS_ENV']

every 2.hours do
  rake "exchange:fetch_exchange_rate"
end
