class TaskBoardsController < ApplicationController
  unloadable

  def show
    @version = Version.find(params[:id])
    @issues = Issue.all(:conditions => {:fixed_version_id => @version.id})
  end
end
