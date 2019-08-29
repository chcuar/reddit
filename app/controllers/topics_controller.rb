class TopicsController < ApplicationController

  before_action :set_sub
  before_action :set_topic, only: [show, :edit, :update, :destroy]


  def index
    # @topics = Topic.all
    @topics = @sub.topics
  end

  def show
    # @topic = Topic.find(params[:id])
  end

  def new
    # @topic = Topic.new
    @topic = @sub.topics.new
    render partial: 'form'
  end

  def create
    # @topic = Topic.new(topic_params)
    @topic = @sub.topics.new(topic_params)
    
    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end

  end

  def edit
    # @topic = Topic.find(params[:id])
    render partial: 'form'
  end

  def update
    # @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    # Topic.find(params[:id]).destroy
    @topic.destroy
    redirect_to sub_topics_path
  end


  private
    def topic_params
      params.require(:topic).permit(:name, :body)
    end

    def set_sub
      @sub = Sub.find(params[:sub_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
