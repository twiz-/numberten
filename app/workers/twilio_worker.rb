class TwilioWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(text_message_id)
    text_message = TextMessage.find(text_message_id)
    number_to_send_to = text_message.to
    number_sent_from =  text_message.from
    the_payload = text_message.body
    @twilio_client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH'])
      
    @twilio_client.account.sms.messages.create(
     from: "#{number_sent_from}",
     to: "#{number_to_send_to}",
     body: "#{the_payload}"
    )
  end
end