class RegisterStudentController < ApplicationController

  # GET /registerd_users/new
  # GET /registerd_users/new.json
  def new
    @re_st = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_st }
    end
  end


  # POST /registerd_users
  # POST /registerd_users.json
  def create
    @re_st = Student.new(params[:registerd_student])
    @re_st.registerdSince = Time.at(Random.rand(99999));
    respond_to do |format|
      if @re_st.save
        format.html { redirect_to @re_st, notice: 'Registerd user was successfully created.' }
        format.json { render json: @re_st, status: :created, location: @re_st }
      else
        format.html { render action: "new" }
        format.json { render json: @re_st.errors, status: :unprocessable_entity }
      end
    end
  end
end
