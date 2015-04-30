module Buyer
  class OrdersController < Buyer::BaseController

    before_action :init_order, :only => [:show, :edit, :update, :close]
    before_action :init_new_form, :only => [:new, :create]
    before_action :init_edit_form, :only => [:edit, :update]


    def index
      @state = params[:state].present? ? params[:state].to_sym : nil
      @orders = current_role.orders.by_status @state
    end


    def show
    end


    def new
    end


    def create
      if @form.validate params[:order]
        @form.save

        flash[:success] = 'Order successfully created.'
        redirect_to [:buyer, @form.model]
      else
        flash[:error] = @form.errors.full_messages
        render :new
      end
    end


    def edit
      if @order.non_editable?
        flash[:error] = "Order is already #{@order.decorate.simple_status} and is no longer editable."
        redirect_to [:buyer, @order]
      end
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


    def close
      OrderClosingSupport.new(@order).close!

      flash[:notice] = 'Order closed.'
      redirect_to [:buyer, @order]
    end





    private

    def init_order
      @order = current_role.orders.find params[:id]
    end


    def init_new_form
      @form = OrderForm.new current_role.orders.build
    end


    def init_edit_form
      @form = OrderForm.new @order
    end

  end
end
