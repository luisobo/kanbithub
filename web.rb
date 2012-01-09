require 'sinatra'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'

require './lib/kanbanery.rb'

require './config.rb'

kanbanery = Kanbithub::Kanbanery.new settings.kanbanery_auth_token,
                                     settings.kanbanery_workspace,
                                     settings.kanbanery_board_id

post '/' do
  data = JSON.parse(params[:payload])
  if data['issue']
    if data['action'] == "opened"
      kanbanery.create_task_form_github data['issue']
    end
  end
end