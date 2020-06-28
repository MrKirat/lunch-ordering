class ErrorsController < ApplicationController
  layout 'error'

  # 404 error
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
      format.json { render plain: {error: 'not found'}.to_json, status: 404, content_type: 'application/json' }
    end
  end

  # 422 error
  def unacceptable
    respond_to do |format|
      format.html { render status: 422 }
      format.json { render plain: {error: 'unprocessable entity'}.to_json, status: 422, content_type: 'application/json' }
    end
  end

  # 500 error
  def internal_error
    respond_to do |format|
      format.html { render status: 500 }
      format.json { render plain: {error: 'internal server error'}.to_json, status: 500, content_type: 'application/json' }
    end
  end
end