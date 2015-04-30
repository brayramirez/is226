module Bidder
  class AttachmentsController < Bidder::BaseController

    include AttachmentControllerHelper


    # before_action :init_bid, :only => [:create]


    # def create
    #   @attachment = @bid.attachments.new :file => params[:fileupload]

    #   if @attachment.save
    #     render :partial => 'attachments/attachment',
    #       :locals => {:attachment => @attachment.decorate,
    #         :account => account.to_s}
    #   else
    #     render :json => {:error => @attachment.errors.full_messages},
    #       :status => :bad_request
    #   end
    # end





    private

    def init_owner
      @owner = Bid.find params[:bid_id]
    end


    def account
      :bidder
    end

  end
end
