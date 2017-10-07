class Account < ApplicationRecord
  has_many :breakdowns

  belongs_to :user
  has_many :breakdowns
end
