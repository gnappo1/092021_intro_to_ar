require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    # set :views, 'app/views'
    set :default_content_type, :json
  end

  private

  def shared_helper_method
    puts "I am visible in every controller!"
  end

end
