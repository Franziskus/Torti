
class StatisticsController < ApplicationController

  # GET /statistics/1
  # GET /statistics/1.json
  def index
    if(session[:user] == nil)
      session[:beforeLogin] = :statistic;
      redirect_to :login_login;
    end
    @statistic = session[:user].statistic

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistic }
    end
  end

end
