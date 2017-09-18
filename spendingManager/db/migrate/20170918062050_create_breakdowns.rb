class CreateBreakdowns < ActiveRecord::Migration[5.1]
  def change
    create_table :breakdowns do |t|
      t.date :date
      t.string :content
      t.decimal :amount
      t.decimal :currentBalance
      t.references :account , index: true, foreign_key: true

      t.timestamps
    end
  end
end