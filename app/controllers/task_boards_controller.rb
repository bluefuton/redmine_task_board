class TaskBoardsController < ApplicationController
  unloadable
  
  before_filter :find_project, :authorize

  def index
  end
  
  def show
    @version = Version.find(params[:id])
    @project = @version.project
    
    @issues_to_do = Issue.find_by_version_id_and_status_names(@version.id, ['New'])
    @issues_in_progress = Issue.find_by_version_id_and_status_names(@version.id, ['In Progress', 'Feedback Requested'])    
    @issues_to_verify = Issue.find_by_version_id_and_status_names(@version.id, ['Completed'])
    @issues_closed = Issue.find_by_version_id_and_status_names(@version.id, ['Rejected', 'Closed'])
  end
  
  protected
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find_by_identifier(params[:project_identifier])
  end  
end
