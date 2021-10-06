class User < ActiveRecord::Base

has_secure_password

has_many :blocks
has_many :buttons, through: :blocks


validates :username, :presence => true, 
                     :uniqueness => true
validates :email,    :presence => true,
                     :uniqueness => true,
                     :format => { :with => /\w+@\w+\.\w+/ }
validates :password, :presence => true

    def self.validate_login(params)
        user = User.find_by(:username => params[:username])
        user.authenticate(params[:password])
    end
end