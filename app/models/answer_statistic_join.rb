class AnswerStatisticJoin < ActiveRecord::Migration
  def self.up
    create_table :answer_statistic_joins, :id => false do |t|
      t.integer :answer_id
      t.integer :statistic_id
    end

    add_index :answer_statistic_joins, [:statistic_id, :answer_id]
  end
    def self.down
    drop_table :answer_statistic_joins
  end
end
