class ProjectsController < ApplicationController

  before_action :set_project_item, only: [:edit, :show, :update, :destroy]
  layout 'project'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @project_items = Project.by_position

  end

  def sort
    params[:order].each do |key, value|
      Project.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end
  private
  def project_params
    params.require(:project).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
  end

  def set_project_item
    @project_item = Project.find(params[:id])
  end
end
