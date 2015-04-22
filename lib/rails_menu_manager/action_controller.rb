require 'active_support/concern'
require 'rails_menu_manager/menu_item'

module RailsMenuManager
  module ActionController
    extend ActiveSupport::Concern

    included do
      helper_method :'in_menu?'
    end

    # Checks if a at least one defined and active menu is in given path
    #
    # @param [Array] Menu path to check
    # @return [Boolean] Boolean indicating if at least one menu item is in path
    def in_menu?(*args)
      _menu_items.each do |menu|
        return true if menu.in?(*args)
      end

      false
    end

    # Adds a menu
    # Supports before_action options: if, only, unless, except
    #
    # @param [Array/Hash] Menu path and options.
    def menu(*args)
      _add_menu_setting(*args)
    end

    private

    def _menu_items
      @_menu_items ||= []
    end

    def _add_menu_setting(*args)
      opts = args.extract_options!

      path = args.map { |p| p.to_sym }

      _menu_items << MenuItem.new(path, opts)
    end

    module ClassMethods
      def menu(*args)
        opts = args.extract_options!

        before_action_opts = {
          only:   opts.delete(:only),
          if:     opts.delete(:if),
          except: opts.delete(:except),
          unless: opts.delete(:unless)
        }

        before_action before_action_opts do
          _add_menu_setting(*args, opts)
        end
      end
    end
  end
end
