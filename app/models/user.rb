class User < ActiveRecord::Base
  enum role: [:customer, :driver]
  validates :role, inclusion: { in: roles.keys }

  acts_as_authentic
end
