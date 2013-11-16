class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  def index
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meals = @mealplan.meals
    #@meals = Meal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    #@meal = Meal.find(params[:id])
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meal = @mealplan.meals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = Meal.new
    @mealplan = Mealplan.find(params[:mealplan_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meal = @mealplan.meals.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meal = @mealplan.meals.build(params[:meal])
    #@meal = Meal.new(params[:meal])

    respond_to do |format|
      if @meal.save
        format.html { redirect_to mealplan_path(@mealplan), notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    #@meal = Meal.find(params[:id])
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meal = @mealplan.meals.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to mealplan_path(@mealplan), notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @mealplan = Mealplan.find(params[:mealplan_id])
    @meal = @mealplan.meals.find(params[:id])

    # @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to mealplan_path(@mealplan) }
      format.json { head :no_content }
    end
  end
end
