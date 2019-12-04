class PagesController < ApplicationController
  def home
  end

  def profile
    @puppies = current_user.puppies
  end
end
