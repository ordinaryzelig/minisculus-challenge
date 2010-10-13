task :default => :test

task :test do
  require './init'
  Dir.foreach(ROOT_PATH + '/test') do |test|
    next unless test.match(/\.rb$/)
    begin
      sh "ruby -I test/ test/#{test}"
    rescue
      continue
    end
  end
end
