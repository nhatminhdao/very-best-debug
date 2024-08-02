class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/index"})
  end
  
  def show
    the_username = params.fetch("username")
    matching_users = User.where({ :username => the_username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/show"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    the_username = params.fetch("username")
    matching_users = User.where({ :username => the_username })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    
    redirect_to("/users/#{the_user.username}")
  end

end
