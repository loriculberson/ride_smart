# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

RSpec::Core::RakeTask.new(:spec) do |t| 
  t.pattern = Dir.glob('**/*_spec.rb').reject do |path|
    path.include?('vendor')  # tell travis CI to ignore vendor tests
  end 
  # t.rspec_opts = '--format documentation'
end
