class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
