class MainController < ApplicationController
  def index
    num = Random.rand(10)
    @tags = Experience.tag_counts.map { |tag| tag.name }
    if params[:tag]
      @experiences = Experience.tagged_with(params[:tag])
    else
      @experiences = Experience.all
    end
  end

  def show
    root_url = 'https://s3.amazonaws.com'
    path = '/townsend-labs-ab-audio-assets/'
    @count = 1
    @experience = Experience.find(params[:id])
    clips = get_clips
    @clip_data = []
    clips.each do |clip_data|
      clip = "{title:'#{@experience.name} clip #{@count}', #{clip_data.format}:'#{root_url}#{path}#{clip_data.file_name}.#{clip_data.format}'}"
      @clip_data = "#{@clip_data}" + "," + "#{clip}"
      @count += 1
    end
    @clip_data = @clip_data.gsub("[],","")
    @options = [*1..10]
    @vote = Vote.new
    @clip_vote = clips


    respond_to do |format|
       format.js {render layout: false}
    end
  end

  def new
    @vote = Vote.new
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def get_clips
    if rand(10) > 5
      clips = @experience.clips.order("id ASC")
    else
      clips = @experience.clips.order("id DESC")
    end
  end
end
