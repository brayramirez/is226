module CommentControllerHelper

  extend ActiveSupport::Concern


  def self.included base
    base.module_eval do

      layout false

      before_filter :init_bid, :only => [:create]
      before_filter :init_comment, :only => [:create]
      before_filter :init_form, :only => [:create]
    end
  end


  def create
    if @form.validate params[:comment]
      @form.save

      render :partial => 'comments/comment',
        :locals => {:comment => @form.model.decorate, :commenter => current_user}
    else
      render :json => {:error => @form.model.errors.full_messages},
        :status => :bad_request
    end
  end





  private

  def init_bid
    @bid = Bid.find params[:bid_id]
  end


  def init_comment
    @comment = @bid.comments.new :commenter => current_user
  end


  def init_form
    @form = CommentForm.new @comment
  end

end
