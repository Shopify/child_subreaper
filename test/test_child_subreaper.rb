# frozen_string_literal: true

require "test_helper"

class TestChildSubreaper < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ChildSubreaper::VERSION
  end

  if RUBY_PLATFORM =~ /linux/i
    def test_methods_are_defined
      assert ChildSubreaper::AVAILABLE
      assert ChildSubreaper.enable
      assert ChildSubreaper.disable
    end
  else
    def test_methods_are_undefined
      refute ChildSubreaper::AVAILABLE
      refute ChildSubreaper.enable
      refute ChildSubreaper.disable
    end
  end
end
