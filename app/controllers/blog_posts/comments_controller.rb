module BlogPosts
  class CommentsController < WebApplicationController
    before_action :find_blog_post, :authenticate_user

    def create
      comment = @blog_post.comments.create(comment_params)

      if comment.errors.empty?
        flash[:success] = 'Added a new comment'
      else
        flash[:fail] = comment.errors.full_messages.join('. ')
      end

      redirect_back(fallback_location: root_path)
    end

    def destroy
      blog_post.comments.find(params[:id]).destroy!
      flash[:success] = 'You have removed a comment'
    rescue ActiveRecord::RecordNotDestroyed => e
      Rails.logger.error(e)
      flash[:fail] = 'Fail to remove your comment'
    ensure
      redirect_back(fallback_location: root_path)
    end

    private

    def find_blog_post
      @blog_post = BlogPost.find(params[:blog_post_id])
    end

    def comment_params
      params.require(:comment).permit(:content).tap do |whitelist|
        whitelist[:user_id] = current_user.id
      end
    end
  end
end
