class Api::V1::FavaritesController < ApplicationController

  def on
    @favarite = Favarite.new(favarite_params)
    if @favarite.save
        render json: @favarite
    else
        render json: @favarite.errors,status: 422
    end
  end

  def off
     @book_id = params[:book_id]
     @user_id = params[:user_id]
     favarites = Favarite.where(book_id: @book_id)
     favarites.each do |favarite|
       if favarite.user_id == @user_id
        @id = favarite.id
         Favarite.destroy(@id)
         break
       end
     end
  end

  private

    def favarite_params
      params.require(:auth).permit(
        :user_id,
        :book_id
      )
    end

end

