# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
ActiveRecord::Base.connection.disable_referential_integrity do

puts "start"
Scene.destroy_all
Place.destroy_all
Movie.destroy_all
User.destroy_all

user = User.create!(email: "barbara@cinehunt.fr", password: "123456", username: "Barbara le jedi", level: 100, certification: true)
puts "user Barbara created"
user1 = User.create!(email: "lilian@cinehunt.fr", password: "123456", username: "Lilian le padawan", level: 50, certification: false)
puts "user Lilian created"
user2 = User.create!(email: "hilam@cinehunt.fr", password: "123456", username: "Hilam le jedi", level: 30, certification: true)
puts "user Hilam created"
user3 = User.create!(email: "thomas@cinehunt.fr", password: "123456", username: "Thomas le jedi", level: 30, certification: true)
puts "user Thomas created"

joker = Movie.create!(title: 'Joker', category: 'Drame')
conjuring = Movie.create!(title: 'Conjuring', category: 'Horreur')
barbie = Movie.create!(title: 'Barbie', category: 'Comedie')
intouchables = Movie.create!(title: 'Intouchables', category: 'Comédie dramatique')
gameofthrones = Movie.create!(title: 'Game Of Thrones', category: 'Drame, Fantastique')
harrypotter = Movie.create!(title: 'Harry Potter', category: 'Fantastique')
starwars = Movie.create!(title: 'Star Wars', category: 'Fantastique')
seigneurdesanneaux = Movie.create!(title: 'Seigneur des anneaux', category: 'Fantastique')

new_jersey = Place.new(country: 'USA', city: 'Newark, New Jersey', address: '54 Journal Square, Jersey City, NJ 07306')
los_angeles = Place.new(country: 'USA', city: 'Los Angeles', address: '2637 Main St, Santa Monica, CA 90405, États-Unis')
burrillville = Place.new(country: 'USA', city: 'Burillville', address: '1677 Round Top Rd, Burrillville, RI 02830, États-Unis')
bronx = Place.new(country: 'USA', city: 'Bronx', address: '1165 Shakespeare Avenue, NY 10452')
paris = Place.new(country: 'France', city: 'Paris 7e', address: '60 Quai des Tuileries, 75001 Paris')
bushmills = Place.new(country: 'Royaume-uni', city: 'Bushmills', address: '87 Dunluce Rd, Bushmills BT57 8UY, Irlanda del Norte')
dubrovnik = Place.new(country: 'Croatie', city: 'Dubrovnik', address: 'Tvrđava Minčeta, Dubrovačke Gradske Zidine, Ul. Ispod Minčete 9, 20000, Dubrovnik, Croatie')
dubrovniktwo = Place.new(country: 'Croatie', city: 'Dubrovnik', address: '20000, Grad, Dubrovnik, Croatie')
london = Place.new(country: 'Royaume-Uni', city: 'Londres', address: 'Euston Rd., London N1C 4QP, Royaume-Uni')
alnwick = Place.new(country: 'Royaume-uni', city: 'Alnwick', address: 'Alnwick, Northumberland, Angleterre, Royaume-Uni')
caserta = Place.new(country: 'Italie', city: 'Caserta', address: 'Piazza Carlo di Borbone, 81100 Caserta CE, Italie')
matamata = Place.new(country: 'Nouvelle-Zélande', city: 'Matamata', address: '501 Buckland Rd, Hinuera, Matamata 3472, Nouvelle-Zélande')

new_jersey.save
los_angeles.save
burrillville.save
bronx.save
paris.save
bushmills.save
dubrovnik.save
dubrovniktwo.save
london.save
alnwick.save
caserta.save
matamata.save

loew_jersey = Scene.new(
  movie: joker,
  place: new_jersey,
  user: user,
  title: "Loew's Jersey Theatre",
  content: "C'est ici qu'Arthur Fleck descend le tapis rouge en faisant des cabrioles",
  rating: 4.4,
  time: "1h30",
  price: "9€",
  link: "https://www.expedia.com/Loews-Jersey-Theater-Journal-Square.d6079889.Vacation-Attraction"
  )
