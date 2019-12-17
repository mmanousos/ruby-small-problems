Dir.chdir '../NewMusic'

$counter = 0

def create_playlist # method to randomly select an artist and then a sub folder and then a song.
	artists = Dir['*/']
	artist_count = artists.length
	pick_artist = artists.entries[rand(artist_count)]

	Dir.chdir "#{pick_artist}" # can navigate into given directory using interpolation!
	albums = Dir['*/']
	albums_count = albums.length
	pick_album = albums.entries[rand(albums_count)]

	Dir.chdir "#{pick_album}"
	songs = Dir['*.mp3']
	songs_count = songs.length
	pick_song = songs.entries[rand(songs_count)]

	File.write("../../../programs/NewPlaylist_recur.m3u", "#{pick_song}\n", mode: 'a')
	puts "song added: #{pick_song}"

	$counter += 1
	if $counter < 20
		Dir.chdir '../../'
		create_playlist
	end
end

create_playlist

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
