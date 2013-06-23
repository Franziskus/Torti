
class StatisticsController < ApplicationController

  # GET /statistics/1
  # GET /statistics/1.json
  def index
    @user = getUser(:statistic);
    @statistic = @user.statistic

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistic }
    end
  end

end
