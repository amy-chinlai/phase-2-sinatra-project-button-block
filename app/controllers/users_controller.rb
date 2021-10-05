class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect to "/#{@user.id}/blocks"
        else
            erb :'users/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect to "/#{session[:user_id]}/blocks"
        else
            erb :'users/login'
        end
    end

    post '/users' do 
        if params[:username] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect to "/#{session[:user_id]}/blocks"
        else
            # do a flash here that the fields are required
            redirect to "/signup"
        end
    end

    post '/login' do
        if params[:username] != "" && params[:password] != ""
            @user = User.find_by(:username => params[:username])
            # will want to make sure password is correct
            session[:user_id] = @user.id
            redirect to "/#{session[:user_id]}/blocks"
        else
            # do a flash here that fields are required
            redirect to "/login"
        end
    end

    post '/logout' do
        session.clear
        redirect to "/login"
    end

end