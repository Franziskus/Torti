require 'digest/md5'

class LoginController < ApplicationController

  before_filter :set_locale

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  public
  def login
    @error = ""
    if(params[:username] != nil)
      @user = RegisterdUser.find_by_email(params[:username])
      if(@user == nil || @user.nil? || @user == nil.class)
        @error = "No User with "+params[:username]+" found."
      else
        if(@user.registerdSince.to_i < 1)
          @error = "User needs to validate his E-mail first."
        elsif params[:password] != nil && @user.password == Digest::MD5.hexdigest(params[:password]).to_s
          session[:user] = @user
          if(session[:beforeLogin] == nil)
            redirect_to(:action => 'default')
          else
            redirect_to(session[:beforeLogin])
          end
        else
          @error = "Can find user but passwords not equal."
       end
      end
    end
  end

  def default
    if(session[:user] == nil)
      session[:beforeLogin] = :login_default;
      redirect_to :login_login;
    end
  end

  def logout
     session.delete(:user)
  end
end
