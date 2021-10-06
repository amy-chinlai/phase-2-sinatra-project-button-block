class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    
  
    get '/' do
      erb :index
    end

    helpers do

      def logged_in?
        !!current_user
      end

      def current_user
        User.find_by_id(session[:user_id]) if session[:user_id]
      end

      def user_by_param
        @user = User.find_by_id(params[:id])
      end

      def authenticated?
        logged_in? && user_by_param == current_user
      end

      def render_breadcrumbs
        if request.path =~ /blocks\/\d+\/buttons\/\d+/
          "<a href='/#{session[:user_id]}/blocks'>Return to Blocks</a> > <a href='/#{session[:user_id]}/blocks/#{@button.block.id}'>#{@button.block.name}</a>" 
        elsif request.path =~ /blocks\//
          "<a href='/#{session[:user_id]}/blocks'>Return to Blocks</a>"   
        end
      end


    end

  
  end