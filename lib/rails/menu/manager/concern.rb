require 'active_support/concern'
require 'rails/menu/manager/menu_item'

module Rails
  module Menu
    module Manager
      module Concern
        extend ActiveSupport::Concern

        included do
          helper_method :'in_menu?'
        end

        def in_menu?(*args)
          _menu_items.each do |menu|
            return true if menu.in?(*args)
          end

          false
        end

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
  end
end
