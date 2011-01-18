require 'activemodel-warnings'

module ActiveModel
  module Warnings
    def skip_warnings=(v)
      @skip_warnings = Boolean(v)
    end
  end
end
