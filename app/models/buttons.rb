class Button < ActiveRecord::Base

    belongs_to :block
    
    validates :multiplier, :presence => true
    validates :default, :presence => true
    
    end