loew_jersey.photo.attach(io: URI.open("https://jerseydigs.com/wp-content/uploads/2021/02/Loews-Jersey-Theatre-Journal-Square-Jersey-City-1.jpg"), filename: "loew_jersey.png", content_type: "image/png")
loew_jersey.save!

escaliers = Scene.new(
  movie: joker,
  place: bronx,
  user: user,
  title: "Les escaliers",
  content: "Le célèbre escalier qui illustre l'affiche du film",
  time: "5 minutes",
  price: 0.0,
  link: "https://www.cnewyork.net/cinema/les-lieux-de-tournage-du-joker-a-new-york/"
)
escaliers.photo.attach(io: URI.open("https://fr.web.img4.acsta.net/r_654_368/newsv7/19/10/24/14/31/2884301.jpg"), filename: "escaliers.png", content_type: "image/png")
escaliers.save!

paramount_theater = Scene.new(
  movie: joker,
  place: new_jersey,
  user: user3,
  title: "The Paramount Theater",
  content: "C'est ici qu'Arthur Fleck a été dupé par des adolescents alors qu'il travaillait en tant que clown devant le Newark Paramount Theater.",
  price: 0.0,
  time: "5 minutes",
  link: "https://www.sceen-it.com/sceen/3680/Joker/Newark-Paramount-Theater-closed"
)
paramount_theater.photo.attach(io: URI.open("https://advancelocal-adapter-image-uploads.s3.amazonaws.com/image.nj.com/home/njo-media/width2048/img/essex_impact/photo/2018/10/12/24954100-standard.jpg"), filename: "paramount_theater.png", content_type: "image/png")
paramount_theater.save!

conjuring = Scene.new(
  movie: conjuring,
  place: burrillville,
  user: user3,
  title: "The Conjuring House",
  content: "La célèbre maison de Ed et Lorren Warren qui ont inspiré le célèbre film Conjuring.",
  rating: 4.9,
  price: 30.0,
  time: "2h",
  link: "https://www.theconjuringhouse.com/"
)
conjuring.photo.attach(io: URI.open("https://imageio.forbes.com/specials-images/imageserve/629003d4d07c7f069f74921f/Haunted-House--Colonial-house/960x0.jpg?format=jpg&width=960https://i.dailymail.co.uk/1s/2022/06/28/05/59606005-10959397-image-a-73_1656392097884.jpg"), filename: "conjuring.png", content_type: "image/png")
conjuring.save!

venice_beach = Scene.create(
  movie: barbie,
  place: los_angeles,
  user: user3,
  title: "Venice Beach",
  content: "Barbie à Venice Beach, un lieu dynamique qui reflète la diversité culturelle du monde réel.",
  price: 0.0,
  time: "30 min",
  link: "https://www.losangeles.fr/venice-beach"
)
venice_beach.photo.attach(io: URI.open("https://i.dailymail.co.uk/1s/2022/06/28/05/59606005-10959397-image-a-73_1656392097884.jpg"), filename: "venice_beach.png", content_type: "image/png")
venice_beach.save!

quai_des_tuileries = Scene.create(
  movie: intouchables,
  place: paris,
  user: user3,
  title: "Une petite course ?",
  content: "Fauteuil roulant plus rapide sur le pont de la Seine.",
  price: 0.0,
  rating: 2,
  time: "10 min",
  link: "https://parisjetaime.com/transport/quai-des-tuileries-p1963"
)
quai_des_tuileries.photo.attach(io: URI.open("https://www.lieuxtournage.fr/img/1360-Intouchables/72290-Pont-sur-la-Seine-miniature.png"), filename:"quai_tuilerie.png", content_type: "image/png")
quai_des_tuileries.save!

castle_of_pyke = Scene.create(
  movie: gameofthrones,
  place: bushmills,
  user: user3,
  title: "Le chateau de Pyke",
  content: "Le château de Dunluce, construit au XVIe siècle par les MacQuillans, est perché sur une falaise et abandonné après l'effondrement de ses cuisines dans la mer, tuant 7 personnes. Connue pour cette tragédie, la forteresse a également été utilisée comme décor pour le château de Pyke dans Game of Thrones, représentant le Royaume des Greyjoys.",
  price: 7.0,
  rating: 4.6,
  time: "2h30",
  link: "https://discovernorthernireland.com/things-to-do/dunluce-castle-p675011"
)
castle_of_pyke.photo.attach(io: URI.open("https://i.etsystatic.com/15674668/r/il/259645/3038410418/il_570xN.3038410418_bbpv.jpg"), filename:"castle_of_pyke.png", content_type: "image/png")
castle_of_pyke.save!

