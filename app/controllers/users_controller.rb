class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    if session[:user_id] == nil
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    else
      the_id = params.fetch("path_id")

      matching_users = User.where({ :username => the_id })

      @the_user = matching_users.at(0)

      render({ :template => "users/show.html.erb" })
    end
  end

  def liked_photos
    the_id = params.fetch("path_id")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/liked_photos.html.erb" })
  end

  def feed
    the_id = params.fetch("path_id")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/feed.html.erb" })
  end

  def discover
    the_id = params.fetch("path_id")

    matching_users = User.where({ :username => the_id })

    @the_user = matching_users.at(0)
    
    render({ :template => "users/discover.html.erb" })
  end


end
