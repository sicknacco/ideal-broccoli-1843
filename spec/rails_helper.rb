def test_data
  @gard1 = Garden.create!(name: "Park Garden", organic: true)
  @gard2 = Garden.create!(name: "Other Garden", organic: false)

  @plot1 = @gard1.plot.create!(number: 1, size: "Little", direction: "East")
  @plot2 = @gard1.plot.create!(number: 2, size: "Big", direction: "West")

  @plot3 = @gard2.plot.create!(number: 3, size: "Gigantic", direction: "East")
  @plot4 = @gard2.plot.create!(number: 4, size: "Tiny", direction: "East")

  @tomato = Plant.create!(name: "Tomato", description: "Grows like a weed", days_to_harvest: 90)
  @radish = Plant.create!(name: "Rasish", description: "Plain Radish", days_to_harvest: 120)
  @beans = Plant.create!(name: "Beans", description: "Looks like a bean", days_to_harvest: 45)
  @peas = Plant.create!(name: "Peas", description: "Green Peas", days_to_harvest: 34)
  @squash = Plant.create!(name: "Squash", description: "Big yellow ones", days_to_harvest: 100)
  @pineapple = Plant.create!(name: "Pineapple", description: "Grows out of the ground!", days_to_harvest: 60)

  PlotPlant.create!(plot: @plot1, plant:@tomato)
  PlotPlant.create!(plot: @plot1, plant:@peas)
  PlotPlant.create!(plot: @plot1, plant:@beans)

  PlotPlant.create!(plot: @plot2, plant:@beans)
  PlotPlant.create!(plot: @plot2, plant:@pineapple)
  PlotPlant.create!(plot: @plot2, plant:@squash)

  PlotPlant.create!(plot: @plot3, plant:@radish)
  PlotPlant.create!(plot: @plot3, plant:@peas)
  PlotPlant.create!(plot: @plot3, plant:@squash)

  PlotPlant.create!(plot: @plot4, plant:@tomato)
  PlotPlant.create!(plot: @plot4, plant:@pineapple)
  PlotPlant.create!(plot: @plot4, plant:@radish)
end



# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
