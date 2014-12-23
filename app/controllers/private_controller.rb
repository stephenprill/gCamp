class PrivateController < ApplicationController
  # views will look for layouts/public then layouts/application
  protect_from_forgery with: :exception

  #   layout :determine_layout
  #
  #   private
  #
  #   def determine_layout
  #     current_user ? "private" : "public"
  #   end
  
  # get rid of?

end
