require 'rails_admin'
require 'markitup-rails'
require 'redcarpet'
require 'rails_admin_markitup'

module RailsAdminMarkitup
  class Engine < Rails::Engine
    isolate_namespace RailsAdminMarkitup
    initializer "RailsAdminMarkitup.view_helpers" do
      ActionView::Base.send :include, RailsAdminMarkitup::ViewHelpers
    end
  end
end