require 'activemodel-warnings'
require 'global_boolean'

module ActiveModel
  module Warnings
    def skip_warnings=(v)
      @skip_warnings = GlobalBoolean.Boolean(v)
    end
  end
end
