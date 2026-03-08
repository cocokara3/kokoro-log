class CreateDailyResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_responses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :mood_score
      t.text :answer_text
      t.date :logged_on

      t.timestamps
    end
  end
end
