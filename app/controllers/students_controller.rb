require 'digest/md5'
class StudentsController < ApplicationController

  def student_url(id)
    "students"
  end

  def index
    @re_st = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @re_st }
    end
  end

  # GET /registerd_users/new
  # GET /registerd_users/new.json
  def new
    @re_st = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_st }
    end
  end

  def validate
    @re_st = Student.find(params[:id])
    @genTime = Time.at(params["reNum"].to_i)
    if @genTime == @re_st.registerdSince
      @re_st.registerdSince = Time.new;
      @re_st.save
      @good = true;
    else
      @good = false
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @re_st }
    end
  end


  # POST /registerd_users
  # POST /registerd_users.json
  def create
    @re_st = Student.new(params[:registerd_student])
    pass = Digest::MD5.hexdigest(params[:password]).to_s
    @re_st.password = pass
    @re_st.email = (params[:email])
    @re_st.registerdSince = Time.at(-Random.rand(10));
    @re_st.create_statistic()
    respond_to do |format|
      if @re_st.save
        #format.html { redirect_to @re_st, notice: 'Registerd user was successfully created.' }
        format.html { render action: "show_validation_link"  }
        format.json { render json: @re_st, status: :created, location: @re_st }
      else
        format.html { render action: "new" }
        format.json { render json: @re_st.errors, status: :unprocessable_entity }
      end
    end
  end
end
