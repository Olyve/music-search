class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]
skip_before_action :require_login, only: [:index, :show]
# This file is for the pure use of logging a user in

# GET /sessions
def index
# Questions about scope resolution
# This is going to be the function that logs a user in
@user = User.authenticate(params[:email], params[:password])
render json: @user, only: [:id, :name, :email, :spotify_token, :apple_music_token, :token]

end

# GET /sessions/1
def show
@user = User.authenticate(params[:email], params[:password])
render json: @user, only: [:token, :created_at, :email, :id]
# render json: @active_session
end

# POST /sessions
def create
@session = ActiveSession.new(session_params())

if @session.save
  render json: @session, status: :created, location: @session
else
  render json: @session.errors, status: :unprocessable_entity
end
end

# PATCH/PUT /sessions/1
def update
if @session.update(session_params())
  render json: @session
else
  render json: @session.errors, status: :unprocessable_entity
end
end

# DELETE /sessions/1
def destroy
@session.destroy
end

private
# Use callbacks to share common setup or constraints between actions.
def set_session
  @session = User.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def session_params
  params.permit(:email, :password)
end
end
