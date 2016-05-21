package src.Game {

	public class Globals {

		public static var completedTill: int;
		public static var teamname: String;
		public static var password: String;
		public static var spiritFreed: Boolean;
		public static var mushroomPlucked: Boolean = false;
		public static var wandPresent: Boolean = false;

		public static var challengeLevels: Array = new Array(
			FrameMap.c1st_milestone,
			FrameMap.c2nd_milestone,
			FrameMap.c3rd_milestone,
			FrameMap.c6th_milestone
		);
	}
}