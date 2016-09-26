module RailsMenuManager
  class MenuItem
    PATH_SEPARATOR = 0x1F.chr

    attr_reader :path, :options

    def initialize(path, options = {})
      @path    = path
      @options = options
    end

    def in?(*args)
      return false if path.nil?

      !!(path_as_string(path) =~ /\A#{path_as_string(args)}/i)
    end

    private

    def path_as_string(path)
      path.join(PATH_SEPARATOR) + PATH_SEPARATOR
    end
  end
end
