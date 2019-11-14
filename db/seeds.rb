# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Writer.destroy_all
Tag.destroy_all
Story.destroy_all
Country.destroy_all

require 'csv'

csv_text = File.read("./db/World_countries.csv")
country_list = CSV.parse(csv_text)

country_list.each do |row|
    Country.create(name: row[0].to_s)
end 

emily = Writer.create(name: "Emily", age: 32)
max = Writer.create(name: "Max", age: 41)
mary = Writer.create(name: "Mary", age: 100) 

Tag.create(name: "love")
Tag.create(name: "sad")
Tag.create(name: "happy")
Tag.create(name: "exciting")
Tag.create(name: "boring")
Tag.create(name: "weird")
Tag.create(name: "frightening")

Story.create(content: "A beer brewer who lives in Brussels.", subject: "Pascal", writer_id: emily.id, country_id: 13)
Story.create(content: "A math student whose father is a pilot and teaches salsa.", subject: "Nadia", writer_id: max.id, country_id: 23)
Story.create(content: "A professional tour guide who has climbed Everest.", subject: "Anna", writer_id: emily.id, country_id: 58)
Story.create(content: "A chef who has three kids and a cat.", subject: "Amir", writer_id: mary.id, country_id: 89) 
Story.create(content: "A cab driver who sings when she drives and tells stories about her years as an olympic water polo champion.", subject: "Eva", writer_id: max.id, country_id: 185)