module AttachmentControllerHelper

  extend ActiveSupport::Concern


  def self.included base
    base.module_eval do

      layout false

      before_action :init_attachment, :only => [:show, :destroy]
    end
  end


  def show
    @attachment.file.url
  end


  def destroy
    @attachment.destroy

    redirect_to [account, @attachment.owner]
  end





  private

  def init_attachment
    @attachment = Attachment.find params[:id]
  end

end
