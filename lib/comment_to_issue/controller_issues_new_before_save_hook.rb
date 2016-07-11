module CommentToIssue
    class ControllerIssuesNewBeforeSaveHook < Redmine::Hook::ViewListener
   
      def controller_issues_new_before_save(context={})
      	context[:params][:p_id] = context[:issue].parent_issue_id
      	context[:issue].parent_issue_id = nil
      end
    end
end