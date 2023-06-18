Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
  }

  devise_for :end_users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  scope module: :public do
   root to: 'homes#top'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
