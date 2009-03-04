require 'rake'
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test Getting Real (daily).'
Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Publish it to the production server.'
verbose true
task :publish do
  sh("scp generate_getting_real_daily_feed.rb rss.gif gettingrealdaily.com:~/gettingrealdaily.com")
end