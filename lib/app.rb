require 'sinatra/shopify-sinatra-app'
require './lib/mailer'

class SinatraApp < Sinatra::Base
  register Sinatra::Shopify

  set :scope, 'read_customers, read_orders'

  get '/' do
    shopify_session do
      @users = ShopifyAPI::Customer.find(:all, params: { limit: 10 })
      erb :home
    end
  end

  post '/uninstall' do
    webhook_session do |params|
      current_shop.destroy
    end
  end

  post '/order_create' do
    webhook_job(OrderCreateJob)
  end

  class OrderCreateJob
   @queue = :default
   
   def self.perform(shop_name, shop_token, webhook_data)
    email_params = {
      order_number: webhook_data["order_number"],
      client_name:  webhook_data["shipping_address"]["name"]
    }

    Mailer.new(ENV['mails'], email_params).send
  end

  private

  def after_shopify_auth
    shopify_session do
      create_webhook('app/uninstalled', 'uninstall')
      create_webhook('orders/create', 'order_create')
    end
  end

  def create_webhook(topic, route)
    webhook = ShopifyAPI::Webhook.create(
      topic: topic,
      address: "#{base_url}/#{route}",
      format: 'json'
    )
    begin
      webhook.save!
    rescue => e
      raise unless webhook.persisted?
    end
  end

end
