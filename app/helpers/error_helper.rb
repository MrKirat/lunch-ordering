module ErrorHelper
  def format_errors_for(object)
    object&.errors&.full_messages&.join(' ')
  end
end