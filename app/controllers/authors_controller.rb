class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
  end

  def create
    author = Author.new({
      name: params[:author][:name],
      year_born: params[:author][:year_born].to_i,
      dead_or_alive: ActiveModel::Type::Boolean.new.cast(params[:author][:living]),
      created_at: DateTime.now,
      updated_at: DateTime.now,
      })
    author.save
    redirect_to '/authors'
  end
end