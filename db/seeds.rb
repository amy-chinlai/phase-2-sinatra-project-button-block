users_list = {
    "username1" => {
      :email => "username1@mail.com",
      :password => "password"
    },
    "username2" => {
      :email => "user2@mail.com",
      :password => "password"
    }
  }

users_list.each do |username, users_hash|
  p = User.new
  p.username = username
  p.email = users_hash[:email]
  p.password = users_hash[:password]
  p.save
end

blocks_list = {
    "block A" => {
      :donation_type => "HighestPreviousContribution",
      :user_id => 1
    },
    "block B" => {
      :donation_type => "LatestDonationAmount",
      :user_id => 2
    }
  }

blocks_list.each do |name, blocks_hash|
  p = Block.new
  p.name = name
  p.donation_type = blocks_hash[:donation_type]
  p.user_id = blocks_hash[:user_id]
  p.save
end

buttons_list = {
    1 => {
      :default => 5,
      :block_id => 1
    },
    2 => {
        :default => 10,
        :block_id => 1
    },
    3 => {
        :default => 20,
        :block_id => 1
    },
    1 => {
      :default => 15,
      :block_id => 2
    },
    2 => {
        :default => 30,
        :block_id => 2
    },
    3 => {
        :default => 50,
        :block_id => 2
    }
  }

buttons_list.each do |multiplier, buttons_hash|
  p = Button.new
  p.multiplier = multiplier
  p.default = buttons_hash[:default]
  p.block_id = buttons_hash[:block_id]
  p.save
end