class Block < ActiveRecord::Base

    has_many :buttons
    belongs_to :user

    validates :name, :presence => true
    validates :donation_type, :presence => true

    def liquid_output
        puts buttons
        buttons.map do |button|
            # what I want the output to look like
            # basic: {{ HighestPreviousContribution | times: 1 | default: 5 }}
            "{{ #{donation_type} | times: #{button.multiplier} | default: #{button.default} }}<br>"
        end
    end
    
    
    end