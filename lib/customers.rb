require 'sinatra/shopify-sinatra-app'

class Customers
  def self.for(group, shop_name)
    return fake_customers if ENV['RACK_ENV'] != 'production'

    tag         = ENV[group.to_s.upcase]
    shop        = Shop.find_by_name(shop_name)
    api_session = ShopifyAPI::Session.new(shop_name, shop.token)

    ShopifyAPI::Base.activate_session(api_session)
    ShopifyAPI::Customer.all(from: :search, params: {q: "tag:#{tag}"})
  end

  def self.fake_customers
    [OpenStruct.new(email: 'a@a.com')]
  end
end
