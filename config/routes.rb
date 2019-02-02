Rails.application.routes.draw do    
    #establecemos el controlador registrations personalizado para usarlo en Devise
    devise_for :users, :controllers => {:registrations => "registrations", sessions: "sessions"}
    resources :user, :controller => "users"

    resources :colors
    resources :companies, only: [:show, :update, :index,:edit] 

    resources :genetic_banks do
        resources :genetic_bank_pictures
    end

    resources :crossings
    resources :seeds
    resources :germinations

    resources :one_offsprings do
        resources :one_offspring_pictures
    end

    resources :two_offsprings do
        resources :two_offspring_pictures
    end

    resources :three_offsprings do
        resources :three_offspring_pictures
    end

    resources :irb_selections do
        resources :irb_selections_pictures
    end

    resources :spek_selections do
        resources :spek_selections_pictures
    end


    resources :conectiflor_selections  do
        resources :conectiflor_pictures
    end

    get 'geneticBankBarCodes'      => 'genetic_banks#generateBarCode'
    get 'crossingsBarCodes'      => 'crossings#generateBarCode'
    get 'seedsBarCodes'      => 'seeds#generateBarCode'
    get 'irbSelectionsBarCodes'      => 'irb_selections#generateBarCode'
    get 'spekSelectionsBarCodes'      => 'spek_selections#generateBarCode'
    get 'conectiflorSelectionsBarCodes'      => 'conectiflor_selections#generateBarCode'

    get 'getCrossing/:id' => 'crossings#getCrossing'
    get 'getCrossings'=> 'crossings#index'
    get 'getCrossingsByYear/:year'=> 'crossings#getCrossingsByYear'
    get 'validRepetition/:info'=> 'crossings#validRepetition'
    get 'codeCrossParents/:text' => 'crossings#codeCrossParents'

    get 'getSeed/:id' => 'seeds#getSeed'
    get 'numSeedsNumRepeat' => 'seeds#numSeedsNumRepeat'
    get 'numSeedsCodeCross' => 'seeds#numSeedsCodeCross'

    get 'numGerminationsNumRepeat' => 'germinations#numGerminationsNumRepeat'
    get 'numGerminationsCodeCross' => 'germinations#numGerminationsCodeCross'

    get 'selectColorTwoOffspring/:id' => 'two_offsprings#selectColor'

    get 'selectColorThreeOffspring/:id' => 'three_offsprings#selectColor'

    get 'selectColorIrbSelections/:id' => 'irb_selections#selectColor'

    #    =============================ROUTES FOR API========================================
    namespace :api , defaults: {format: 'json'} do
        namespace :v1 do
            resources :irb_selections_api, only: [:show, :index]            
            resources :spek_selections_api, only: [:show, :index]
            resources :conectiflor_selections_api, only: [:show, :index]
            resources :companies_api, only: [:show, :index]
            #            resources :genetic_bank_pictures_api
        end
    end

    namespace :api do
        scope :v1 do
            mount_devise_token_auth_for 'User', at: 'auth'
        end
    end

    #    mount_devise_token_auth_for 'User', at: 'api/v1/auth'



    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    root 'genetic_banks#index'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'

    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    # Example resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Example resource route with options:
    #   resources :products do
    #     member do
    #       get 'short'
    #       post 'toggle'
    #     end
    #
    #     collection do
    #       get 'sold'
    #     end
    #   end

    # Example resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Example resource route with more complex sub-resources:
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', on: :collection
    #     end
    #   end

    # Example resource route with concerns:
    #   concern :toggleable do
    #     post 'toggle'
    #   end
    #   resources :posts, concerns: :toggleable
    #   resources :photos, concerns: :toggleable

    # Example resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
end
