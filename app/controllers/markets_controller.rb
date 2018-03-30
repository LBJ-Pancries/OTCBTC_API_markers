class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def update_buy
    market = Market.find(params[:id])

    response = RestClient.get "https://bb.otcbtc.com/api/v2/tickers"
    data = JSON.parse(response.body)
    market.update(:current_buy => data['eos_cny']['ticker']['buy'])

    redirect_to markets_path
  end
end
