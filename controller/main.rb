# Default url mappings are:
# 
# * a controller called Main is mapped on the root of the site: /
# * a controller called Something is mapped on: /something
# 
# If you want to override this, add a line like this inside the class:
#
#  map '/otherurl'
#
# this will force the controller to be mounted on: /otherurl.

class MainController < Controller
  # the index action is called automatically when no other action is specified
  
  

   def presentations
    if  request.post?
        flash[:error] = "Post Detected"
        password = request[:password]
          if password == 'ammpre'
          session[:logged_in] = true
          session[:logged_out] = false
          flash[:error] = "Password Accepted"
            else
            flash[:error] = "Password Incorrect"
            session[:logged_out] = true
            session[:logged_in] = false
            end
        else
        flash[:error] = "No Post Detected"
        session[:logged_out] = true
        session[:logged_in] = false
    end
  end

  def logout
  session[:logged_in] = false
  session[:logged_out] = true
  redirect rs (:presentations)
  end


  def index
    @title = 'Eduventures AMM 2012'
  end

  def agendas
    @title = 'Agendas | Eduventures AMM 2012'
  end

  def registration
    @title = 'Registration | Eduventures AMM 2012'
  end
  
  def sponsors
    @title = 'Sponsors | Eduventures AMM 2012'
  end

  def hotel
    @title = 'Hotel Information | Eduventures AMM 2012'
  end

  def visiting
    @title = 'Visiting Boston | Eduventures AMM 2012'
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Eduventures AMM 2012'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end