module V0
  class BlogPostsController < ApiApplicationController
    before_action :authorize_request, except: :index
    before_action :find_blog_post, only: %i[show update destroy]

    def index
      blog_posts = BlogPost.order('created_at desc')

      render json: { results: blog_posts }
    end

    def show
      render json: { results: @blog_post }
    end

    def create
      blog_post = BlogPost.create(blog_post_params)

      render json: { results: blog_post }, status: 201
    end

    def update
      @blog_post.update(blog_post_params.except(:user_id))

      render json: { results: @blog_post }
    end

    def destroy
      @blog_post.destroy!

      head :no_content
    rescue ActiveRecord::RecordNotDestroyed => e
      Rails.logger.error(e)
    end

    private

    def find_blog_post
      @blog_post = @current_user.blog_posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end

    def blog_post_params
      params.permit(:title, :content, :image).tap do |whitelist|
        whitelist[:user_id] = @current_user.id
      end
    end
  end
end
