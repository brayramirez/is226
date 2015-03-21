module Admin
  class CategoriesController < Admin::BaseController

    def index
      @categories = Category.alphabetical
    end


    def new
      @category = Category.new
    end


    def create
      @category = Category.new category_params

      if @category.save
        redirect_to [:admin, :categories]
      else
        flash[:error] = @category.errors.full_messages
        render :new
      end
    end





    private

    def category_params
      params.require(:category).permit :name
    end

  end
end
