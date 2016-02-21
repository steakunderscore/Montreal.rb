class HomeController < ApplicationController
  NEWS_ITEM_PAGINATION_LIMIT = 10

  def index
    @page = params[:page] || 0
    @events = Event.published.limit(2)
    @news_items = NewsItem.published.page(@page).per(NEWS_ITEM_PAGINATION_LIMIT)
  end
end
