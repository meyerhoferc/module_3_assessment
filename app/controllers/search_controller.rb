class SearchController < ApplicationController
  def index
    @store_information = Store.find_by_zipcode(params[:q])
  end
end
