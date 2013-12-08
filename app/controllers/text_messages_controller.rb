class TextMessagesController < ApplicationController
  def new
    @text_message = TextMessage.new
  end

  def send_message
    number_to_send_to = params[:text_message][:to]
    number_sent_from = params[:text_message][:from]
    the_payload = params[:text_message][:body]
    twilio_sid = ENV['TWILIO_SID']
    twilio_auth = ENV['TWILIO_AUTH']
    
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_auth)
    
    @twilio_client.account.sms.messages.create(
     from: "#{number_sent_from}",
     to: "#{number_to_send_to}",
     body: "#{the_payload}"
    )
    flash[:notice] = "Your text has been sent!"
    redirect_to action: 'new'
  end
end
