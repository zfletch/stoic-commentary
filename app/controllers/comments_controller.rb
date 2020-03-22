class CommentsController < ApplicationController
  before_action :require_authentication, only: [:create, :destroy]
  before_action :set_reference, only: [:index, :create]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = reference.comments
  end

  def create
    @comment = Comment.new(comment_params)

    if comment.save
      redirect_to return_path, notice: t('.success')
    else
      redirect_to return_path, notice: t('.failure')
    end
  end

  def destroy
    if comment.user == current_user && comment.approved?
      comment.update!(status: :deleted)

      redirect_to return_path, notice: t('.success')
    else
      redirect_to return_path, error: t('.persmissions')
    end
  end

  private

  attr_reader :reference, :comment

  def set_reference
    @reference = Reference.find_by!(ref: params[:reference_ref])
  end

  def set_comment
    @comment = Comment.find_by!(id: params[:id])
  end

  def return_path
    request.referer || reference_path(reference)
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(reference: reference, user: current_user)
  end
end
