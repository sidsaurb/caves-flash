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

			transitions[FrameMap.c2nd_chamber.toString() + " read"] = FrameMap.c2nd_milestone;
			transitions[FrameMap.c2nd_chamber.toString() + " go"] = FrameMap.c2nd_boulder;
			transitions[FrameMap.c2nd_chamber.toString() + " back"] = FrameMap.c1st_chamber;

			transitions[FrameMap.c2nd_boulder.toString() + " back"] = FrameMap.c2nd_chamber;
			transitions[FrameMap.c2nd_boulder.toString() + " go"] = FrameMap.c2nd_chamber;

			transitions[FrameMap.c2nd_milestone.toString() + " back"] = FrameMap.c2nd_chamber;

			transitions[FrameMap.c3rd_chamber.toString() + " back"] = FrameMap.c2nd_chamber;
			transitions[FrameMap.c3rd_chamber.toString() + " thrnxxtzy"] = FrameMap.c3rd_hidden_door;
			//transitions[FrameMap.c3rd_chamber.toString() + " go"] = FrameMap.c2nd_chamber;
			//transitions[FrameMap.c3rd_chamber.toString() + " enter"] = FrameMap.c2nd_chamber;

			transitions[FrameMap.c3rd_side_chamber.toString() + " back"] = FrameMap.c3rd_chamber;
			transitions[FrameMap.c3rd_side_chamber.toString() + " climb"] = FrameMap.c3rd_under_chamber;
			transitions[FrameMap.c3rd_side_chamber.toString() + " enter"] = FrameMap.c3rd_under_chamber;
			transitions[FrameMap.c3rd_side_chamber.toString() + " put"] = FrameMap.c3rd_hole;
			//transitions[FrameMap.c3rd_side_chamber.toString() + " give"] = FrameMap.c3rd_hole;
			//transitions[FrameMap.c3rd_side_chamber.toString() + " wave"] = FrameMap.c3rd_hole;

			transitions[FrameMap.c3rd_side_without_spirit.toString() + " back"] = FrameMap.c3rd_chamber;
			transitions[FrameMap.c3rd_side_without_spirit.toString() + " climb"] = FrameMap.c3rd_under_chamber;
			transitions[FrameMap.c3rd_side_without_spirit.toString() + " enter"] = FrameMap.c3rd_under_chamber;

			//transitions[FrameMap.c3rd_under_chamber.toString() + " back"] = FrameMap.c3rd_under_chamber;

			transitions[FrameMap.c3rd_hole.toString() + " back"] = FrameMap.c3rd_side_chamber;
			transitions[FrameMap.c3rd_hole.toString() + " pull"] = FrameMap.c3rd_side_chamber;
			
			transitions[FrameMap.c3rd_mushroom_to_spirit.toString() + " back"] = FrameMap.c3rd_side_chamber;
			
			transitions[FrameMap.c3rd_free_spirit.toString() + " back"] = FrameMap.c3rd_side_without_spirit;
			
			transitions[FrameMap.c3rd_hidden_door.toString() + " back"] = FrameMap.c3rd_chamber;
			transitions[FrameMap.c3rd_hidden_door.toString() + " read"] = FrameMap.c3rd_milestone;
			
			transitions[FrameMap.c3rd_milestone.toString() + " back"] = FrameMap.c3rd_hidden_door;
			
			transitions[FrameMap.c4th_chamber.toString() + " back"] = FrameMap.c3rd_chamber;
			transitions[FrameMap.c4th_chamber.toString() + " enter"] = FrameMap.c4th_lake;
			transitions[FrameMap.c4th_chamber.toString() + " go"] = FrameMap.c4th_lake;
			//transitions[FrameMap.c4th_chamber.toString() + " read"] = FrameMap.c3rd_chamber;
			
			transitions[FrameMap.c4th_lake.toString() + " back"] = FrameMap.c4th_chamber;
			//transitions[FrameMap.c4th_lake.toString() + " jump"] = FrameMap.c4th_chamber;
			//transitions[FrameMap.c4th_lake.toString() + " dive"] = FrameMap.c4th_chamber;
			
			transitions[FrameMap.c4th_first_dive.toString() + " back"] = FrameMap.c4th_chamber;
			transitions[FrameMap.c4th_first_dive.toString() + " jump"] = FrameMap.c4th_under_water;
			transitions[FrameMap.c4th_first_dive.toString() + " dive"] = FrameMap.c4th_under_water;
			
			transitions[FrameMap.c4th_under_water.toString() + " back"] = FrameMap.c4th_breathe_and_dive;
			transitions[FrameMap.c4th_under_water.toString() + " up"] = FrameMap.c4th_breathe_and_dive;
			//transitions[FrameMap.c4th_under_water.toString() + " pull"] = FrameMap.c4th_breathe_and_dive;
			//transitions[FrameMap.c4th_under_water.toString() + " take"] = FrameMap.c4th_breathe_and_dive;
			
			transitions[FrameMap.c4th_breathe_and_dive.toString() + " back"] = FrameMap.c4th_lake_shore_without_wand;
			//transitions[FrameMap.c4th_breathe_and_dive.toString() + " pull"] = FrameMap.c4th_lake_shore_without_wand;
			//transitions[FrameMap.c4th_breathe_and_dive.toString() + " take"] = FrameMap.c4th_lake_shore_without_wand;
			
			transitions[FrameMap.c4th_lake_shore_with_wand.toString() + " back"] = FrameMap.c4th_chamber;
			transitions[FrameMap.c4th_lake_shore_with_wand.toString() + " go"] = FrameMap.c4th_chamber;
			transitions[FrameMap.c4th_lake_shore_with_wand.toString() + " dive"] = FrameMap.c4th_more_dives;
			transitions[FrameMap.c4th_lake_shore_with_wand.toString() + " jump"] = FrameMap.c4th_more_dives;
			
			transitions[FrameMap.c4th_more_dives.toString() + " back"] = FrameMap.c4th_lake; // changed from original
			transitions[FrameMap.c4th_more_dives.toString() + " go"] = FrameMap.c4th_chamber;
			transitions[FrameMap.c4th_more_dives.toString() + " dive"] = FrameMap.c4th_more_dives;
			transitions[FrameMap.c4th_more_dives.toString() + " jump"] = FrameMap.c4th_more_dives;
			
			transitions[FrameMap.c4th_lake_shore_without_wand.toString() + " back"] = FrameMap.c4th_chamber;
			transitions[FrameMap.c4th_lake_shore_without_wand.toString() + " dive"] = FrameMap.c4th_under_water;
			transitions[FrameMap.c4th_lake_shore_without_wand.toString() + " jump"] = FrameMap.c4th_under_water;
			
			transitions[FrameMap.c4th_empty_milestone.toString() + " back"] = FrameMap.c4th_chamber;
			
			transitions[FrameMap.c4th_milestone.toString() + " back"] = FrameMap.c4th_chamber;


		}

	}

}