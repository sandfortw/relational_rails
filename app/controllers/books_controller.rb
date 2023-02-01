class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
  end

  def show
    @book =Book.find(params[:id])
  end

  def create
    book = Book.new({
      title: params[:book][:title],
      author_id: params[:book][:author_id].to_i,
      year_written: params[:book][:year_written].to_i,
      fiction: ActiveModel::Type::Boolean.new.cast(params[:book][:fiction]),
      created_at: DateTime.now,
      updated_at: DateTime.now,
      })
    book.save
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
      title: params[:book][:title],
      author_id: params[:book][:author_id].to_i,
      year_written: params[:book][:year_written].to_i,
      fiction: ActiveModel::Type::Boolean.new.cast(params[:book][:fiction]),
      updated_at: DateTime.now,
    })
    book.save
    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end
end