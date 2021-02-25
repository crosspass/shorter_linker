class CreateLinkers < ActiveRecord::Migration[6.0]
  def change
    create_table :linkers do |t|
      t.string :url
      t.string :short_path
      t.string :uid
      t.integer :user_id
      t.string :email
      t.integer :times, default: 0
      t.timestamps
    end
  end
end
