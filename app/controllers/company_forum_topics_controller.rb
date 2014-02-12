class CompanyForumTopicsController < ApplicationController
  # GET /company_forum_topics
  # GET /company_forum_topics.json
  # def index
  #   @company_forum_topics = CompanyForumTopic.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @company_forum_topics }
  #   end
  # end

  # GET /company_forum_topics/1
  # GET /company_forum_topics/1.json
  def show
    @company_forum = CompanyForum.find(params[:company_forum_id])
    @company_forum_topic = CompanyForumTopic.find(params[:id])
    @forum_posts = @company_forum_topic.forum_posts

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_forum_topic }
    end
  end

  # GET /company_forum_topics/new
  # GET /company_forum_topics/new.json
  def new
    @company_forum = CompanyForum.find(params[:company_forum_id])
    @company_forum_topic = CompanyForumTopic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_forum_topic }
    end
  end

  # GET /company_forum_topics/1/edit
  def edit
    @company_forum = CompanyForum.find(params[:company_forum_id])
    @company_forum_topic = @company_forum.company_forum_topic
  end

  # POST /company_forum_topics
  # POST /company_forum_topics.json
  def create
    @company_forum = CompanyForum.find_by_id(params[:company_forum_id])
    @company_forum_topic = @company_forum.company_forum_topics.build(params[:company_forum_topic])

    respond_to do |format|
      if @company_forum_topic.save
        format.html { redirect_to company_forum_company_forum_topic_path(@company_forum, @company_forum_topic), notice: 'Company forum topic was successfully created.' }
        format.json { render json: @company_forum_topic, status: :created, location: @company_forum_topic }
      else
        format.html { render action: "new" }
        format.json { render json: @company_forum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_forum_topics/1
  # PUT /company_forum_topics/1.json
  def update
    @company_forum_topic = CompanyForumTopic.find(params[:id])

    respond_to do |format|
      if @company_forum_topic.update_attributes(params[:company_forum_topic])
        format.html { redirect_to @company_forum_topic, notice: 'Company forum topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_forum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_forum_topics/1
  # DELETE /company_forum_topics/1.json
  def destroy
    @company_forum_topic = CompanyForumTopic.find(params[:id])
    @company_forum_topic.destroy

    respond_to do |format|
      format.html { redirect_to company_forum_topics_url }
      format.json { head :no_content }
    end
  end
end
