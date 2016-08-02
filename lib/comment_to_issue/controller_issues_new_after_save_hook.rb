module CommentToIssue
  class ControllerIssuesNewAfterSaveHook < Redmine::Hook::ViewListener
   
    def controller_issues_new_after_save(context={})
      if context[:params][:rel_id]
        relation = IssueRelation.new(relation_type: 'relates')
        relation.issue_from = Issue.find(context[:issue].id)
        relation.issue_to = Issue.find(context[:params][:rel_id].to_i)
        relation.init_journals(User.current)
        relation.save
        context[:issue].status_id = Setting.plugin_comment_to_issue['cti_status']
        context[:issue].save
	    end
    end

  end
end