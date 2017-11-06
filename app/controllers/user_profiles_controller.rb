class UserProfilesController < ApplicationController

  load_and_authorize_resource

  skip_before_action :check_registration_finished, only: [:new, :create]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
  end

  # GET /user_profiles/new
  def new
  end

  # GET /user_profiles/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'Su perfil ha sido creado exitosamente' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'Su perfil ha sido actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :birthdate, :about, :experience, :city, :phone, :role,
      :avatar).merge user: current_user
  end

end
