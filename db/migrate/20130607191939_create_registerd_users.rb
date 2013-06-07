class CreateRegisterdUsers < ActiveRecord::Migration
  def change
    create_table :registerd_users do |t|
      t.integer :id
      t.string :email
      t.integer :password
      t.timestamp :registerdSince
      t.string :type

      t.timestamps
    end
  end
end
