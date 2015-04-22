require 'rails/railtie'
require 'rails_menu_manager/action_controller'

module RailsMenuManager
  class Railtie < Rails::Railtie
    initializer 'rails-menu-manager' do
      ::ActionController::Base.send(:include, RailsMenuManager::ActionController)
    end
  end
end
