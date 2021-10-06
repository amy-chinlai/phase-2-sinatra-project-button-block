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
            if !@user.valid?
                # do a flash here that a user with that info already exists
                redirect to "/login"
            else
                session[:user_id] = @user.id
                redirect to "/#{session[:user_id]}/blocks"
            end
        end
    end

    post '/login' do
        if user = User.validate_login(params)
            session[:user_id] = user.id
            redirect to "/#{session[:user_id]}/blocks"
        else
            # do a flash here that fields are wrong
            redirect to "/login"
        end
    end

    post '/logout' do
        session.clear
        redirect to "/login"
    end

end