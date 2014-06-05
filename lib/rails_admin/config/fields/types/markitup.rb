require 'rails_admin/config/fields/types'
require 'rails_admin/config/fields/types/text'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Markitup < RailsAdmin::Config::Fields::Types::Text
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :config_options do
            {
              js_theme_path: ActionController::Base.helpers.asset_path('markitup/sets/markdown/set.js'),
              css_theme_path: ActionController::Base.helpers.asset_path('markitup/sets/markdown/style.scss')
            }
          end

          register_instance_option :css_location do
            ActionController::Base.helpers.asset_path('markitup/skins/simple/style.scss')
          end

          register_instance_option :js_location do
            ActionController::Base.helpers.asset_path('markitup.js')
          end

          register_instance_option :partial do
            :form_markitup
          end

          [:config_options, :css_location, :js_location].each do |key|
            register_deprecated_instance_option :"markitup_#{key}", key
          end
        end
      end
    end
  end
end
