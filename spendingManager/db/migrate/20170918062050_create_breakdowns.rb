class CreateBreakdowns < ActiveRecord::Migration[5.1]
  def change
    create_table :breakdowns do |t|
      t.date :date
      t.string :content
      t.string :activityType
      t.string :spendingType, :default => "None"
      t.decimal :debit, :default => 0.00
      t.decimal :credit, :default => 0.00
      t.decimal :amount, :default => 0.00
      t.references :account , index: true, foreign_key: true

      t.timestamps
    end
  end
end
