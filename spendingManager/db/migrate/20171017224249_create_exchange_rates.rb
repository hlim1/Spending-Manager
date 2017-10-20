class CreateExchangeRates < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_rates do |t|
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
