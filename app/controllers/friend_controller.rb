class FriendController < ApplicationController
  before_action :set_friend, only: [:get_friend]
    # GET /friend/all
  def all
    @friends = Friend.all
    render json: @friends
  end

  # GET /friend/1
  def get_friend
    render json: @friend
  end

  # POST /friend
  def create
    friend = Friend.new(friend_params)

    if friend
      friend.save
      render json: friend, status: :created, location: friend
    else
      render json: { error: "Friend not created"}, status: :unprocessable_entity
    end
  end

  # PUT /friend/1
  def update
    friend = Friend.find(params[:id])
    if friend.update(friend_params)
      render json: friend, status: :ok
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # GET /lookup/friend-lookup
  def lookup
    friend = Friend.select("id, CONCAT(FirstName, ' ', LastName) AS displaymember").as_json
    if friend
      render json: friend, status: :ok
    else
      render json: friend.eerrors, status: :unprocessable_entity
    end
  end

  # DELETE /friend/1
  def destroy
    friend = Friend.find_by(id: params[:id])

    if friend
      friend.destroy
      head :no_content #send 204 response

    else
      render json: { error: "Friend not found"}, status: :not_found
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = Friend.find_by(id: params[:id])
    if @friend.nil?
      render json: { error: 'Friend not found'}, status: :not_found
    end
  end

  # Only allow a list of trusted parameters through.
  def friend_params
    params.require(:friend).permit(:FirstName, :LastName, :Email)
  end
end
