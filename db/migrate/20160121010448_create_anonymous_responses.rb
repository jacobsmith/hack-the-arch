class CreateAnonymousResponses < ActiveRecord::Migration
  def change
    create_table :anonymous_responses do |t|
      t.integer :question_id
      t.text :answer

      t.timestamps null: false
    end
  end
end
