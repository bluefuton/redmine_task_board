class TaskBoardsController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:project_id])
  end
  
  def show
    @version = Version.find(params[:id])
    @project = @version.project
    
    @issues_to_do = Issue.find_by_version_id_and_status_names(@version.id, ['New'])
    @issues_in_progress = Issue.find_by_version_id_and_status_names(@version.id, ['In Progress', 'Feedback'])    
    @issues_to_verify = Issue.find_by_version_id_and_status_names(@version.id, ['Resolved'])
    @issues_closed = Issue.find_by_version_id_and_status_names(@version.id, ['Closed'])
  end
end
