class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show]

  def show
  end

  def index
  end

  private

  def reference
    @reference ||= Reference.find_by!(ref: params[:ref])
  end
end
