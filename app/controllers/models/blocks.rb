class Block < ActiveRecord::Base

    has_many :buttons
    belongs_to :user
    
    
    end