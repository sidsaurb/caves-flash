package src.NetworkManager {
	
	import src.com.adobe.crypto.MD5;

	public class LoginRequest {

		public var teamname: String;
		public var password: String;
		
		public function LoginRequest(teamName:String, password:String){
			this.teamname = teamName;
			this.password = MD5.hash(password);
		}
	}
}
