require './lib/customers'

class OrderCreateJob
   @queue = :default
   
   def self.perform(shop_name, shop_token, webhook_data)
    email_params = {
      order_number: webhook_data["order_number"],
      client_name:  webhook_data["shipping_address"]["name"]
    }

    Mailer.new.send(Customers.for(:order_create), email_params)
  end
end