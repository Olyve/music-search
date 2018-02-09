class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update, :destroy]
  # TODO: Verify SKIP_BEFORE_ACTION  is needed
  skip_before_action :require_login, only: [:create], raise: false

  # GET /searches
  def index
    @searches = Search.all

    render json: @searches
  end

  # GET /searches/1
  def show
    render json: @search
  end

  # POST /searches
  def create
    @search = Search.new(search_params)
    # Add the current logged in user as the creator of the memo
    @search.user = current_user

    if @search.save
      render json: @search, status: :created, location: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /searches/1
  def update
    if @search.update(search_params)
      render json: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_params
      params.permit(
        :search_term
      )
    end
end
