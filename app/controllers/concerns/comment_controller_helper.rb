module CommentControllerHelper

  extend ActiveSupport::Concern


  def self.included base
    base.module_eval do

      layout false

      before_filter :init_bid, :only => [:create]
      before_filter :init_comment, :only => [:create]
    end
  end


  def create
    @comment.assign_attributes comment_params

    if @comment.save
      render :partial => 'comments/comment',
        :locals => {:comment => @comment.decorate, :commenter => current_user}
    else
      render :json => {:error => @comment.errors.full_messages},
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


  def comment_params
    params.require(:comment).permit(:content)
  end

end
