class CreateDailyQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_quotes do |t|
      t.string :quote

      t.timestamps
    end
  end
end
