class EditionsController < ApplicationController
  before_action :set_edition

  def show
  end

  private

  def set_edition
    @edition ||= Edition.find_by!(id: params[:id])
  end
end
