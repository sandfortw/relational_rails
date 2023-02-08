# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
kim = Author.create(name: 'Kim Stanley Robinson', year_born: 1952, alive: true)
kazuo = Author.create(name: 'Kazuo Ishiguro', year_born: 1954, alive: true)
john =Author.create(name: 'Josn Steinbeck', year_born: 1902, alive: false)
Book.create!(title: '2312', author_id: kim.id, year_written: 2012, fiction: true)
Book.create!(title: 'The Ministry for the Future', author_id: kim.id, year_written: 2020, fiction: true)
Book.create!(title: 'The Novels Of Philip K. Dick', author_id: kim.id, year_written: 1989, fiction: false)
Book.create!(title: 'The High Sierra: A Love Story', author_id: kim.id, year_written: 2022, fiction: false)
Book.create!(title: 'The Buried Giant', author_id: kazuo.id, year_written: 2015, fiction: true)
Book.create!(title: 'What Remains of the Day', author_id: kazuo.id, year_written: 1989, fiction: true)
Book.create!(title: 'The Grapes of Wrath', author_id: john.id, year_written: 2015, fiction: true)


