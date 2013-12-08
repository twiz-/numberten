class TextMessagesController < ApplicationController  
  def new
    @text_message = TextMessage.new
  end
  
  def send_message
    number_to_send_to = params[:text_message][:to]
    number_sent_from = params[:text_message][:from]
    the_payload = params[:text_message][:body]
    @text_message = TextMessage.create(params[:text_message])
    @twilio_client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH'])
    
    if @text_message.scheduled_date == nil
      @twilio_client.account.sms.messages.create(
       from: "#{number_sent_from}",
       to: "#{number_to_send_to}",
       body: "#{the_payload}"
      )
      flash[:notice] = "Your text has been sent!"
      redirect_to action: 'new'
    else
      # add it to a scheduler
      flash[:notice] = "Your text has been scheduled."
      redirect_to action: 'new'
    end
  end
end