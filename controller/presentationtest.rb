class PresentationsController < Ramaze::Controller
	map '/presentations'
 	def authenticate(password)
 		if password = 'ammpresentations'
 			session[:logged_in] = true
 		end
 	end
end