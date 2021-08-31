class CommentsController < ApplicationController
  def create
    #render :json => "#{params[:product_id]}"
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    redirect_to product_path(@product)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end