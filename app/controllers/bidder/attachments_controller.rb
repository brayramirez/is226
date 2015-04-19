module Bidder
  class AttachmentsController < Bidder::BaseController

    include AttachmentControllerHelper


    before_action :init_bid, :only => [:create]


    def create
      @attachment = @bid.attachments.new :file => params[:fileupload]

      @attachment.save
      render :partial => 'attachments/attachment',
        :locals => {:attachment => @attachment.decorate,
          :account => account.to_s}
    end





    private

    def init_bid
      @bid = Bid.find params[:bid_id]
    end


    def account
      :bidder
    end

  end
end
