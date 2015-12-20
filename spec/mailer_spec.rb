require_relative '../lib/mailer'

RSpec.describe Mailer do
  let(:emails) { ['hola@adios.com', 'adios@hola.com'] }
  let(:params) { { order_number: '1', client_name: 'Ruben' } }
  let(:sender) { double('Sender') }
  let(:mailer) { described_class.new(sender, emails, params) }

  it 'creates request to create emails' do
    emails.each do |email|
      expect(sender).to receive(:mail).with(email, 'no-reply@shop.com',
        "Pedido #1 realizado por Ruben", '...')
    end

    mailer.send
  end
end