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
    path = '/ab-content/guitar_amp/'
    count = 1
    @experience = Experience.find(params[:id])
    @clips = []
    @experience.clips.each do |clip_data|
      clip = "{title:'#{@experience.name} option #{count}', #{clip_data.format}:'#{root_url}#{path}#{clip_data.file_name}.#{clip_data.format}'}"
      @clips = "#{@clips}" + "," + "#{clip}"
      count += 1
    end
    @clips = @clips.gsub("[],","")
    @options = [*1..10]
    @vote = Vote.new
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
end
