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
  def index
    @title = 'Eduventures AMM 2012'
  end

  def agendas
    @title = 'Agendas | Eduventures AMM 2012'
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

def login
  @title = "Login"
  redirect_referer if logged_in?
  return unless request.post?
  user_login(request.subset(:login, :password))
  redirect MainController.r(:index)
end

def register
  @title = "Register for an account"

  if request.post?
    @user = ::User.new
    @user[:email] = request[:email]
    @user.password = request[:password]
    @user.password_confirmation = request[:password_confirmation]
    @user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_f}-#{user.email}--")

    if @user.save
      flash[:message] = 'Account created, feel free to login below'
      redirect MainController.r(:index)
    end
  end
end

def logout
  flash[:message] = "Logged out"
  user_logout
end


  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Eduventures AMM 2012'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end
