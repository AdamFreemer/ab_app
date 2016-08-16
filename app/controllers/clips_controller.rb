class ClipsController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_ID'], password: ENV['BASIC_AUTH_PW'] if Rails.env.production?
  before_action :set_clip, only: [:show, :edit, :update, :destroy]

  def index
    # @experience = Experience.find(params[:experience_id])
    @clips = Clip.all
  end

  def show
  end

  def new
    @clip = Clip.new
  end

  # GET /clips/1/edit
  def edit
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @clip = @experience.clips.create(clip_params)
    redirect_to experience_path(@experience)
  end

  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @clip, notice: 'Clip was successfully updated.' }
        format.json { render :show, status: :ok, location: @clip }
      else
        format.html { render :edit }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience = Experience.find(params[:experience_id])
    @clip = @experience.clips.find(params[:id])
    @clip.destroy
    redirect_to experience_path(@experience)
  end

  private
    def set_clip
      @clip = Clip.find(params[:id])
    end

    def clip_params
      params.require(:clip).permit(:name, :description, :file_name, :format, :author)
    end
end
