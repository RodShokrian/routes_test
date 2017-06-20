# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

# NOTE: Seed User
user1 = User.create!(username: 'Rod')
user2 = User.create!(username: 'Norris')
user3 = User.create!(username: 'Bailey')
user4 = User.create!(username: 'Canelo')

# NOTE: Seed Artwork
art1 = Artwork.create!(title: 'TMNT Leonardo', image_url: 'https://i1.wp.com/www.teenagemutantninjaturtles.com/wp-content/uploads/2012/04/Leonardo-2003-cartoon.jpg', artist_id: user1.id)
art2 = Artwork.create!(title: 'TMNT Donatello', image_url: 'https://static.comicvine.com/uploads/original/4/49448/5635228-donatello+2.jpg', artist_id: user2.id)
art3 = Artwork.create!(title: 'TMNT Mikey', image_url: 'https://vignette2.wikia.nocookie.net/cartoons/images/9/94/Michelangelo.png/revision/latest?cb=20110704210306', artist_id: user3.id)
art4 = Artwork.create!(title: 'TMNT Raph', image_url: 'http://vignette4.wikia.nocookie.net/freddyknifefingers/images/3/33/Turtle_4.jpg/revision/latest?cb=20130721101458', artist_id: user2.id)

# NOTE: Seed ArtworkShare
share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user2.id)
share2 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user3.id)
share3 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user4.id)
