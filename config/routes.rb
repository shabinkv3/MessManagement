Rails.application.routes.draw do

  get 'student/dashboardd'
	get 'accounts/login', to: 'accounts#login', as: 'login'
	post 'accounts/login', to: 'accounts#authenticate', as: 'authenticate'
	get 'accounts/logout', to: 'accounts#logout', as: 'logout'

    get 'student/dashboard', to: 'student#dashboard', as: 'student_dash'
    get 'accounts/signup/student', to: 'accounts#signupStudent', as: 'signup_student'
    post 'accounts/signup/student', to: 'accounts#createStudent', as: 'create_student'



end
