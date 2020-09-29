class BrowserHistoryController < ApplicationController
  def new
    @browser_history = BrowserHistory.new
  end

  def create
    BrowserHistory.create(permit_params)
    flash[:notice] = 'Added to History!'
    respond_to do |format|
      format.html { redirect_to :root }
    end
  end

  def index
    @history = BrowserHistory.order(created_at: :desc)
    respond_to do |format|
      format.html {}
      format.js { render partial: 'browser_history' }
    end
  end

  def previous
    current_history = BrowserHistory.where(id: params[:current_url_id])
    prev_history = current_history.exists? ? current_history.last.prev : BrowserHistory.last
    render json: { data: prev_history.as_json }, status: 200
  end

  def next
    current_history = BrowserHistory.where(id: params[:current_url_id])
    next_history = current_history.exists? ? current_history.last.next : BrowserHistory.last
    render json: { data: next_history.as_json }, status: 200
  end

  private

  def permit_params
    params.require(:browser_history).permit(:url)
  end
end
