class SendgridSender

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