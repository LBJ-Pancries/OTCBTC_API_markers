namespace :dev do
  task :fetch_market => :environment do
    puts "Fetch market data..."
    response = RestClient.get "https://bb.otcbtc.com/api/v2/markets"

    data = JSON.parse(response.body)

    data.each do |m|
      existing_market = Market.find_by_otcbtc_id( m["id"] )
      if existing_market.nil?
        Market.create!(
          :otcbtc_id => m["id"],
          :ticker_id => m["ticker_id"],
          :name => m["name"]
        )

      end
    end

    puts "Total: #{Market.count} markets"
  end
end
