class CreateRegisterdUsers < ActiveRecord::Migration
  def change
    create_table :registerd_users do |t|
      t.integer :id
      t.string :email
      t.string :password
      t.timestamp :registerdSince
      t.string :type

      t.timestamps
    end
  end
end
