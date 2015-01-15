module ObjectCreationMethods

  def create_user(overrides = {})
    defaults = {
      first_name: 'Chaka',
      last_name: 'Khan',
      email: 'chaka@khan.com',
      password: 'pass',
    }
    User.create!(defaults.merge(overrides))
  end

  def create_project(overrides = {})
    defaults = {
      name: 'Test Project'
    }
    Project.create!(defaults.merge(overrides))
  end

  def create_membership(user, project, role = 'member')
    Membership.create!(:user => user, :project => project, :role => role)
  end

end
