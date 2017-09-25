class CreateDailyTotals < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_totals do |t|
      t.date      :date
      t.decimal   :total

      t.timestamps
    end
  end
end
