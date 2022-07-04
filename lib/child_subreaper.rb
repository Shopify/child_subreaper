# frozen_string_literal: true

require "child_subreaper/version"

module ChildSubreaper
  AVAILABLE = begin
    require "child_subreaper/child_subreaper"
    true
  rescue LoadError
    false
  end

  unless AVAILABLE
    def self.enable
      false
    end

    def self.disable
      false
    end
  end
end