fort_de_minceta = Scene.create(
  movie: gameofthrones,
  place: dubrovnik,
  user: user3,
  title: "fort de Minčeta",
  content: "la Tour Minčeta, a aussi été utilisée pour représenter l’extérieur de la House of the Undying (Hôtel des Nonmourants) à Qarth dans la Saison 2 (Episode 10), quand Daenerys cherche à sauver ses dragons.",
  price: "15€",
  rating: 4.6,
  time: "2h",
  link: "https://dpds.hr/"
)
fort_de_minceta.photo.attach(io: URI.open("https://ih0.redbubble.net/image.4951460969.1772/raf,360x360,075,t,fafafa:ca443f4786.jpg"), filename:"mincetatower", content_type: "image/png")
fort_de_minceta.save!

walk_of_shame = Scene.create(
  movie: gameofthrones,
  place: dubrovniktwo,
  user: user3,
  title: "Walk of Shame",
  content: "Plusieurs scènes emblématiques de Game of Thrones ont été tournées dans la vieille ville de Dubrovnik, dont la célèbre marche de la honte de Cersei sur les Jesuit Stairs. Pour éviter la foule, il est recommandé de visiter tôt le matin. De plus, les rues de la vieille ville ont également servi de toile de fond à la scène des dragons brûlant King's Landing dans la dernière saison.",
  price: "Gratuit",
  time: "5 min",
  link: "https://www.movieworldmap.com/filming-locations/cersei-lannisters-walk-of-shame/#:~:text=of%20Thrones%20Series-,Filming%20Location,several%20locations%20in%20Dubrovnik%2C%20Croatia."
)
walk_of_shame.photo.attach(io: URI.open("https://www.gpsmycity.com/img/gd_attr/5525.jpg"), filename:"walkofshame", content_type: "image/png")
walk_of_shame.save!

quaineuftroisquart = Scene.create(
  movie: harrypotter,
  place: london,
  user: user3,
  title: "Quai 9 3/4",
  content: "La gare de King's Cross est célèbre pour son lien avec Harry Potter. Dans l'univers de Harry Potter, les personnages prennent le train Poudlard Express depuis la plateforme 9¾, située entre les quais 9 et 10. Une installation artistique sous la forme d'un chariot enfoncé dans un mur représente la plateforme 9¾ à la gare, et c'est devenu un site emblématique pour les fans de la série.",
  price: "Gratuit",
  rating: 3.0,
  time: "5 min",
  link: "https://visite-londres.com/quai-9-3-4-harry-potter-londres-kings-cross/"
)
quaineuftroisquart.photo.attach(io: URI.open("https://www.poudlard.org/wp-content/uploads/sites/8/2020/03/Kings_Cross_Station_Platforms_London_-_Sept_2007.jpg"), filename:"quaineuftroisquart", content_type: "image/png")
quaineuftroisquart.save!

poudlard = Scene.create(
  movie: harrypotter,
  place: alnwick,
  user: user3,
  title: "Chateau de Poudlard",
  content: "Harry Potter à l'école des sorciers et Harry Potter et la Chambre des secrets. Plus précisément, les extérieurs du château ont été utilisés pour les scènes de vol sur balai, notamment celles où Harry apprend à voler avec le professeur McGonagall." ,
  price: "70€",
  rating: 5.0,
  time: "4h30",
  link: "https://www.alnwickcastle.com/explore/on-screen/harry-potter"
)
poudlard.photo.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Alnwick_Castle_in_uk.jpg/1200px-Alnwick_Castle_in_uk.jpg"), filename:"lechateaudepoudlard", content_type: "image/png")
poudlard.save!

