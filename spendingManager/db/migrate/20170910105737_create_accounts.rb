class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string     :name
      t.string     :accountNumber
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
