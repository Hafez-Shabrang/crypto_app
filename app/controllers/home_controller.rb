class HomeController < ApplicationController

  def index
    require "net/http"
    require "json"

    # Getting news
    @url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)
  end

  def prices
    require "net/http"
    require "json"
    # Getting top 20 crypto from coinmarketcap
    @price_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,USDT,BNB,USDC,XRP,BUSD,ADA,DOGE,MATIC,SOL,DOT,SHIB,LTC,TRX,AVAX,DAI,UNI,WBTC,ATOM&tsyms=USD,EUR"
    @price_uri = URI(@price_url)
    @price_response = Net::HTTP.get(@price_uri)
    @prices = JSON.parse(@price_response)
  end

  def search
    require "net/http"
    require "json"
    @coin = params[:search][:coin].upcase
    @single_price_url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{@coin}&tsyms=USD,EUR"
    @single_price_uri = URI(@single_price_url)
    @single_price_response = Net::HTTP.get(@single_price_uri)
    @single_price = JSON.parse(@single_price_response)
  end
end
