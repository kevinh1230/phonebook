class Customer < ActiveRecord::Base
	validates :phonenumber, presence: true, length: {minimum: 7}
end
