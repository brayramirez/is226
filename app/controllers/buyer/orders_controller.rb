module Buyer
  class OrdersController < Buyer::BaseController

    before_action :init_order, :only => [:show, :edit, :update]
    before_action :init_form, :only => [:new, :create]


    def index
      @orders = current_user.orders.by_latest
    end


    def show
    end


    def new
    end


    def create
      if @form.validate params[:order]
        @form.save

        flash[:success] = 'Order successfully created.'
        redirect_to [:buyer, :orders]
      else
        flash[:error] = @form.errors.full_messages
        render :new
      end
    end


    def edit
    end


    def update
      if @form.validate params[:order]
        @form.save

        flash[:success] = 'Order successfully updated.'
        redirect_to [:buyer, @form.model]
      else
        flash[:error] = @form.errors.full_messages
        render :new
      end
    end





    private

    def init_order
      @order = current_user.orders.find params[:id]
    end


    def init_form
      @form = OrderForm.new current_user.orders.build
    end

  end
end
