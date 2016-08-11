class MainController < ApplicationController
  def index
    @experiences = Experience.all
  end
end
