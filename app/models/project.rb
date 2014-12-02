class Project < ActiveRecord::Base

      has_many :memberships, dependent: :destroy
      has_many :tasks, dependent: :destroy
      has_many :users, through: :memberships

      validates :name, presence: true 
end
