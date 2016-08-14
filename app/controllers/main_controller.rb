class MainController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    set_experience
    respond_to do |format|
       format.js {render layout: false}
      # format.js {render layout: :show}
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
