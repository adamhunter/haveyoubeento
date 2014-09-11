class External::YelpsController < ApplicationController

  def index
    render json: yelps
  end

  private

  def yelps
    @yelps ||= YelpResource.search(search_params)
  end

  def search_params
    @search_params ||= String === params[:search] ? JSON.parse(params[:search]).with_indifferent_access : params.fetch(:search, {})
  end

end
