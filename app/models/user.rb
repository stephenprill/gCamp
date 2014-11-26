class User < ActiveRecord::Base

  has_many :memberships
	has_many :users, through: :memberships
  has_many :comments

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
    #self.first_name + ' ' + self.last_name
  end

  has_secure_password

end
