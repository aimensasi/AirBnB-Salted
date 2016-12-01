class TransactionsController < ApplicationController

	layout 'alt_layout'

  def new
  	@client_token =  Braintree::ClientToken.generate
  end

  def create
  	puts "params From Form :$$$$: >>> #{params}"
  end

end
