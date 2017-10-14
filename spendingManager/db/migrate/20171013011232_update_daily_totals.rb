class UpdateDailyTotals < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE TRIGGER update_daily_total AFTER INSERT ON breakdowns
      BEGIN
        UPDATE daily_totals
        SET total = (SELECT SUM(amount) FROM breakdowns WHERE New.date = date)
        WHERE New.date = date;
      END;
    SQL
  end
end
