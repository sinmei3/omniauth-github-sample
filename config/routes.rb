Rails.application.routes.draw do
  root to: "home#index"
  get "/auth/:provider/callback" => "sessions#callback"
  get "/signout" => "sessions#destroy"
end
