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

    initializer 'RailsAdminMarkitup precompile hook', group: :all do |app|

      app.config.assets.precompile += %w[
        markitup.js
        markitup/sets/markdown/set.js
        markitup/sets/markdown/style.scss
      ]
    end
  end
end