require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({'name' => 'The Beatles'})
artist1.save()
artist2 = Artist.new ({'name' => 'LCD Soundsystem'})
artist2.save()

album1 = Album.new({
  'title' => 'Help',
  'genre' => 'Pop',
  'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
  'title' => 'Abbey Road',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album2.save()

album3 = Album.new({
  'title' => 'Sound of Silver',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })
album3.save()

album4 = Album.new({
  'title' => 'This is Happening',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })
album4.save()





binding.pry
nil