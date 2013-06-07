class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :id
      t.string :text
      t.boolean :isRight
      t.integer :howOftenChosen

      t.timestamps
    end
  end
end
