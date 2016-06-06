package src.Game {

	/*
	* Stores some important global variables used throughout the game 
	*/
	public class Globals {

		public static var completedTill: int;
		public static var teamname: String;
		public static var password: String;
		public static var spiritFreed: Boolean;
		public static var mushroomPlucked: Boolean = false;
		public static var wandPresent: Boolean = false;

		// contents of this array descibe which level has a challenge that is to be fetched directly from the server.
		// exmple: DES level doesn't has a challenge that directly needs to be fetched. Hence its not a part of this array
		public static var challengeLevels: Array = new Array(
			FrameMap.c1st_milestone,
			FrameMap.c2nd_milestone,
			FrameMap.c3rd_milestone,
			FrameMap.c6th_milestone,
			FrameMap.c7th_milestone
		);
	}
}