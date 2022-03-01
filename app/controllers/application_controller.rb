require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :default_content_type, :json
    # set :show_exceptions, false
    # set :show_exceptions, :after_handler

  end

  # error do
  #   'Sorry there was a nasty error - ' + env['sinatra.error'].message
  # end

end
