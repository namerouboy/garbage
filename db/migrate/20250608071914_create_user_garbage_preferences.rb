class CreateUserGarbagePreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :user_garbage_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :garbage_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
