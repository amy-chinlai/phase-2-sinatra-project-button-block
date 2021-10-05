require './config/environment'
require "easy_breadcrumbs"


if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BlocksController
use ButtonsController
use UsersController
run ApplicationController