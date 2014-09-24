class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :count
      t.string :event
      t.string :time

      t.timestamps
    end
  end
end
