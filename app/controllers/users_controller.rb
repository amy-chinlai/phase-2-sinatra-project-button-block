class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do 
        if params[:username] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect to "/blocks"
        else
            # do a flash here that the fields are required
            redirect to "/signup"
        end
    end

end