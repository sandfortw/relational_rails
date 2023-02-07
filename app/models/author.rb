# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books

  def self.author_create(params)
    author = Author.new({
      name: params[:author][:name],
      year_born: params[:author][:year_born].to_i,
      alive: ActiveModel::Type::Boolean.new.cast(params[:author][:living]),
      created_at: DateTime.now,
      updated_at: DateTime.now
    })
    author.save
  end

  def self.author_update(params)
    author = Author.find(params[:id])
    author.update({
                    name: params[:author][:name],
                    year_born: params[:author][:year_born].to_i,
                    alive: ActiveModel::Type::Boolean.new.cast(params[:author][:alive]),
                    updated_at: DateTime.now
                  })
    author.save
    author
  end

  def self.destroy_self_and_books(params)
    books = Book.where(author_id: params[:id].to_s)
    Book.destroy(books.ids)
    Author.destroy(params[:id])
  end

  def books
    Book.where(author_id: self.id)
  end

  def book_count
    books.count
  end

  def self.bcount_order
    all.sort_by(&:book_count).reverse
  end
end
