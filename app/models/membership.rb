class Membership < ActiveRecord::Base

      before_destroy :not_last_owner?

      validates :user, presence: :true
      validates :user, uniqueness: {scope: :project, message: "Has already been added"}
      validates :role, presence: :true

      belongs_to :project
      belongs_to :user


      def not_last_owner?
        if self.role == "Member" || project.memberships.where(role: "Owner").count > 1
          true
        else
          false
      end
    end
end
