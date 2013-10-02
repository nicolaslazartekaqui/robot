task :test do
  sh "script/test"
end

task :run do
  sh "script/robot < config/instructions.in"
end

task :default => [:run]
