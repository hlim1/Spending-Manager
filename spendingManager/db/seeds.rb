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
  puts "#{t.date}, #{t.total} saved"
end
