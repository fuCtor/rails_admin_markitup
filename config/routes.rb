Rails.application.routes.draw do
  mount Markitup::Rails::Engine, at: "markitup", as: "markitup"
end