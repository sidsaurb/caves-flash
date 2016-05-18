package src.NetworkManager {
	
	import src.com.adobe.crypto.MD5;

	public class CheckAnswerRequest {

		public var answer:String;
		public var teamname:String;
		public var password:String;
		
		public function CheckAnswerRequest(teamname:String, password:String, answer:String) {
			// constructor code
			this.answer = MD5.hash(answer);
			this.password = password;
			this.teamname = teamname;
		}

	}
	
}
