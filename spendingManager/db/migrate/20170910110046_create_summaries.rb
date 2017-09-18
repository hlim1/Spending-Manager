class CreateSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :summaries do |t|
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
