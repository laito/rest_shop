class ShopController < ApplicationController
  before_action :set_book, only: [:show, :buy]
  require 'book'

  def show
  end

  def index
    @books = Book.all
  end

  def buy
   if not @book.nil?
     @book.buy
   end
   redirect_to '/'
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

end
