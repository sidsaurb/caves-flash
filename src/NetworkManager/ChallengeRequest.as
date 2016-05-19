package src.NetworkManager {

	public class ChallengeRequest {

		public var teamname: String;
		public var password: String;

		public function ChallengeRequest(teamName: String, password: String) {
			this.teamname = teamName;
			this.password = password;
		}
	}

}