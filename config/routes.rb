require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/generate' => 'verifications#generate_code'
	post '/verify' => 'verifications#verify_code'
	post '/future' => 'verifications#send_futuresms'
	
	mount Sidekiq::Web => '/sidekiq'
	# mount SidekiqScheduler::Web => '/sidekiqs'
end
