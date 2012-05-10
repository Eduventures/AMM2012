class PresentationsController < Ramaze::Controller
    map '/presentations'
    layout :default
    def authenticate(password)
    
    end

    def index
        # If this was from a post, we grab the information out of the request hash
        # and create a new Poll and however many we receive responses. We add the responses
        # to the poll, set the flash message, and then stay on this page in case the 
        # user wants to add more polls.
        if  request.post?
            flash[:error] = "Post Detected"
            password = request[:password]
            if password = 'ammpre'
                session[:logged_in] = true
                flash[:error] = "Password Accepted"
            else
                flash[:error] = "Password Incorrect"
                
            end
            redirect rs(:index)
        else
            flash[:error] = "No Post Detected"
        end
    end
end