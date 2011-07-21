class TaskBoardsController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end
  
  def show
    @version = Version.find(params[:id])
    @project = @version.project
    @issues_to_do = Issue.all(:conditions => {:fixed_version_id => @version.id})
    @issues_in_progress = Issue.all(:conditions => {:fixed_version_id => @version.id})
    @issues_to_verify = Issue.all(:conditions => {:fixed_version_id => @version.id})
    @issues_closed = Issue.all(:conditions => {:fixed_version_id => @version.id})
  end
end
