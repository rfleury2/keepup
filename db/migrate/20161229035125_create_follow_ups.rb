class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.belongs_to :contact
      t.date :send_date
      t.boolean :completed, default: false      

      t.timestamps null: false
    end
  end
end
