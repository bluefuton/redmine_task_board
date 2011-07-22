require_dependency 'issue'

# Patches Redmine's Issues dynamically.  Adds a new finder method
module IssuePatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def find_by_version_id_and_status_names(version_id, status_names)
      where = 'fixed_version_id = ? AND issue_statuses.name IN (?)'
      Issue.all(:conditions => [where, version_id, status_names],
                                :include => :status)
    end
  end
end

# Add module to Issue
Issue.send(:include, IssuePatch)