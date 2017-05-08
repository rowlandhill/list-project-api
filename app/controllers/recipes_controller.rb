class RecipesController < ProtectedController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :validate_user

  # GET /recipes
  def index
    @recipes = Recipe.where 'user_id= ?', @current_user.id

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    # require 'pry'
    # binding.pry
    @recipe = current_user.recipes.build(recipe_params)
    # @ingredients = @recipe.ingredients

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    # require 'pry'
    # binding.pry
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      # require 'pry'
      # binding.pry
        @recipe = current_user.recipes.find(params[:id])
      # @recipe = Recipe.find(params[:id])
    end

    def validate_user
      set_current_user
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :servings, :user_id)
    end
end
