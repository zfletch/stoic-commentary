class ReferencesController < ApplicationController
  before_action :set_references, only: [:show]
  before_action :set_reference, only: [:show]
  before_action :set_surrounding_references, only: [:show]
  before_action :set_passages, only: [:show]
  before_action :set_comments, only: [:show]

  def show
    @comment = Comment.new
  end

  def index
  end

  private

  attr_reader :reference, :references, :passages

  def set_reference
    @reference = references[reference_index]
    @display_ref = reference.display_ref
  end

  def set_surrounding_references
    @first = references.first
    @previous = references[reference_index - 1] || reference
    @next = references[reference_index + 1] || reference
    @last = references.last
  end

  def set_references
    @references = Reference.all.order(:rank).to_a
  end

  def set_passages
    @passages = reference.passages.includes(:edition).order(:edition_id)
  end

  def set_comments
    @comments = reference.comments.approved.includes(:user).order(:created_at).to_a
  end

  def reference_index
    # Even though find_by may be asymptotically more efficient
    # in practice avoiding a call to the DB and searching
    # the `references` array will be much faster.
    @reference_index ||= references.index { |r| r.ref == params[:ref] }
  end
end
