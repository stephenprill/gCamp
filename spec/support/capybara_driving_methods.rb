def log_in(user, password)
  visit root_path
  click_on 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: password
  click_on 'Sign in'
end

def log_out
  click_on 'Sign Out'
end
