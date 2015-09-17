class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :phonenumber, presence: true, length: {minimum: 7}
end
