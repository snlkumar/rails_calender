class CreateSendMessages < ActiveRecord::Migration
  def self.up
    create_table :send_messages do |t|
      t.string :mobile
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table :send_messages
  end
end
