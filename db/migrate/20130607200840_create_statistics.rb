class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :id
      t.integer :student_fk

      t.timestamps
    end
  end
end
