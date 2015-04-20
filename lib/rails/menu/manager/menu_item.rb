module Rails
  module Menu
    module Manager
      class MenuItem
        attr_reader :path, :options

        def initialize(path, options = {})
          @path     = path
          @path_str = path.join('#')
          @options  = options
        end

        def in?(*args)
          return false if path.nil?

          !!(@path_str =~ /\A#{args.join('#')}/i)
        end
      end
    end
  end
end
