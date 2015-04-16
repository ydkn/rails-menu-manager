require 'rails/railtie'
require 'rails/menu/manager/concern'

module Rails
  module Menu
    module Manager
      class Railtie < Rails::Railtie
        initializer 'rails-menu-manager' do
          ActionController::Base.send(:include, Rails::Menu::Manager::Concern)
        end
      end
    end
  end
end
