class Membership < ActiveRecord::Base

      validates :user, presence: :true
      validates :user, uniqueness: {scope: :project, message: "Has already been added"}
      validates :role, presence: :true

      belongs_to :project
      belongs_to :user
end
