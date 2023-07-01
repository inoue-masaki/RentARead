
    class Api::V1::UsersController < ApplicationController
    # before_action :authenticate_user

      def index
        users = User.all
        render json: users.as_json(only: [:id, :name, :email, :created_at])
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user.as_json
        else
          render json: user.errors,status: 422
        end
      end

      private

        def user_params
          params.require(:user).permit(
            :name,
            :email,
            :password
          )
        end
    end

