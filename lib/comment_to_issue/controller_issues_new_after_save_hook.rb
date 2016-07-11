module CommentToIssue
    class ControllerIssuesNewAfterSaveHook < Redmine::Hook::ViewListener
   
      def controller_issues_new_after_save(context={})
        @relation = IssueRelation.new(relation_type: 'relates')
        @relation.issue_from = Issue.find(context[:issue].id)
        @relation.issue_to = Issue.find(context[:params][:p_id])
        @relation.init_journals(User.current)
        @relation.save 
      end
    end
end