class CreateLinkers < ActiveRecord::Migration[6.0]
  def change
    create_table :linkers do |t|
      t.string :url
      t.string :short_path, index: true
      t.string :uid, index: true
      t.integer :user_id, index: true
      t.string :email, index: true
      t.integer :times, default: 0
      t.timestamps
    end
    add_index :linkers, %i[url email]
  end
end
