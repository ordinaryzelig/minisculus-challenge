$LOAD_PATH.unshift '.'
require 'init.rb'
require 'minitest/unit'
MiniTest::Unit.autorun

class SSPATest < MiniTest::Unit::TestCase

  def self.verify(name, &block)
    define_method "test #{name}", &block
  end

  alias_method :confirm, :assert
  instance_methods.select { |method| method[/^assert_/] }.each do |assert_method|
    method_suffix = assert_method[/^assert_(.*)/, 1]
    alias_method "confirm_#{method_suffix}", "assert_#{method_suffix}"
  end

end
