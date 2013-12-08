class TextMessage < ActiveRecord::Base
  attr_accessible :body, :from, :to, :scheduled_date
end
