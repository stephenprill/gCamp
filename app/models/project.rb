class Project < ActiveRecord::Base

      has_many :memberships, dependent: :destroy 
      has_many :tasks
      has_many :users, through: :memberships
end
