class Mailer

	def initialize(sender, emails, params)
		@emails = emails
		@sender = sender
		@subject = "Pedido ##{params[:order_number]} realizado por #{params[:client_name]}"
	end

	def send
		@emails.each do |email|
			@sender.mail(email, ENV['FROM'], @subject, ENV['ORDER_TEMPLATE'])
		end
	end

end