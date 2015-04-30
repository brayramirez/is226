module AttachmentControllerHelper

  extend ActiveSupport::Concern


  def self.included base
    base.module_eval do

      layout false


      before_action :init_owner, :only => [:create]
      before_action :init_attachment, :only => [:show, :destroy]
    end
  end


  def show
    @attachment.file.url
  end



  def create
    @attachment = @owner.attachments.new :file => params[:fileupload]

    if @attachment.save
      render :partial => 'attachments/attachment',
        :locals => {:attachment => @attachment.decorate,
          :account => account.to_s}
    else
      render :json => {:error => @attachment.errors.full_messages},
        :status => :bad_request
    end
  end


  def destroy
    @attachment.destroy

    flash[:notice] = 'Attachment successfully deleted.'
    redirect_to [account, @attachment.owner]
  end





  private

  def init_attachment
    @attachment = Attachment.find params[:id]
  end

end
