Rails.application.routes.draw do

	get '', to: 'accounts#login'
	get 'accounts/signup/mess', to: 'accounts#signupMess', as: 'signup_mess'
	get 'accounts/signup/student', to: 'accounts#signupStudent', as: 'signup_student'
	post 'accounts/signup/mess', to: 'accounts#createMess', as: 'create_mess'

	get 'accounts/check', to: 'accounts#check', as: 'check'
	post 'accounts/extra', to: 'accounts#createEntry', as: 'create_extra'

	get 'mess/dashboard', to: 'mess#dashboard', as: 'mess_dash'
	get 'accounts/logout', to: 'accounts#logout', as: 'logout'
	get 'accounts/login', to: 'accounts#login', as: 'login'
	get 'accounts/loginMess', to: 'accounts#loginMess', as: 'loginMess'
	post 'accounts/loginMess', to: 'accounts#authenticateMess', as: 'authenticateMess'
    post 'accounts/signup/student', to: 'accounts#createStudent', as: 'create_student'
	get 'student/dashboard', to: 'student#dashboard', as: 'student_dash'
	post 'accounts/login', to: 'accounts#authenticate', as: 'authenticate'

	get 'studentdata', to: 'student#dataGet'
	post 'studentdata', to: 'student#dataPost'







  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
