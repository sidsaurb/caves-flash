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

			transitions[FrameMap.c5th_passage.toString() + " back"] = FrameMap.c5th_back_fall;
			transitions[FrameMap.c5th_passage.toString() + " go"] = FrameMap.c5th_fall;

			transitions[FrameMap.c5th_back_fall.toString() + " wave"] = FrameMap.c5th_water;
			//transitions[FrameMap.c5th_back_fall.toString() + " *"] = FrameMap.c5th_water;

			transitions[FrameMap.c5th_fall.toString() + " wave"] = FrameMap.c5th_water;
			//transitions[FrameMap.c5th_fall.toString() + " *"] = FrameMap.c5th_water;


			transitions[FrameMap.c5th_water.toString() + " dive"] = FrameMap.c5th_underwater;

			transitions[FrameMap.c5th_underwater.toString() + " back"] = FrameMap.c5th_water;
			transitions[FrameMap.c5th_underwater.toString() + " go"] = FrameMap.c5th_hall;

			transitions[FrameMap.c5th_pool.toString() + " back"] = FrameMap.c5th_water;
			transitions[FrameMap.c5th_pool.toString() + " go"] = FrameMap.c5th_hall;

			transitions[FrameMap.c5th_hall.toString() + " back"] = FrameMap.c5th_pool;
			transitions[FrameMap.c5th_hall.toString() + " read"] = FrameMap.c5th_milestone;

			transitions[FrameMap.c5th_milestone.toString() + " back"] = FrameMap.c5th_hall;

			transitions[FrameMap.c6th_chamber.toString() + " back"] = FrameMap.c5th_hall;
			//transitions[FrameMap.c6th_chamber.toString() + " read"] = FrameMap.c5th_hall;
			transitions[FrameMap.c6th_chamber.toString() + " exit1"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_chamber.toString() + " exit2"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_chamber.toString() + " exit3"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_chamber.toString() + " exit4"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_chamber.toString() + " exit5"] = FrameMap.c6th_maze_0;

			transitions[FrameMap.c6th_maze_1.toString() + " exit1"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_1.toString() + " exit2"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_1.toString() + " exit3"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_1.toString() + " exit4"] = FrameMap.c6th_maze_1;
			//transitions[FrameMap.c6th_maze_1.toString() + " back"] = FrameMap.c6th_maze_1;

			transitions[FrameMap.c6th_maze_2.toString() + " exit1"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_2.toString() + " exit2"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_2.toString() + " exit3"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_2.toString() + " exit4"] = FrameMap.c6th_maze_3;
			//transitions[FrameMap.c6th_maze_2.toString() + " back"] = FrameMap.c6th_maze_2;

			transitions[FrameMap.c6th_maze_3.toString() + " exit1"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_3.toString() + " exit2"] = FrameMap.c6th_maze_3;
			transitions[FrameMap.c6th_maze_3.toString() + " exit3"] = FrameMap.c6th_maze_4;
			transitions[FrameMap.c6th_maze_3.toString() + " exit4"] = FrameMap.c6th_maze_1;
			//transitions[FrameMap.c6th_maze_3.toString() + " back"] = FrameMap.c6th_maze_3;

			transitions[FrameMap.c6th_maze_4.toString() + " exit1"] = FrameMap.c6th_maze_5;
			transitions[FrameMap.c6th_maze_4.toString() + " exit2"] = FrameMap.c6th_maze_3;
			transitions[FrameMap.c6th_maze_4.toString() + " exit3"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_4.toString() + " exit4"] = FrameMap.c6th_maze_2;
			//transitions[FrameMap.c6th_maze_4.toString() + " back"] = FrameMap.c6th_maze_4;

			transitions[FrameMap.c6th_maze_5.toString() + " exit1"] = FrameMap.c6th_maze_5;
			transitions[FrameMap.c6th_maze_5.toString() + " exit2"] = FrameMap.c6th_maze_4;
			transitions[FrameMap.c6th_maze_5.toString() + " exit3"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_5.toString() + " exit4"] = FrameMap.c6th_maze_6;
			//transitions[FrameMap.c6th_maze_5.toString() + " back"] = FrameMap.c6th_maze_5;

			transitions[FrameMap.c6th_maze_6.toString() + " exit1"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_6.toString() + " exit2"] = FrameMap.c6th_maze_5;
			transitions[FrameMap.c6th_maze_6.toString() + " exit3"] = FrameMap.c6th_maze_4;
			transitions[FrameMap.c6th_maze_6.toString() + " exit4"] = FrameMap.c6th_maze_7;
			//transitions[FrameMap.c6th_maze_6.toString() + " back"] = FrameMap.c6th_maze_6;

			transitions[FrameMap.c6th_maze_7.toString() + " exit1"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_7.toString() + " exit2"] = FrameMap.c6th_maze_8;
			transitions[FrameMap.c6th_maze_7.toString() + " exit3"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_7.toString() + " exit4"] = FrameMap.c6th_maze_6;
			//transitions[FrameMap.c6th_maze_7.toString() + " back"] = FrameMap.c6th_maze_7;

			transitions[FrameMap.c6th_maze_8.toString() + " exit1"] = FrameMap.c6th_maze_1;
			transitions[FrameMap.c6th_maze_8.toString() + " exit2"] = FrameMap.c6th_maze_9;
			transitions[FrameMap.c6th_maze_8.toString() + " exit3"] = FrameMap.c6th_maze_7;
			transitions[FrameMap.c6th_maze_8.toString() + " exit4"] = FrameMap.c6th_maze_5;
			//transitions[FrameMap.c6th_maze_8.toString() + " back"] = FrameMap.c6th_maze_8;

			transitions[FrameMap.c6th_maze_9.toString() + " exit1"] = FrameMap.c6th_maze_0;
			transitions[FrameMap.c6th_maze_9.toString() + " exit2"] = FrameMap.c6th_maze_3;
			transitions[FrameMap.c6th_maze_9.toString() + " exit3"] = FrameMap.c6th_maze_8;
			transitions[FrameMap.c6th_maze_9.toString() + " exit4"] = FrameMap.c6th_maze_2;
			//transitions[FrameMap.c6th_maze_9.toString() + " back"] = FrameMap.c6th_maze_9;

			transitions[FrameMap.c6th_maze_0.toString() + " exit1"] = FrameMap.c6th_maze_4;
			transitions[FrameMap.c6th_maze_0.toString() + " exit2"] = FrameMap.c6th_maze_9;
			transitions[FrameMap.c6th_maze_0.toString() + " exit3"] = FrameMap.c6th_maze_7;
			transitions[FrameMap.c6th_maze_0.toString() + " exit4"] = FrameMap.c6th_maze_2;
			transitions[FrameMap.c6th_maze_0.toString() + " read"] = FrameMap.c6th_milestone;
			//transitions[FrameMap.c6th_maze_0.toString() + " back"] = FrameMap.c6th_maze_0;
			
			transitions[FrameMap.c6th_milestone.toString() + " back"] = FrameMap.c6th_maze_0;
			
			//transitions[FrameMap.c7th_chamber.toString() + " back"] = FrameMap.c6th_maze_0;
			transitions[FrameMap.c7th_chamber.toString() + " go"] = FrameMap.c7th_room;
			transitions[FrameMap.c7th_chamber.toString() + " enter"] = FrameMap.c7th_room;
			
			transitions[FrameMap.c7th_room.toString() + " back"] = FrameMap.c7th_chamber;
			transitions[FrameMap.c7th_room.toString() + " go"] = FrameMap.c7th_door;
			transitions[FrameMap.c7th_room.toString() + " enter"] = FrameMap.c7th_door;
			
			transitions[FrameMap.c7th_door.toString() + " back"] = FrameMap.c7th_empty_room;
			transitions[FrameMap.c7th_door.toString() + " go"] = FrameMap.c7th_empty_room;
			transitions[FrameMap.c7th_door.toString() + " enter"] = FrameMap.c7th_empty_room;
			
			//transitions[FrameMap.c7th_empty_room.toString() + " back"] = FrameMap.c7th_empty_room;
			transitions[FrameMap.c7th_empty_room.toString() + " go"] = FrameMap.c7th_corridor;
			transitions[FrameMap.c7th_empty_room.toString() + " enter"] = FrameMap.c7th_corridor;
			
			transitions[FrameMap.c7th_corridor.toString() + " back"] = FrameMap.c7th_empty_room;
			transitions[FrameMap.c7th_corridor.toString() + " go"] = FrameMap.c7th_courtyard;
			transitions[FrameMap.c7th_corridor.toString() + " enter"] = FrameMap.c7th_courtyard;
			
			transitions[FrameMap.c7th_courtyard.toString() + " give"] = FrameMap.c7th_exit;
			//transitions[FrameMap.c7th_courtyard.toString() + " *"] = FrameMap.c7th_exit;
			
			transitions[FrameMap.c7th_exit.toString() + " back"] = FrameMap.c7th_exit_without_creator;
			transitions[FrameMap.c7th_exit.toString() + " read"] = FrameMap.c7th_milestone;
			
			transitions[FrameMap.c7th_milestone.toString() + " back"] = FrameMap.c7th_exit_without_creator;
			
			transitions[FrameMap.c7th_exit_without_creator.toString() + " read"] = FrameMap.c7th_milestone;


		}

	}

}