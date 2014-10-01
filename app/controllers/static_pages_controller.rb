class StaticPagesController < ApplicationController
  def home
  	@posts = Post.order('updated_at desc').limit(5)
  end

  def about
  end

  def contact
  end
end
