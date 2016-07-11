module CommentToIssue
  class Hooks < Redmine::Hook::ViewListener    
      render_on(:view_issues_history_journal_bottom, :partial => 'cti/link_to_new_issue', :layout => false)
  end
end