class SearchController < ApplicationController
  def index
    @stores = Store.find_by_zipcode(params[:q])
  end
end
