require_relative '../../lib/jobs/order_create_job'

RSpec.describe OrderCreateJob do

  let(:email_params) do
    { order_number: 1007, client_name:  "John Williams" }
  end

  describe 'perform' do
    it 'sends correct params to Mailer' do
      expect_any_instance_of(Mailer).to receive(:send).
        with(Customers.for(:order_create), email_params)

      OrderCreateJob.perform('shop_name', 'shop_token', webhook_data)
    end
  end

  let(:webhook_data) do
    {
      "id" => 2274002375,
      "email" => "user@gmail.com",
      "closed_at" => nil,
      "created_at" => "2015-12-20T14:10:57-05:00",
      "updated_at" => "2015-12-20T14:10:58-05:00",
      "number" => 7,
      "note" => nil,
      "token" => "1cee87ab89aa56275f77d691d70a95e7",
      "gateway" => "bogus",
      "test" => true,
      "total_price" => "561.32",
      "subtotal_price" => "477.00",
      "total_weight" => 113,
      "total_tax" => "76.32",
      "taxes_included" => false,
      "currency" => "MXN",
      "financial_status" => "authorized",
      "confirmed" => true,
      "total_discounts" => "0.00",
      "total_line_items_price" => "477.00",
      "cart_token" => "1a66df4db8747e4fd3ceef9a5619642c",
      "buyer_accepts_marketing" => false,
      "name" => "#1007",
      "referring_site" => "",
      "landing_site" => "/",
      "cancelled_at" => nil,
      "cancel_reason" => nil,
      "total_price_usd" => "32.78",
      "checkout_token" => "2ce111794458ae61afe9fac537ffd01f",
      "reference" => nil,
      "user_id" => nil,
      "location_id" => nil,
      "source_identifier" => nil,
      "source_url" => nil,
      "processed_at" => "2015-12-20T14:10:57-05:00",
      "device_id" => nil,
      "browser_ip" => "45.74.36.45",
      "landing_site_ref" => nil,
      "order_number" => 1007,
      "discount_codes" => [

      ],
      "note_attributes" => [

      ],
      "payment_gateway_names" => [
        "bogus"
      ],
      "processing_method" => "direct",
      "checkout_id" => 5678197511,
      "source_name" => "web",
      "fulfillment_status" => nil,
      "tax_lines" => [{
                        "title" => "VAT",
                        "price" => "76.32",
                        "rate" => 0.16
      }],
      "tags" => "",
      "contact_email" => "user@gmail.com",
      "line_items" => [{
                         "id" => 3871396615,
                         "variant_id" => 7058134977,
                         "title" => "Acai Orgánico en Polvo 113 g",
                         "quantity" => 1,
                         "price" => "477.00",
                         "grams" => 113,
                         "sku" => "NAVI0291",
                         "variant_title" => "113 g",
                         "vendor" => "NAVITAS",
                         "fulfillment_service" => "manual",
                         "product_id" => 2174417793,
                         "requires_shipping" => true,
                         "taxable" => true,
                         "gift_card" => false,
                         "name" => "Acai Orgánico en Polvo 113 g - 113 g",
                         "variant_inventory_management" => "shopify",
                         "properties" => [

                         ],
                         "product_exists" => true,
                         "fulfillable_quantity" => 1,
                         "total_discount" => "0.00",
                         "fulfillment_status" => nil,
                         "tax_lines" => [{
                                           "title" => "VAT",
                                           "price" => "76.32",
                                           "rate" => 0.16
                         }]
      }],
      "shipping_lines" => [{
                             "title" => "Standard Shipping",
                             "price" => "8.00",
                             "code" => "Standard Shipping",
                             "source" => "shopify",
                             "phone" => nil,
                             "tax_lines" => [

                             ]
      }],
      "billing_address" => {
        "first_name" => "Javier",
        "address1" => "aasdfasdfasdf",
        "phone" => "",
        "city" => "Guadalajara",
        "zip" => "45027",
        "province" => "Jalisco",
        "country" => "Mexico",
        "last_name" => "Cervante",
        "address2" => "",
        "company" => "",
        "latitude" => 20.6596988,
        "longitude" => -103.3496092,
        "name" => "John Williams",
        "country_code" => "MX",
        "province_code" => "JAL"
      },
      "shipping_address" => {
        "first_name" => "Javier",
        "address1" => "aasdfasdfasdf",
        "phone" => "",
        "city" => "Guadalajara",
        "zip" => "45027",
        "province" => "Jalisco",
        "country" => "Mexico",
        "last_name" => "Cervante",
        "address2" => "",
        "company" => "",
        "latitude" => 20.6596988,
        "longitude" => -103.3496092,
        "name" => "John Williams",
        "country_code" => "MX",
        "province_code" => "JAL"
      },
      "fulfillments" => [

      ],
      "client_details" => {
        "browser_ip" => "45.74.36.45",
        "accept_language" => "en-US,
       en;
       q = 0.5 ",
        "user_agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:42.0      ) Gecko/20100101 Firefox/42.0",
        "session_hash" => "36543fd9ff8d109f08d8cbac08d74fb5",
        "browser_width" => 1221,
        "browser_height" => 573
      },
      "refunds" => [

      ],
      "payment_details" => {
        "credit_card_bin" => "1",
        "avs_result_code" => nil,
        "cvv_result_code" => nil,
        "credit_card_number" => "•••• •••• •••• 1",
        "credit_card_company" => "Bogus"
      },
      "customer" => {
        "id" => 2171922887,
        "email" => "user@gmail.com",
        "accepts_marketing" => false,
        "created_at" => "2015-12-19T09:00:38-05:00",
        "updated_at" => "2015-12-20T14:10:58-05:00",
        "first_name" => "Javier",
        "last_name" => "Cervante",
        "orders_count" => 0,
        "state" => "disabled",
        "total_spent" => "0.00",
        "last_order_id" => nil,
        "note" => "",
        "verified_email" => true,
        "multipass_identifier" => nil,
        "tax_exempt" => false,
        "tags" => "almacen",
        "last_order_name" => nil,
        "default_address" => {
          "id" => 2320544711,
          "first_name" => "Javier",
          "last_name" => "Cervante",
          "company" => "",
          "address1" => "aasdfasdfasdf",
          "address2" => "",
          "city" => "Guadalajara",
          "province" => "Jalisco",
          "country" => "Mexico",
          "zip" => "45027",
          "phone" => "",
          "name" => "John Williams",
          "province_code" => "JAL",
          "country_code" => "MX",
          "country_name" => "Mexico",
          "default" => true
        }
      }
    }
  end
end
