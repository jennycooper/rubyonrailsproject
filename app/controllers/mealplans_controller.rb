class MealplansController < ApplicationController
  require 'Calendar'
  # GET /mealplans
  # GET /mealplans.json
  def index
    @mealplans = Mealplan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mealplans }
    end
  end

  # GET /mealplans/1
  # GET /mealplans/1.json
  def show
    if current_user && current_user.admin
      @mealplan = Mealplan.find(params[:id]) #.find(params[:id])
      @mymeals = @mealplan.meals.order(:day)
    elsif  current_user.id == params[:id].to_i
      @mealplan = Mealplan.find(params[:id])
      @mymeals = @mealplan.meals.order(:day)
    else
      redirect_to mealplan_path(current_user.id), alert: "You can't do that!!!"
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mealplan }
    end
  end

  # GET /mealplans/new
  # GET /mealplans/new.json
  def new
    @mealplan = Mealplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mealplan }
    end
  end

  # GET /mealplans/1/edit
  def edit
     if current_user && current_user.admin
       @mealplan = Mealplan.find(params[:id]) #.find(params[:id])
    else
      redirect_to mealplan_path(current_user.id), alert: "You can't do that!!!"
      return
    end
  end

  # POST /mealplans
  # POST /mealplans.json
  def create
    @mealplan = Mealplan.new(params[:mealplan])

    respond_to do |format|
      if @mealplan.save
        format.html { redirect_to @mealplan, notice: 'Mealplan was successfully created.' }
        format.json { render json: @mealplan, status: :created, location: @mealplan }
      else
        format.html { render action: "new" }
        format.json { render json: @mealplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mealplans/1
  # PUT /mealplans/1.json
  def update
    @mealplan = Mealplan.find(params[:id])

    respond_to do |format|
      if @mealplan.update_attributes(params[:mealplan])
        format.html { redirect_to @mealplan, notice: 'Mealplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mealplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mealplans/1
  # DELETE /mealplans/1.json
  def destroy
    @user = User.find(params[:user_id])
    @mealplan = Mealplan.find(params[:id])
    #@mealplan.destroy
    user.destroy

    respond_to do |format|
      format.html { redirect_to mealplans_url }
      format.json { head :no_content }
    end
  end

  def delete_user
    @user = User.find(params[:id])
    @mealplan = Mealplan.find_by_user_id(params[:id])
    @diary = Diary.find_by_user_id(params[:id])
    @mealplan.destroy
    @user.destroy
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to mealplans_url }
      format.json { head :no_content }
    end
  end
end
