class CreateGarbageSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :garbage_schedules do |t|
      t.references :garbage_type, null: false, foreign_key: true
      t.integer :weekday, null: false  # 0: 日曜, 6: 土曜

      t.timestamps
    end
  end
end
