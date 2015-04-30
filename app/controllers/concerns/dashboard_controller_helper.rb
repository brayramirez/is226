module DashboardControllerHelper

  extend ActiveSupport::Concern


  def self.included base
    base.module_eval do
      before_filter :init_dashboard, :only => [:index]
    end
  end


  private

  def init_dashboard
    @activities = Dashboard.new(current_role).recent_activities
  end

end
