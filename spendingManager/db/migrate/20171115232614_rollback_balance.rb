class RollbackBalance < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE TRIGGER rollback_balance BEFORE DELETE ON breakdowns
      BEGIN
        UPDATE accounts
        SET balance = balance + Old.debit - Old.credit
        WHERE id = Old.account_id;
      END;
    SQL
  end
end
