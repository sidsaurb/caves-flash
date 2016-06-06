package src.Game {

	/*
	 * This class contains some constants that are fixed throughout the gameplay
	 * All the following constants are used for constructing the HTTP endpoints of
	 * the game.
	 */
	public class Constants {

		public static var BASEURL : String = "http://172.27.22.108:9999/";
		//public static const BASEURL = "http://172.27.30.104:9999/";
		public static const LOGIN = "login";
		public static const CHALLENGES = "challenge";
		public static const CHECKLEVELS = "checkLevel";
		public static const FREESPIRIT = "fs";
		public static const FOUNDWAND = "fw";
		public static const DES = "des";
		public static const AES = "eaeae";
		public static const STATS = "stats";

	}

}