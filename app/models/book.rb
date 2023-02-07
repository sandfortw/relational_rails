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
end
