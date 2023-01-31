class AuthorsController < ApplicationController

  def index
    @authors = %w[1, 2, 3]
  end

  def new
  end

  def create
    require 'pry'; binding.pry
    author = Author.new({
      name: params[:author][:name],
      year_born: params[:author][:year_born].to_i,
      dead_or_alive: ActiveModel::Type::Boolean.new.cast(params[:author][:living])
      })


    # author.save

    # redirect_to '/tasks'
  end
end