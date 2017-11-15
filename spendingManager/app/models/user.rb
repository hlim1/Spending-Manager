class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true
  
  # dependent: :destroy will destroy every entity that is depends on the current user,
  # when the user's trying to remove the account, or destroy.
  has_many :accounts, dependent: :destroy 
end
