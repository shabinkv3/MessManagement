Rails.application.routes.draw do

	get '', to: 'accounts#login'
	get 'accounts/login', to: 'accounts#login', as: 'login'
	get 'accounts/signup/mess', to: 'accounts#signupMess', as: 'signup_mess'
	get 'accounts/signup/student', to: 'accounts#signupStudent', as: 'signup_student'
	post 'accounts/signup/mess', to: 'accounts#createMess', as: 'create_mess'

	get 'accounts/check', to: 'accounts#check', as: 'check'
	post 'mess/extra', to: 'mess#createEntry', as: 'create_extra'
	post 'mess/addguest', to: 'mess#addGuest', as: 'add_guest'

	get 'mess/dashboard', to: 'mess#dashboard', as: 'mess_dash'
	get 'accounts/logout', to: 'accounts#logout', as: 'logout'
	post 'accounts/loginMess', to: 'accounts#authenticateMess', as: 'authenticateMess'
    post 'accounts/signup/student', to: 'accounts#createStudent', as: 'create_student'
	get 'student/dashboard', to: 'student#dashboard', as: 'student_dash'
	post 'accounts/login', to: 'accounts#authenticate', as: 'authenticate'

	get 'studentdata', to: 'student#dataGet'
	post 'studentdata', to: 'student#dataPost'
	post 'createstaff', to: 'mess#createStaff', as: 'create_staff'
	post 'deletestaff', to: 'mess#deleteStaff', as: 'delete_staff'
	get 'staffdata', to: 'mess#staffData'

	post 'extradata', to: 'student#getExtraList'
	post 'guestdata', to: 'student#getGuestList'
	post 'studentprofile', to: 'student#studentProfile'

	post 'feestructure', to: 'student#getFee'
	get 'messCut', to:'mess#messcutMess'


	post 'student/messcut', to: 'student#createMessCut', as: 'create_messcut'
	post 'messcutdata', to: 'student#messCutData'







  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
