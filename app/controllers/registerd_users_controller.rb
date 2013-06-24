class RegisterdUsersController < ApplicationController
  # GET /registerd_users
  # GET /registerd_users.json
  def index
    @registerd_users = RegisterdUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registerd_users }
    end
  end

  # GET /registerd_users/1
  # GET /registerd_users/1.json
  def show
    @registerd_user = RegisterdUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registerd_user }
    end
  end

  # GET /registerd_users/new
  # GET /registerd_users/new.json
  def new
    @registerd_user = RegisterdUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registerd_user }
    end
  end

  # GET /registerd_users/1/edit
  def edit
    @registerd_user = RegisterdUser.find(params[:id])
  end

  # POST /registerd_users
  # POST /registerd_users.json
  def create
    @registerd_user = RegisterdUser.new(params[:registerd_user])

    respond_to do |format|
      if @registerd_user.save
        format.html { redirect_to @registerd_user, notice: 'Registerd user was successfully created.' }
        format.json { render json: @registerd_user, status: :created, location: @registerd_user }
      else
        format.html { render action: "new" }
        format.json { render json: @registerd_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registerd_users/1
  # PUT /registerd_users/1.json
  def update
    @registerd_user = RegisterdUser.find(params[:id])

    respond_to do |format|
      if @registerd_user.update_attributes(params[:registerd_user])
        format.html { redirect_to @registerd_user, notice: 'Registerd user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registerd_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registerd_users/1
  # DELETE /registerd_users/1.json
  def destroy
    @registerd_user = RegisterdUser.find(params[:id])
    @registerd_user.destroy

    respond_to do |format|
      format.html { redirect_to registerd_users_url }
      format.json { head :no_content }
    end
  end
end
