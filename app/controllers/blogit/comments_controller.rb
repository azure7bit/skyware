module Blogit
  class CommentsController < ApplicationController

    blogit_authenticate except: [:create]

    def create
      user = Citizen.find_by(:subdomain => request.subdomain)
      user ||= User.find_by(:subdomain => request.subdomain)

      current_user = current_user ? current_user : user
      params[:comment] = {:name => current_user.name, :email => current_user.email, :body => params[:reply]}
      @comment = post.comments.new(comment_parameters)
    
      respond_to do |format|
        format.js {
          # the rest is dealt with in the view
          @comment.save
        }

        format.html {
          if @comment.save
            # redirect_to(post, notice: t(:successfully_added_comment, scope: 'blogit.comments'))
            redirect_to root_url
          else
            render "blogit/posts/show"
          end
        }

      end

    end

    def destroy
      @comment = post.comments.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to(post, notice: t(:successfully_removed_comment, scope: 'blogit.comments'))}
        format.js
      end
    end

    private

    def post
      @post ||= Blogit::Post.find(params[:post_id])
    end
    
    def comment_parameters
      params[:comment]
      params.require(:comment).permit(:name, :email, :body, :website)
    end
    
  end
end
