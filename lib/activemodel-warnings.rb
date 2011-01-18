module ActiveModel

  module Warnings

    def warnings()
      @warnings_block = true
      yield
    ensure
      @warnings_block = false
    end

    def validate(*args, &block)
      super
    end

  end
end