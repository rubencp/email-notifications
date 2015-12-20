require 'sinatra/shopify-sinatra-app'
require 'sendgrid-ruby'

class SinatraApp < Sinatra::Base
  register Sinatra::Shopify

  # set the scope that your app needs, read more here:
  # http://docs.shopify.com/api/tutorials/oauth
  set :scope, 'read_customers, read_orders'

  # Your App's Home page
  # this is a simple example that fetches some products
  # from Shopify and displays them inside your app
  get '/' do
    shopify_session do
      @users = ShopifyAPI::Customer.find(:all, params: { limit: 10 })
      erb :home
    end
  end

  # this endpoint recieves the uninstall webhook
  # and cleans up data, add to this endpoint as your app
  # stores more data.
  post '/uninstall' do
    webhook_session do |params|
      current_shop.destroy
    end
  end

  post '/order_create' do

    webhook_session do |params|
      webhook_job(OrderCreateJob)      
    end


  end

  class OrderCreateJob
   @queue = :default
   
   def self.perform(shop_name, shop_token, webhook_data)
     client = SendGrid::Client.new(api_user: ENV['SENDGRID_USERNAME'], api_key: ENV['SENDGRID_PASSWORD'])
     mail = SendGrid::Mail.new do |m|
       m.to = 'ruben.cervantes@gmail.com'
       m.from = 'taco@test.com'
       m.subject = 'Hello world!'
       m.html = webhook_data.to_s
      end
    client.send(mail)
   end
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

  def send_email(html)
    client = SendGrid::Client.new(api_user: ENV['SENDGRID_USERNAME'], api_key: ENV['SENDGRID_PASSWORD'])
    mail = SendGrid::Mail.new do |m|
      m.to = 'ruben.cervantes@gmail.com'
      m.from = 'taco@cat.limo'
      m.subject = 'Hello world!'
      m.html = html
    end
    client.send(mail)
  end

end
