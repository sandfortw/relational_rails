# frozen_string_literal: true

class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    if params[:year_floor].nil?
      @books = @author.books.order(:title)
    else
      @books = @author.books.where("year_written > #{params['year_floor']}").order(:title)
    end
  end

  def new; end

  def create
    book = Book.new({
                      title: params[:book][:title],
                      author_id: params[:book][:author_id].to_i,
                      year_written: params[:book][:year_written].to_i,
                      fiction: ActiveModel::Type::Boolean.new.cast(params[:book][:fiction]),
                      created_at: DateTime.now,
                      updated_at: DateTime.now
                    })
    book.save
    redirect_to "/authors/#{params['id']}/books"
  end

end
