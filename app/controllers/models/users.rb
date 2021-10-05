class User < ActiveRecord::Base

has_secure_password

has_many :blocks
has_many :buttons, through: :blocks


end