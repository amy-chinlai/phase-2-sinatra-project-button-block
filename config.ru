require './config/environment'
require 'rubygems'
# require 'rack-flash3'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
# use Rack::Flash
use BlocksController
use ButtonsController
use UsersController
run ApplicationController