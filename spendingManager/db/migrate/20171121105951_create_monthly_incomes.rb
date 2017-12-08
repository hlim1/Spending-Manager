class CreateMonthlyIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_incomes do |t|
      t.integer :year
      t.integer :month
      t.decimal :income

      t.timestamps
    end
  end
end
