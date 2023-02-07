# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @bcount = params[:bcount]
    if !@bcount.nil?
      @authors = Author.bcount_order
    else 
      @authors = Author.order(created_at: :desc)
    end
  end

  def new; end

  def show
    @author = Author.find(params[:id])
    @count = @author.books.count
  end

  def create
    Author.author_create(params)
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.author_update(params)
    redirect_to "/authors/#{author.id}"
  end

  def destroy
    Author.destroy_self_and_books(params)
    redirect_to '/authors'
  end
end
