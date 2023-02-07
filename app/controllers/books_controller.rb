# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.only_fictions
  end

  def new; end

  def show
    @book = Book.find(params[:id])
  end

  def create
    Book.create_book
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.book_update(params)
    redirect_to "/books/#{@book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end
end
