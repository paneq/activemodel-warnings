require 'active_model'

module ActiveModel

  module Warnings

    attr_accessor :skip_warnings

    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods

      def warnings()
        @warnings_block = true
        yield
      ensure
        @warnings_block = false
      end

      def validate(*args, &block)
        options = args.extract_options!

        if options[:warning] || @warnings_block
          options = options.dup
          options[:warning] ||= @warnings_block
          options[:if] = Array.wrap(options[:if])
          options[:if] << "skip_warnings != true"
        end
        args << options

        super
      end

      def validates_with(*args, &block)
        options = args.extract_options!

        if options[:warning] || @warnings_block
          options = options.dup
          options[:warning] ||= @warnings_block
        end
        args << options
        super
      end

    end # ClassMethods

  end # Warnings

end # ActiveModel
