Rails.application.routes.draw do

	get 'accounts/login', to: 'accounts#login', as: 'login'
	post 'accounts/login', to: 'accounts#authenticate', as: 'authenticate'
	get 'accounts/logout', to: 'accounts#logout', as: 'logout'

    get 'student/dashboard', to: 'student#dashboard', as: 'student_dash'
    get 'accounts/signup/student', to: 'accounts#signupStudent', as: 'signup_student'
    post 'accounts/signup/student', to: 'accounts#createStudent', as: 'create_student'

    get 'testing', to: 'testing#testing', as: 'testing'
    get 'dashboard', to: 'testing#dashboard', as: 'dashboard'
    get 'icons', to: 'testing#icons', as: 'icons'
    get 'notifications', to: 'testing#notifications', as: 'notifications'
    get 'maps', to: 'testing#maps', as: 'maps'
    get 'table', to: 'testing#table', as: 'table'
    get 'user', to: 'testing#user', as: 'user'
    get 'typography', to: 'testing#typography', as: 'typography'



end
