module V0
  class BlogPostsController < ApiApplicationController
    before_action :authorize_request

    #GET /v0/blog_posts
    def index
      posts = BlogPost.order('created_at desc')

      render json: { results: posts }
    end
  end
end
