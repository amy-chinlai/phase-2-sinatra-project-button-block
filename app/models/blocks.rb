class Block < ActiveRecord::Base

    has_many :buttons
    belongs_to :user

    validates :name, :presence => true
    validates :donation_type, :presence => true
    
    
    end