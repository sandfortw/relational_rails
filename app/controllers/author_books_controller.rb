# frozen_string_literal: true

class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = if params[:year_floor].nil?
               @author.books
             else
               @author.books.where("year_written > #{params['year_floor']}")
             end
    @books = @books.order(:title) if params['alpha'] == 'true'
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
