package src.Game {
	import flash.utils.Dictionary;

	public class TransitionMap {

		public var transitions: Dictionary;

		public function TransitionMap() {
			transitions = new Dictionary();

			transitions[FrameMap.foothill.toString() + " climb"] = FrameMap.cave_front;
			transitions[FrameMap.foothill.toString() + " go"] = FrameMap.cave_front;

			transitions[FrameMap.cave_front.toString() + " read"] = FrameMap.cave_front_milestone;
			transitions[FrameMap.cave_front.toString() + " enter"] = FrameMap.c1st_chamber;
			transitions[FrameMap.cave_front.toString() + " back"] = FrameMap.foothill;

			transitions[FrameMap.cave_front_milestone.toString() + " enter"] = FrameMap.c1st_chamber;
			transitions[FrameMap.cave_front_milestone.toString() + " back"] = FrameMap.cave_front;

			transitions[FrameMap.c1st_chamber.toString() + " read"] = FrameMap.c1st_milestone;
			transitions[FrameMap.c1st_chamber.toString() + " back"] = FrameMap.cave_front;

			transitions[FrameMap.c1st_milestone.toString() + " back"] = FrameMap.c1st_chamber;

		}

	}

}