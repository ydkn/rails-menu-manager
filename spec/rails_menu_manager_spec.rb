require 'spec_helper'
require 'action_controller'

describe RailsMenuManager do
  before do
    ActionController::Base.send(:include, RailsMenuManager::ActionController)
  end

  it 'has a version number' do
    expect(RailsMenuManager::VERSION).not_to be nil
  end

  it 'adds menu method to ActionController::Base' do
    ActionController::Base.new.menu(:foo, :bar)
  end

  it 'is in menu' do
    ctrl = ActionController::Base.new
    ctrl.menu(:foo, :bar)

    expect(ctrl.in_menu?(:foo, :bar)).to be(true)
    expect(ctrl.in_menu?(:foo)).to be(true)
  end

  it 'is not in menu' do
    ctrl = ActionController::Base.new
    ctrl.menu(:foo, :bar)

    expect(ctrl.in_menu?(:bar)).to be(false)
  end
end
