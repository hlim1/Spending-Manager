class CreateMonthlyTotals < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_totals do |t|
      t.integer :year
      t.integer :month
      t.decimal :total

      t.timestamps
    end
  end
end
