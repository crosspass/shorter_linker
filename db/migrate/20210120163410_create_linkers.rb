class CreateLinkers < ActiveRecord::Migration[6.0]
  def change
    create_table :linkers do |t|
      t.string :url
      t.string :short_url
      t.string :uid
      t.integer :user_id
      t.string :email
      t.timestamps
    end
  end
end
