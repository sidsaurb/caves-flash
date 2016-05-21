package src.NetworkManager {

	public class EncryptionQuery {

		public var teamname: String;
		public var password: String;
		public var plaintext: String;

		public function EncryptionQuery(teamName: String, password: String, plaintext: String) {
			this.teamname = teamName;
			this.password = password;
			this.plaintext = plaintext;
		}

	}

}