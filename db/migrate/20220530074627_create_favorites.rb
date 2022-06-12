class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mutalk, null: false, foreign_key: { to_table: :mutalks }

      t.timestamps
      
      t.index [:user_id, :mutalk_id], unique: true
    end
  end
end
