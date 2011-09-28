require 'cucumber/rake/task'

namespace :cucumber do

  Cucumber::Rake::Task.new(:features, "Run all features") do |t|
    t.cucumber_opts = "--format pretty"
    t.profile = "default"
  end

  Cucumber::Rake::Task.new(:wip, "Run @wip features") do |t|
    t.cucumber_opts = "--format pretty"
    t.profile = "wip"
  end

end

