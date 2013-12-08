class CreateTextMessages < ActiveRecord::Migration
  def change
    create_table :text_messages do |t|
      t.string :to
      t.string :from
      t.text :body

      t.timestamps
    end
  end
end
