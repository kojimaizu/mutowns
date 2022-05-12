class ToppagesController < ApplicationController
  
  
  def index
        if logged_in?
            @mutalk = current_user.mutalks.build
            @pagy, @mutalks = pagy(Mutalk.all, items:10)
        end
  end
  
end
