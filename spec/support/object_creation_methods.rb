module ObjectCreationMethods

  def create_user overides = {}
    defaults = {
      first_name: 'Chaka',
      last_name: 'Khan',
      email: 'chaka@khan.com',
      password: 'pass',
      password_confirmation: 'pass'
    }
    User.create!(defaults.merge(overides))
  end

end
