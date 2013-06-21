class AnswersStatistics < ActiveRecord::Migration
  def self.up
    create_table :answers_statistics, :id => false do |t|
      t.integer :answer_id
      t.integer :statistic_id
    end

    add_index :answers_statistics, [:statistic_id, :answer_id]
  end
    def self.down
    drop_table :answers_statistics
  end
end
