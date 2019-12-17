Dir.chdir '../NewMusic'

def create_playlist # method to randomly select an artist and then a sub folder and then a song.
	artists = Dir['*/']
	artist_count = artists.length
	artist_names = [] # get all the names of the artists
	artists.each do |name|
		artist_names.push name.tr!('/', '')
	end
	pick_artist = artists[rand(artist_count)]

	Dir.chdir "#{pick_artist}" # can navigate into given directory using interpolation!
	albums = Dir['*/']
	albums_count = albums.length
	album_names = [] # get all the names of the albums
	albums.each do |name|
		album_names.push name.tr!('/', '')
	end
	pick_album = album_names[rand(albums_count)]

	Dir.chdir "#{pick_album}"
	songs = Dir['*.mp3']
	songs.entries
	songs_count = songs.length
	pick_song = songs.entries[rand(songs_count)]

	File.write("../../../programs/NewPlaylist.m3u", "#{pick_song}\n", mode: 'a')
	puts "song added: #{pick_song}"
	Dir.chdir '../../'
end

$i = 0
$num = 20
begin
   create_playlist
   $i +=1
end while $i < $num


=begin
navigate to the directory holding the music folders
randomly select an artist from the directory
navigate into that directory
randomly select a sub directory
enter that sub directory
randomly select an mp3
get the name of that file and add it to the playlist file
repeat 20 times
=end
