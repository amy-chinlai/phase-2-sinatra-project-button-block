# Liquid Button Block Builder
### Flatiron software engineering, phase 2 project

This Sinatra project provides a web app that outputs liquid that modifies someone's highest previous contribution or last donation amount. This liquid is meant to work with Action Network's email and mobile messaging tool (https://actionnetwork.org/).

A user must create a unique username and a password. Then the user can create blocks, which contain a collection of buttons. The buttons ask for the user to input a multiplier and default that will be part of the output that can be copy and pasted into your email or mobile message.


## Installation

Go to https://github.com/amy-chinlai/phase-2-sinatra-project-button-block and clone the repository to your local machine.

Run `bundle install`.

Run `rake db:migrate`.

Run `rake db:seed`.




## Usage

Type the below and follow the instructions to login or signup.

    $ shotgun

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amy-chinlai/phase-2-sinatra-project-button-block. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
