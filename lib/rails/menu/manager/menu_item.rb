module Rails
  module Menu
    module Manager
      class MenuItem
        attr_reader :path, :options

        def initialize(path, options = {})
          @path    = path
          @options = options
        end

        def contains?(*args)
          return false if path.nil?

          !!(path.join('#') =~ /\A#{args.join('#')}\Z/)
        end
      end
    end
  end
end
