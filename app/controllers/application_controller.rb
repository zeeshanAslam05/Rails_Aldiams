class ApplicationController < ActionController::Base




private

def after_sign_in_path_for(resource)
articles_path
end


 # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    articles_path
  end

end
