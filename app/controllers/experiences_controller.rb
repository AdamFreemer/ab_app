class ExperiencesController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_ID'], password: ENV['BASIC_AUTH_PW'] if Rails.env.production?
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.all.sort_by(&:name)
  end

  def show
    @anonymous_name = random_string
  end

  def new
    @experience = Experience.new
  end

  def edit
  end

  def create
    @experience = Experience.new(experience_params)
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def random_string
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      (0...50).map { o[rand(o.length)] }.join
    end

    def experience_params
      params.require(:experience).permit(:name, :description, :tag_list)
    end
end
