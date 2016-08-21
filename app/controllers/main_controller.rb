class MainController < ApplicationController
  def index

    num = Random.rand(10)
    if num > 5
      @experiences = Experience.all
    else
      @experiences = Experience.all
    end
  end

  def show
    set_experience
    @vote = Vote.new
    respond_to do |format|
       format.js {render layout: false}
      # format.js {render layout: :show}
    end
  end

  def new
    @vote = Vote.new
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
