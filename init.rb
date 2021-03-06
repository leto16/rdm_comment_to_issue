require 'redmine'

Redmine::Plugin.register :comment_to_issue do
  name 'Comment To Issue plugin'
  author 'Aleksandr Sipovich'
  description 'The creation of a new mini-issue from a comment'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://vk.com'

  settings :partial => 'settings/comm_to_issue_settings',
  :default => {
  	:cti_tracker => nil,
  	:cti_status  => nil
  }
   
end

require 'comment_to_issue/history_journal_hook'
require 'comment_to_issue/controller_issues_new_after_save_hook'

