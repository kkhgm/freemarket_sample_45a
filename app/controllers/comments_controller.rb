class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to item_path(@item)
    else
      render :show, locals: { item: @item }
    end
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id)
  end

end
