require 'shopify_api'

class Customers
  def self.for(group)
    return ['a@a.com'] if ENV['RACK_ENV'] != 'production'

    shopify_session do
      tag = ENV[group.to_s.upcase]
      ShopifyAPI::Customer.all(from: :search, params: {q: "tag:#{tag}"})
    end
  end
end