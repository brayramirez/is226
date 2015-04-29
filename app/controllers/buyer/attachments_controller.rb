module Buyer
  class AttachmentsController < Buyer::BaseController

    include AttachmentControllerHelper





    private

    def init_owner
      @owner = Order.find params[:order_id]
    end


    def account
      :buyer
    end

  end
end
