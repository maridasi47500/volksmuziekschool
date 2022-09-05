class BlogController < ApplicationController
protect_from_forgery except: [:createcomment]
def createcomment
@post=Post.find(params[:comment_post_ID])
@comment=Comment.new(comment_params)
session[:comment1]=comment_params

if comment_params[:"wp-comment-cookies-consent"] == "yes"
session[:comment]=comment_params
else
session[:comment]=nil
end
if !@comment.save && @comment.errors.messages.length > 0
render :errorcomment
else

redirect_to post_path(title:@post.url,dd:@post.dd,mm:@post.mm,yyyy:@post.yyyy)
end
end
  def index
@posts=Post.all

  end
 def month
@date=Date.new(params[:yyyy].to_i,params[:mm].to_i,1).strftime('%B %Y')
@posts=Post.month(params[:yyyy],params[:mm]) 
@posts=@posts.length > 0 ? @posts : not_found

  end
  def show
@comment=Comment.new(session[:comment].to_h)
@commentnew=Comment.new(session[:comment1].to_h)
@post=Post.find_by_url(params[:title])
if session[:comment1]
session[:comment1]=nil
@comments=@post.mycomments(@commentnew.email)

elsif session[:comment]
@comments=@post.mycomments(@commentnew.email)
else
@comments=@post.allcomments
end
  end
    def categoryshow
@category=Category.find_by_url(params[:name])

end
def authorshow
@author=Author.find_by_url(params[:name])
end
private
def comment_params
params.permit(:name,:email,:content,:site,:validated,:comment, :author, :url, :submit, :"comment_post_ID", :comment_parent)
end
end
