package src.Game {
	
	public class HelperMethods {
		
		public static function levelToFrameNumber(n: int): int {
			switch (n) {
				case 1:
					return FrameMap.foothill;
				case 2:
					return FrameMap.c2nd_chamber;
				case 3:
					return FrameMap.c3rd_chamber;
				case 4:
					return FrameMap.c4th_chamber;
				case 5:
					return FrameMap.c5th_passage;
				case 6:
					return FrameMap.c6th_chamber;
				case 7:
					return FrameMap.c7th_chamber;	
				case 8:
					return FrameMap.c8th_out;
				default:
					return FrameMap.foothill;

			}
		}

		public static function frameNumberToLevel(n: int): int {
			if (n <= 7) {
				return 1;
			} else if (n <= 10) {
				return 2;
			} else if (n <= 19) {
				return 3;
			} else if (n <= 29) {
				return 4;
			} else if (n <= 37) {
				return 5;
			} else if (n <= 49) {
				return 6;
			} else {
				return 7;
			}
		}

	}
	
}
