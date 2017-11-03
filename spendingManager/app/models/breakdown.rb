class Breakdown < ApplicationRecord
  belongs_to :account

  def update_account_balance
    accounts = Account.all
    accounts.each { |account|
      if account.id == @breakdowns.account
        if @breakdowns.activityType == "DEBIT"
          account.balance += @breakdowns.debit
        else
          account.balance -= @breakdowns.credit
        end
      end
    }
  end
end
