require 'money'

class Account < ApplicationRecord

  belongs_to :user
  has_many :breakdowns, dependent: :destroy

end