palaisdecaserte = Scene.create(
  movie: starwars,
  place: caserta,
  user: user3,
  title: "Le palais de Caserte",
  content: "Le Palais Royal de Caserte a été utilisé comme lieu de tournage de deux des films de la série Star Wars. Lors de votre visite, pourrez-vous imaginer le monde dans une galaxie très lointaine que ce site a inspiré ?",
  price: "21€",
  rating: 4.1,
  time: "3h",
  link: "https://reggiadicaserta.cultura.gov.it/"
)
palaisdecaserte.photo.attach(io: URI.open("https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/90/86.jpg"), filename:"lepalaisdecaserte", content_type: "image/png")
palaisdecaserte.save!

Review.create!(scene: escaliers, user: user, content: "Beaucoup de gens déguisés en joker en train de faire des shoots.", rating: 5)
Review.create!(scene: escaliers, user: user2, content: "Beaucoup de monde, mais c'est sympa", rating: 4)
Review.create!(scene: loew_jersey, user: user3, content: "J'ai fais une visite guidé, c'était cool.", rating: 4)
Review.create!(scene: loew_jersey, user: user, content: "J'ai beaucoup aimé ce lieu, j'ai fais tout plein de photos!", rating: 5)
Review.create!(scene: conjuring, user: user2, content: "Un fantôme est apparu pendant la visite, on a discuté avec lui", rating: 5)
Review.create!(scene: conjuring, user: user3, content: "Des evènement paranormaux se sont produit pendant la visite, frissons garantis!", rating: 4)
Review.create!(scene: paramount_theater, user: user3, content: "On peut pas y entrer.", rating: 3)
Review.create!(scene: paramount_theater, user: user, content: "Etant street photographer j'ai bien aimé", rating: 5)
Review.create!(scene: venice_beach, user: user2, content: "Je me suis sentie dans mon univers", rating: 5)
Review.create!(scene: venice_beach, user: user, content: "Ca m'a bien plus", rating: 4)
Review.create!(scene: castle_of_pyke, user: user3, content: "Paysage époustouflant", rating: 5)
Review.create!(scene: castle_of_pyke, user: user1, content: "Ce lieu est magique", rating: 5)
Review.create!(scene: fort_de_minceta, user: user3, content: "Ce lieu renferme tout une histoire", rating: 5)
Review.create!(scene: fort_de_minceta, user: user2, content: "Il fesait trop froid", rating: 3)
Review.create!(scene: walk_of_shame, user: user2, content: "J'ai pu faire mon photo shooting , sauf qu'un passant a voulu s'incruster dedans", rating: 5)
Review.create!(scene: walk_of_shame, user: user1, content: "Je suis tombé sur une dame qui fesait trop la diva, mauvaise expérience.", rating: 1)
Review.create!(scene: quaineuftroisquart, user: user, content: "J'ai pu voir l'emplacement mythique du caddie enfoncé dans un mur!", rating: 5)
Review.create!(scene: quaineuftroisquart, user: user3, content: "Y'a juste un chariot à voir quoi", rating: 2)
Review.create!(scene: poudlard, user: user, content: "Mon moment préféré ? La partie de quidditch !", rating: 5)
Review.create!(scene: poudlard, user: user3, content: "Il y a tellement de chose à voir et a faire, j'y retournerai!", rating: 5)
Review.create!(scene: palaisdecaserte, user: user2, content: "Pour les fans nostalgiques des premiers films star wars!", rating: 4)
Review.create!(scene: palaisdecaserte, user: user3, content: "Cet endroit est incroyable, on a pas le temps de tout voir en une journée", rating: 5)

liliane = FavoriteList.create!(name: "Royaume-Uni", user: user1)
Favorite.create!(favorite_list: liliane, scene: poudlard)
Favorite.create!(favorite_list: liliane, scene: quaineuftroisquart)

barbara = FavoriteList.create!(name: "Game of Thrones", user: user,)
Favorite.create!(favorite_list: barbara, scene: walk_of_shame)
Favorite.create!(favorite_list: barbara, scene: fort_de_minceta)
Favorite.create!(favorite_list: barbara, scene: castle_of_pyke)

barba = FavoriteList.create!(name: "Italie", user: user,)
Favorite.create!(favorite_list: barba, scene: palaisdecaserte)

end
