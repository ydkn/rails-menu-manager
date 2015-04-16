require 'active_support/concern'
require 'rails/menu/manager/menu_item'

module Rails
  module Menu
    module Manager
      module Concern
        extend ActiveSupport::Concern

        included do
          helper_method :current_menu
        end

        def current_menu
          @_menu_item || MenuItem.new(nil)
        end

        private

        def _add_menu_setting(*args)
          opts = args.extract_options!

          path = args.map { |p| p.to_sym }

          @_menu_item = MenuItem.new(path, opts)
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
