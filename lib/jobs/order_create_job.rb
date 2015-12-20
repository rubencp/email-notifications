require './lib/customers'

class OrderCreateJob
  @queue = :default

  def self.perform(shop_name, shop_token, webhook_data)
    email_params = {
      order_number: webhook_data["order_number"],
      client_name:  webhook_data["shipping_address"]["name"]
    }

    to = Customers.for(:order_create, shop_name).map(&:email)
    Mailer.new.send(to, email_params)
  end
end