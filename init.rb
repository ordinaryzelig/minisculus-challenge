ROOT_PATH = File.dirname(__FILE__)

# load lib.
$LOAD_PATH.unshift ROOT_PATH + '/lib'
Dir.foreach(ROOT_PATH + '/lib') do |file_name|
  next unless file_name.match(/\.rb$/)
  require file_name
end
