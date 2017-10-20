class ExchangeRate < ApplicationRecord
  require 'money'

  belongs_to :account
end
