class AddDateToTextMessages < ActiveRecord::Migration
  def change
    add_column :text_messages, :scheduled_date, :timestamp
  end
end
