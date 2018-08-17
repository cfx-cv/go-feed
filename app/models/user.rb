class User < ActiveRecord::Base
  enum role: [:admin, :customer, :driver]
  validates :role, inclusion: { in: roles.keys }

  acts_as_authentic

  def admin?
    self.role == "admin"
  end

  def customer?
    self.role == "customer"
  end

  def driver?
    self.role == "driver"
  end
end
