package {

	import flash.display.MovieClip;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.net.*;
	import src.com.adobe.crypto.MD5;

	import src.Game.*;
	import src.NetworkManager.*;
	import flash.events.*;
	import flash.ui.Keyboard;


	public class Main extends MovieClip {

		var teamNamePrompt: String = "team name here";
		var passwordPrompt: String = "password here";
		var tMap: TransitionMap = new TransitionMap();

		public function Main() {
			teamname.addEventListener(FocusEvent.FOCUS_IN, onTeamNameFocusChange);
			teamname.addEventListener(FocusEvent.FOCUS_OUT, onTeamNameFocusChange);
			password.addEventListener(FocusEvent.FOCUS_IN, onPasswordFocusChange);
			password.addEventListener(FocusEvent.FOCUS_OUT, onPasswordFocusChange);
			teamname.text = teamNamePrompt;
			password.text = passwordPrompt;
			loginbutton.addEventListener(MouseEvent.CLICK, loginHandler);
			//navigateFrame(FrameMap.foothill);
		}


		function loadLevelList(): void {
			var list: Array = new Array(level1, level2, level3, level4, level5, level6, level7);
			for (var i: int = 1; i < 8; i++) {
				if (i <= Globals.completedTill + 1) {
					list[i - 1].alpha = 1.0;
					list[i - 1].addEventListener(MouseEvent.CLICK, selectLevelClick);
				} else {
					list[i - 1].alpha = 0.2;
				}
			}
		}


		function commandAcceptListner(event: KeyboardEvent): void {
			if (event.charCode == 13) {
				var key: String = this.currentFrame.toString() + " " + commandbox.commandtext.text;
				trace(key);
				if (key in tMap.transitions) {
					trace("found")
					//trace(tMap.transitions[key]);
					commandbox.commandtext.text = "";
					navigateFrame(tMap.transitions[key]);
				} else if (this.currentFrame == FrameMap.c1st_milestone) {
					checkLevelnSolution(1, commandbox.commandtext.text);
				} else {
					// show unknown command dialog
					commandbox.commandtext.text = "";
				}
			}
		}

		function checkLevelnSolution(n: int, answer: String): void {
			try {
				//trace(Globals.password);
				var req: CheckAnswerRequest = new CheckAnswerRequest(Globals.teamname, Globals.password, answer);
				var jsonReq: String = JSON.stringify(req);
				//trace(jsonReq);
				var checkLoader: URLLoader = new URLLoader();
				checkLoader.addEventListener(Event.COMPLETE,
					function handler(e: Event): void {
						var resp: Object = JSON.parse(e.target.data);
						if (resp.error == null && resp.success == true) {
							commandbox.commandtext.text = 0;
							navigateFrame(getLevelFrameNumber(n + 1));
						} else {
							// show error dialog
						}
					}, false, 0, true);
				var request: URLRequest = new URLRequest(Constants.BASEURL + Constants.CHECKLEVELS + n.toString());
				request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
				request.data = jsonReq;
				request.method = URLRequestMethod.POST;
				checkLoader.load(request)
			} catch (error: Error) {
				// show error dialog
			}
		}

		function getLevelFrameNumber(n: int): int {
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
				default:
					return FrameMap.foothill;

			}
		}

		var commandboxListnerAdded: Boolean = false;

		function navigateFrame(n: int): void {
			gotoAndStop(n);
			//commandbox.removeEventListener(KeyboardEvent.KEY_DOWN, handler);
			if (!commandboxListnerAdded) {
				commandbox.addEventListener(KeyboardEvent.KEY_DOWN, commandAcceptListner);
				commandboxListnerAdded = true;
			}
		}

		function selectLevelClick(event: MouseEvent): void {
			var name: String = event.currentTarget.name;
			switch (name) {
				case "level1":
					navigateFrame(FrameMap.foothill)
					break;
				case "level2":
					navigateFrame(FrameMap.c2nd_chamber)
					break;
				case "level3":
					navigateFrame(FrameMap.c3rd_chamber)
					break;
				case "level4":
					navigateFrame(FrameMap.c4th_chamber)
					break;
				case "level5":
					navigateFrame(FrameMap.c5th_passage)
					break;
				case "level6":
					navigateFrame(FrameMap.c6th_chamber)
					break;
				case "level7":
					navigateFrame(FrameMap.c7th_chamber)
					break;
			}
		}

		function loginHandler(event: MouseEvent): void {
			try {
				var req: LoginRequest = new LoginRequest(teamname.text, password.text);
				var jsonReq: String = JSON.stringify(req);
				var loginLoader: URLLoader = new URLLoader();
				loginLoader.addEventListener(Event.COMPLETE, function logincomplete(e: Event): void {
					var resp: Object = JSON.parse(e.target.data);
					if (resp.error == null) {
						Globals.completedTill = resp.completedTill;
						Globals.teamname = req.teamname;
						Globals.password = req.password;
						gotoAndStop(2);
						loadLevelList();
					} else {
						// show error dialog
					}
				}, false, 0, true);
				var request: URLRequest = new URLRequest(Constants.BASEURL + Constants.LOGIN);
				request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
				request.data = jsonReq;
				request.method = URLRequestMethod.POST;
				loginLoader.load(request)
			} catch (error: Error) {

			}
		}

		function onTeamNameFocusChange(event: FocusEvent): void {
			switch (event.type) {
				case FocusEvent.FOCUS_IN:
					{
						if (teamname.text == teamNamePrompt) {
							teamname.text = "";
						}
						break;
					}
				case FocusEvent.FOCUS_OUT:
					{
						if (teamname.text == "") {
							teamname.text = teamNamePrompt;
						}
						break;
					}
			}
		}

		function onPasswordFocusChange(event: FocusEvent): void {
			switch (event.type) {
				case FocusEvent.FOCUS_IN:
					{
						if (password.text == passwordPrompt) {
							password.text = "";
							password.displayAsPassword = true;
						}
						break;
					}
				case FocusEvent.FOCUS_OUT:
					{
						if (password.text == "") {
							password.text = passwordPrompt;
							password.displayAsPassword = false;
						}
						break;
					}
			}
		}
	}
}