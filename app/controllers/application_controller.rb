require 'rack-flash'
class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    use Rack::Flash
    
  
    get '/' do
      erb :index
    end

    not_found do
      'The page you are looking for does not exist. I hope you find what you are looking for (both here and in life generally).'
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
        if request.path =~ /blocks\/\d+\/buttons/
          "<a href='/#{session[:user_id]}/blocks'>Return to Blocks</a> > <a href='/#{session[:user_id]}/blocks/#{@block.id}'>#{@block.name}</a>" 
        elsif request.path =~ /blocks\//
          "<a href='/#{session[:user_id]}/blocks'>Return to Blocks</a>"   
        end
      end


    end

  
  end