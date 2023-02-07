# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author

  def self.book_update(params)
    book = Book.find(params[:id])
    book.update({
      title: params[:book][:title],
      author_id: params[:book][:author_id].to_i,
      year_written: params[:book][:year_written].to_i,
      fiction: ActiveModel::Type::Boolean.new.cast(params[:book][:fiction]),
      updated_at: DateTime.now
    })
    book.save
    book
  end

  def self.create_book(params)
    Book.new({
      title: params[:book][:title],
      author_id: params[:book][:author_id].to_i,
      year_written: params[:book][:year_written].to_i,
      fiction: ActiveModel::Type::Boolean.new.cast(params[:book][:fiction]),
      created_at: DateTime.now,
      updated_at: DateTime.now
    })
    book.save
  end

  def self.only_fictions
    Book.all.where(fiction: true)
  end
end
