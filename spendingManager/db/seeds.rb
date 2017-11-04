# db/seed.rb

require 'csv'

# Seeding daily_totals table with calander.
daily_total_seed_file = File.read(Rails.root.join('lib','seeds','daily_total_seed.csv'))
daily_total = CSV.parse(daily_total_seed_file, :headers => true, :encoding => 'ISO-8859-1')
daily_total.each do |row|
  t = DailyTotal.new
  t.date = row['DATE']
  t.total = row['TOTAL']
  t.save
end

# Seeding user for demonstration.
users = User.create (
  [ { email: "hlim1@mail.csuchico.edu", firstname: "HEUICHAN", lastname: "LIM", 
      password: "dlagmlcks24", password_confirmation: "dlagmlcks24" } ] )

# Seeding account information.
accounts = Account.create (
  [ { name: "CHASE", accountNumber: 1234, balance: 1000.00, user_id: 1 },
    { name: "CITI BANK", accountNumber: 4569, balance: 2000.00, user_id: 1 },
    { name: "Bank of America", accountNumber: 5268, balance: 9090.00, user_id: 1 }
  ] )

# Seeding for breakdwons.
#breakdown_seed = File.read(Rails.root.join('lib','seeds','breakdownSeed.csv'))
#breakdown = CSV.parse(breakdown_seed, :headers => true, :encoding => 'ISO-8859-1')
#breakdown.each do |row|
#  t = Breakdown.new
#  t.date = row['date']
#  t.content = row['content']
#  t.activityType = row['activityType']
#  t.spendingType = row['spendingType']
#  t.amount = row['amount']
#  t.account_id = row['account_id']
#  t.save
#end

# Seeding monthly_total
monthlyTotals = MonthlyTotal.create (
  [ { year: 2017, month: 1, total: 0.00 },
    { year: 2017, month: 2, total: 0.00 },
    { year: 2017, month: 3, total: 0.00 },
    { year: 2017, month: 4, total: 0.00 },
    { year: 2017, month: 5, total: 0.00 },
    { year: 2017, month: 6, total: 0.00 },
    { year: 2017, month: 7, total: 0.00 },
    { year: 2017, month: 8, total: 0.00 },
    { year: 2017, month: 9, total: 0.00 },
    { year: 2017, month: 10, total: 0.00 },
    { year: 2017, month: 11, total: 0.00 },
    { year: 2017, month: 12, total: 0.00 }
  ] )
