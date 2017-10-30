class UpdateBalance < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE TRIGGER update_balance AFTER INSERT ON breakdowns
      BEGIN
        UPDATE accounts
        SET balance = balance - New.debit + New.credit
        WHERE id = New.account_id;
      END;
    SQL
  end
end
