module Buyer
  class AttachmentsController < Buyer::BaseController

    include AttachmentControllerHelper


    before_action :init_order, :only => [:create]


    def create
      @attachment = @order.attachments.new :file => params[:fileupload]

      @attachment.save
      render :partial => 'attachments/attachment',
        :locals => {:attachment => @attachment.decorate,
          :account => account.to_s}
    end





    private

    def init_order
      @order = Order.find params[:order_id]
    end


    def account
      :buyer
    end

  end
end
