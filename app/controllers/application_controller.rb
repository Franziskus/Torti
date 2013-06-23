class ApplicationController < ActionController::Base
  protect_from_forgery

  public
  def getUser(currentAction)
    if(session[:userId] == nil)
      session[:beforeLogin] = currentAction;
      redirect_to :login_login;
    else
      return RegisterdUser.find_by_id(session[:userId]);
    end
  end
end
