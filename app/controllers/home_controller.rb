class HomeController < ApplicationController
  NEWS_ITEM_PAGINATION_LIMIT = 4
  EVENT_PAGINATION_LIMIT = 4

  def index
    @event_page = params[:news_item_page]
    @news_item_page = params[:news_item_page]

    @events = Event.published.page(@event_page).per(EVENT_PAGINATION_LIMIT)
    @news_items = NewsItem.published.page(@news_item_page).per(NEWS_ITEM_PAGINATION_LIMIT)
  end
end
