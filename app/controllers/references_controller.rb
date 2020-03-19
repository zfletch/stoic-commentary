class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show]
  before_action :set_references, only: [:show]
  before_action :set_passages, only: [:show]
  before_action :set_comments, only: [:show]

  helper_method :left, :right

  def show
    @comment = Comment.new
  end

  def index
  end

  private

  attr_reader :reference, :passages

  def set_reference
    @reference ||= Reference.find_by!(ref: params[:ref])
  end

  def set_references
    @references ||= Reference.all.order(:rank)
  end

  def set_passages
    @passages ||= reference.passages.includes(:edition).order(:edition_id)
  end

  def set_comments
    @comments ||= reference.comments.approved.includes(:user).order(:created_at)
  end
end
