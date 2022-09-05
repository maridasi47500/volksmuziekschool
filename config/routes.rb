Rails.application.routes.draw do
  get 'aboutus/index'
  get 'aboutus/more'
  get 'aboutus/partners'
  get 'welcome/mesicones'
  get 'musiclesson/index'
  get 'musiclesson/signup'
  get 'blog/index'
  get 'blog/show'
get "/media/:yyyy/:mm/:image", to: "welcome#image"

post "/wp-comments-post.php",to:"blog#createcomment"
root to: "welcome#index"
get "category/:name", to: "blog#categoryshow",as: :category
get "author/:name", to:"blog#authorshow",as: :author 
  get 'overons', to: "aboutus#index"
  get 'more', to: "aboutus#more"
  get 'partners', to: "aboutus#partners"
  get 'missievisie', to: "welcome#missionvision"
  get 'muzieklessen', to: "musiclesson#index"
  get 'contact', to: "welcome#contact"
  get 'inschrivjen', to: "musiclesson#signup"
  get 'blog', to: "blog#index"
  get 'welcome/index'
 
get ":yyyy/:mm/:dd/:title", to: "blog#show", as: :post
get ":yyyy/:mm", to: "blog#month", as: :month
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
