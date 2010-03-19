# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout 'application'
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| 
    error_message = instance.error_message
    if instance.error_message.kind_of?(Array)  
      error_message = instance.error_message.join(',')
    end
    
    if html_tag =~ /radio/i
      html_tag
    else
      %(<div class="fieldWithErrors">#{html_tag}<span class="validation-error">&nbsp;#{error_message}</span></div>)
    end
  end 
  
end
