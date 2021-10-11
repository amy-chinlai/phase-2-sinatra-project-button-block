require './config/environment'
require 'rubygems'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BlocksController
use ButtonsController
use UsersController

map "/public" do
  run Rack::Directory.new("./public")
end