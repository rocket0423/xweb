class AdminController < ApplicationController
  skip_before_filter :authorizeAdministrator
  
  def index
  end

end
