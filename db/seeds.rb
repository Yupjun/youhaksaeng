# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Inserting category data.."
[
    ["유럽"],
    ["아시아"],
    ["아프리카"],
    ["북아메리카"],
    ["남아메리카"],
    ["오세아니아"]
].each do |x|
    Category.create(name: x[0])
end

puts "Inserting facility data.."
[
    ["Choose the facility you want."],
    ["ATM(Kookmin Bank)"],
    ["ATM(Shinhan Bank)"],
    ["ATM(Woori Bank)"],
    ["Cafe"],
    ["Cafeteria"],
    ["Convenience Store"],
    ["Copy Room"],
    ["Girl's Lounge"],
    ["Lost & Found"],
    ["Notebook Rental"],
    ["PC Room"],
    ["Printer(Black & White)"],
    ["Printer(Color)"],
    ["Reading Room"],
    ["Scanner"]
].each do |x|
    Facility.create(name: x[0])     
end

puts "Inserting building data.."
[
    ["Main Gate"],
    ["Yurim Hoegwan"],
    ["Meongnyundang"],
    ["Daesungjeon"],
    ["Bicheondang"],
    ["Main Gate"],
    ["International Hall"],
    ["600th Anniversary Hall"],
    ["Central Library"],
    ["Student Center"],
    ["Faculty Hall"],
    ["Dasan Hall of Economics"],
    ["Toegye Hall of Humanities"],
    ["Hoam Hall"],
    ["Geumjandi Square"],
    ["Suseon Hall"],
    ["Suseon Hall Annex"],
    ["Yanghyeongwan"],
    ["International House"],
    ["Law School"],
    ["Large Playground"],
    ["Basketball Court"],
    ["Oacknyujeong"],
    ["Kingo House"],
    ["West Gate"],
    ["East Gate"]
].each do |x|
    Building.create(name: x[0])     
end

puts "Insertion completed"
