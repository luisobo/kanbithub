module Kanbithub
  class Kanbanery
    def initialize(auth_token, workspace, board_id)
      @auth_token = auth_token
      @workspace = workspace
      @board_id = board_id
      @uri = URI.parse "https://#{@workspace}.kanbanery.com/api/v1/projects/#{@board_id}/tasks.json"
      @http = Net::HTTP.new @uri.host, @uri.port
      @http.use_ssl = true
      @header = { 'X-Kanbanery-ApiToken' => auth_token }
    end


    def create_task_form_github(github_issue)
      data = form_task_data github_issue
      resp, data = @http.post(@uri.request_uri, data, @header)
    end

    private

    def form_task_data(github_issue)
      title = github_issue['title']
      task_type = task_type_from_labels github_issue['labels']
      description = "More info: #{github_issue['html_url']}"
      "task[title]=#{title}&task[task_type_name]=#{task_type}&task[description]=#{description}"
    end

    def task_type_from_labels(labels)
      labels = labels.collect { |l| l['name'] }.each(&:downcase!)
      if labels.include? 'bug'
        'bug'
      elsif labels.include? 'chore'
        'chore'
      else
        'feature'
      end
    end
  end
end