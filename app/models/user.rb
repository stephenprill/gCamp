class User < ActiveRecord::Base

  def full_name
    [first_name, last_name].join(' ')
    #self.first_name + ' ' + self.last_name
  end

  has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
  has_many :comments, dependent: :nullify
  has_many :projects, through: :memberships

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

end
