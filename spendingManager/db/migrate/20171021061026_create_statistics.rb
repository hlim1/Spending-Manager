class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.references :daily_total, foreign_key: true

      t.timestamps
    end
  end
end
