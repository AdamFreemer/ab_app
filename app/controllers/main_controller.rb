class MainController < ApplicationController
  before_action :set_ip
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
    @experience = Experience.find(params[:experience])
    clips = get_clips
    @clip_data = []
    clips.each do |clip_data|
      clip = "{title:'#{@experience.name} clip #{@count}', #{clip_data.format}:'#{root_url}#{path}#{clip_data.file_name}.#{clip_data.format}'}"
      puts "##### clip: #{clip}"
      @clip_data = "#{@clip_data}" + "," + "#{clip}"
      @count += 1
    end
    @clip_data = @clip_data.gsub("[],","")
    puts "##### @clip_data: #{@clip_data}"
    @options = [*1..5]
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

  def set_ip
    session[:user_ip] ||= request.remote_ip
  end

  def get_clips
    if rand(10) > 4
      @order = "asc"
      @vote_array = [*1..@experience.clips.count]
      clips = @experience.clips.order("id ASC")
    else
      @order = "desc"
      @vote_array = [*1..@experience.clips.count].reverse!
      clips = @experience.clips.order("id DESC")
    end
  end

end
