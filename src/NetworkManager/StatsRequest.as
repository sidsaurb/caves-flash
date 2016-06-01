package src.NetworkManager {

	public class StatsRequest {

		public var teamname: String;
		public var password: String;

		public function StatsRequest(teamName: String, password: String) {
			this.teamname = teamName;
			this.password = password;
		}

	}
}