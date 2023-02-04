# frozen_string_literal: true

require 'rails_helper'

describe Author do
  describe 'instance methods' do
    describe '#name' do
      it 'returns a name' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.name).to eq('Shakespeare')
      end
    end

    describe '#year_born' do
      it 'returns a year' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.year_born).to eq(1564)
      end
    end

    describe '#alive?' do
      it 'returns false if the author is dead' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.alive?).to eq(false)
      end

      it 'returns true if the author is alive' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        expect(author.alive?).to eq(true)
      end
    end

    describe '#created_at' do
      it 'returns a datetime' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.created_at).to be_a(Time)
      end
    end

    describe '#updated_at' do
      it 'returns a datetime' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.updated_at).to be_a(Time)
      end
    end

    describe '#id' do
      it 'returns an id as an integer' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.id).to be_an(Integer)
      end

      it 'increments by one' do
        author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
        expect(author.id).to be_an(Integer)
        author2 = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        expect(author2.id).to eq(author.id + 1)
      end
    end
  end
end
