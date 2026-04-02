package;

import backend.modding.poly.PolymodFunkin;
import backend.Song;

class Funkin
{
    #if polymod
    public static var polymod(default, never):PolymodFunkin = new PolymodFunkin();
    #end
    public static function loadSong(song:String, difficulty:String = 'Normal')
    {
        difficulty = difficulty.toLowerCase();
		trace('LOADING SONG');
		trace(Paths.formatToSongPath(song) + difficulty);

        var pathName:String = (difficulty == 'normal') ? Paths.formatToSongPath(song) : Paths.formatToSongPath(song) + '-' + difficulty;

		PlayState.SONG = Song.loadFromJson(pathName, Paths.formatToSongPath(song));
		FlxG.sound.music.stop();

	    LoadingState.loadAndSwitchState(new PlayState());
    }
}