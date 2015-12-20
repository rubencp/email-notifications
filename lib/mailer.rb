require 'sendgrid-ruby'

class Mailer
	def initialize(emails, params, sender=SendGridSender.new)
		@emails = emails
		@sender = sender
		@subject = "Pedido ##{params[:order_number]} realizado por #{params[:client_name]}"
	end

	def send
		@emails.each do |email|
			@sender.mail(email, ENV['FROM'], @subject, ENV['ORDER_TEMPLATE'])
		end
	end

  class SendGridSender
    def initialize
      @client = SendGrid::Client.new(api_user: ENV['SENDGRID_USERNAME'],
        api_key: ENV['SENDGRID_PASSWORD'])
    end

    def mail(to, from, subject, html)
      mail = SendGrid::Mail.new do |m|
        m.to      = to
        m.from    = from
        m.subject = subject
        m.html    = html
      end

      @client.send(mail)
    end
  end
end