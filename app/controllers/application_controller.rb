class ApplicationController < ActionController::Base
  def not_found
 #   raise ActionController::RoutingError.new('Not Found')
 # rescue
    render_404
  end

def render_404
@categories=Category.mostposts
@posts=Post.mylast
@months=Post.months
  respond_to do |format|
    format.html { render :template => "welcome/404",layout: "application", :status => :not_found }
    format.xml  { head :not_found,layout: "application" }
    format.any  { head :not_found,layout: "application" }
  end
end


before_action :setmyvalue
def setmyvalue
@categories=Category.all
end
end
