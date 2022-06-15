class StatusController < ApplicationController
  def index
    render json: { success: true }, status: :ok
  end
end
