task :default => :test

task :test do
  require './init'
  Dir.foreach(ROOT_PATH + '/test') do |test|
    next unless test.match(/\.rb$/)
    sh "ruby -I test/ test/#{test}"
  end
end
