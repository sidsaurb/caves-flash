﻿package {

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
		var commandboxListnerAdded: Boolean = false;

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
					//trace("found")
					//trace(tMap.transitions[key]);
					commandbox.commandtext.text = "";
					navigateFrame(tMap.transitions[key]);
				} else if (this.currentFrame == FrameMap.c1st_milestone) {
					checkLevelnSolution(1, commandbox.commandtext.text);
				} else if (this.currentFrame == FrameMap.c2nd_milestone) {
					checkLevelnSolution(2, commandbox.commandtext.text);
				} else if (this.currentFrame == FrameMap.c3rd_milestone) {
					checkLevelnSolution(3, commandbox.commandtext.text);
				} else if (this.currentFrame == FrameMap.c4th_milestone) {
					checkLevelnSolution(4, commandbox.commandtext.text);
				} else if (this.currentFrame == FrameMap.c3rd_chamber && (commandbox.commandtext.text == "go" || commandbox.commandtext.text == "enter")) {
					commandbox.commandtext.text = "";
					if (Globals.spiritFreed == true)
						navigateFrame(FrameMap.c3rd_side_without_spirit);
					else
						navigateFrame(FrameMap.c3rd_side_chamber);
				} else if (this.currentFrame == FrameMap.c3rd_side_chamber && commandbox.commandtext.text == "give") {
					commandbox.commandtext.text = "";
					if (Globals.mushroomPlucked == true) {
						Globals.mushroomPlucked = false;
						navigateFrame(FrameMap.c3rd_mushroom_to_spirit);
					} else {
						errorbox.text = "There is nothing to give to anyone";
					}
				} else if (this.currentFrame == FrameMap.c3rd_side_without_spirit && commandbox.commandtext.text == "give") {
					commandbox.commandtext.text = "";
					errorbox.text = "There is no one to give anything";
				} else if (this.currentFrame == FrameMap.c3rd_side_chamber && commandbox.commandtext.text == "wave") {
					commandbox.commandtext.text = "";
					if (Globals.wandPresent == true) {
						sendCheckpointQueries(2);
					} else {
						errorbox.text = "You don't have anything to wave";
					}
				} else if (this.currentFrame == FrameMap.c3rd_under_chamber && (commandbox.commandtext.text == "back" || commandbox.commandtext.text == "back")) {
					commandbox.commandtext.text = "";
					if (Globals.spiritFreed == true) {
						navigateFrame(FrameMap.c3rd_side_without_spirit);
					} else {
						navigateFrame(FrameMap.c3rd_side_chamber);
					}
				} else if (this.currentFrame == FrameMap.c3rd_under_chamber && (commandbox.commandtext.text == "pluck" || commandbox.commandtext.text == "pick")) {
					errorbox.text = "You plucked some smelly mushrooms";
					Globals.mushroomPlucked = true;
					commandbox.commandtext.text = "";
				} else if (this.currentFrame == FrameMap.c4th_chamber && commandbox.commandtext.text == "read") {
					commandbox.commandtext.text = "";
					if (Globals.spiritFreed == true) {
						navigateFrame(FrameMap.c4th_milestone);
						urltextbox.text = Constants.BASEURL + Constants.DES;
					} else {
						navigateFrame(FrameMap.c4th_empty_milestone);
					}
				} else if (this.currentFrame == FrameMap.c4th_lake && (commandbox.commandtext.text == "dive" || commandbox.commandtext.text == "jump")) {
					commandbox.commandtext.text = "";
					if (Globals.wandPresent == true) {
						navigateFrame(FrameMap.c4th_more_dives);
					} else {
						navigateFrame(FrameMap.c4th_first_dive);
					}
				} else if (this.currentFrame == FrameMap.c4th_under_water && (commandbox.commandtext.text == "pull" || commandbox.commandtext.text == "take")) {
					// die and restart the game
					errorbox.text = "You are dead";
				} else if (this.currentFrame == FrameMap.c4th_breathe_and_dive && (commandbox.commandtext.text == "pull" || commandbox.commandtext.text == "take")) {
					commandbox.commandtext.text = "";
					sendCheckpointQueries(1);
				} else {
					// show unknown command dialog
					errorbox.text = "Unknown command " + commandbox.commandtext.text;
					commandbox.commandtext.text = "";
				}
			}
		}

		// checkpoint = 1 : wand found
		// checkpoint = 2 : spirit freed
		function sendCheckpointQueries(checkpoint: int): void {
			try {
				progressbar.visible = true;
				opacity.alpha = 0.85;
				var req: SpiritFreedRequest = new SpiritFreedRequest(Globals.teamname, Globals.password);
				var jsonReq: String = JSON.stringify(req);
				//trace(jsonReq);
				var checkLoader: URLLoader = new URLLoader();
				checkLoader.addEventListener(Event.COMPLETE,
					function handler(e: Event): void {
						var resp: Object = JSON.parse(e.target.data);
						if (resp.error == null && resp.success == true) {
							commandbox.commandtext.text = "";
							progressbar.visible = false;
							if (checkpoint == 2) {
								opacity.alpha = 0.6;
								Globals.spiritFreed = true;
								navigateFrame(FrameMap.c3rd_free_spirit);
							} else {
								opacity.alpha = 0;
								Globals.wandPresent = true;
								navigateFrame(FrameMap.c4th_lake_shore_with_wand);
							}
						} else {
							progressbar.visible = false;
							if (checkpoint == 2) {
								opacity.alpha = 0.6;
								errorbox.text = resp.error;
							} else {
								opacity.alpha = 0;
								errorbox.text = resp.error;
							}
						}
					}, false, 0, true);
				checkLoader.addEventListener(IOErrorEvent.IO_ERROR, function handler(e: Event): void {
					progressbar.visible = false;
					if (checkpoint == 2)
						opacity.alpha = 0.6;
					else
						opacity.alpha = 0;
					errorbox.text = "Oops.. Can't connect";
				});
				checkLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function handler(e: Event): void {
					progressbar.visible = false;
					if (checkpoint == 2)
						opacity.alpha = 0.6;
					else
						opacity.alpha = 0;
					errorbox.text = "Oops.. Can't connect";
				});
				var request: URLRequest;
				if (checkpoint == 2) {
					request = new URLRequest(Constants.BASEURL + Constants.FREESPIRIT);
				} else {
					request = new URLRequest(Constants.BASEURL + Constants.FOUNDWAND);
				}
				request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
				request.data = jsonReq;
				request.method = URLRequestMethod.POST;
				checkLoader.load(request)
			} catch (error: Error) {
				progressbar.visible = false;
				if (checkpoint == 2)
					opacity.alpha = 0.6;
				else
					opacity.alpha = 0;
				errorbox.text = "Oops.. Can't connect";
			}
		}

		function checkLevelnSolution(n: int, answer: String): void {
			try {
				progressbar.visible = true;
				opacity.alpha = 0.85;
				var req: CheckAnswerRequest = new CheckAnswerRequest(Globals.teamname, Globals.password, answer);
				var jsonReq: String = JSON.stringify(req);
				//trace(jsonReq);
				var checkLoader: URLLoader = new URLLoader();
				checkLoader.addEventListener(Event.COMPLETE,
					function handler(e: Event): void {
						var resp: Object = JSON.parse(e.target.data);
						if (resp.error == null && resp.success == true) {
							commandbox.commandtext.text = "";
							progressbar.visible = false;
							opacity.alpha = 0;
							navigateFrame(HelperMethods.levelToFrameNumber(n + 1));
						} else {
							progressbar.visible = false;
							opacity.alpha = 0;
							errorbox.text = "Unknown command " + commandbox.commandtext.text;
							commandbox.commandtext.text = "";
						}
					}, false, 0, true);
				checkLoader.addEventListener(IOErrorEvent.IO_ERROR, function handler(e: Event): void {
					progressbar.visible = false;
					opacity.alpha = 0;
					errorbox.text = "Oops.. Can't connect";
				});
				checkLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function handler(e: Event): void {
					progressbar.visible = false;
					opacity.alpha = 0;
					errorbox.text = "Oops.. Can't connect";
				});
				var request: URLRequest = new URLRequest(Constants.BASEURL + Constants.CHECKLEVELS + n.toString());
				request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
				request.data = jsonReq;
				request.method = URLRequestMethod.POST;
				checkLoader.load(request)
			} catch (error: Error) {
				progressbar.visible = false;
				opacity.alpha = 0;
				errorbox.text = "Oops.. Can't connect";
			}
		}

		function navigateFrame(n: int): void {
			gotoAndStop(n);
			adjustOpacityLevel(n);
			if (Globals.challengeLevels.indexOf(n) >= 0)
				fetchChallenge(n);
			if (!commandboxListnerAdded) {
				commandbox.addEventListener(KeyboardEvent.KEY_DOWN, commandAcceptListner);
				commandboxListnerAdded = true;
			}
		}

		function adjustOpacityLevel(n: int): void {
			if (n == FrameMap.c2nd_chamber) {
				opacity.alpha = 0.75;
			} else if (n == FrameMap.c3rd_side_chamber ||
				n == FrameMap.c3rd_side_without_spirit ||
				n == FrameMap.c3rd_hole ||
				n == FrameMap.c3rd_mushroom_to_spirit ||
				n == FrameMap.c3rd_under_chamber ||
				n == FrameMap.c4th_first_dive ||
				n == FrameMap.c5th_fall ||
				n == FrameMap.c5th_back_fall ||
				n == FrameMap.c3rd_free_spirit) {
				opacity.alpha = 0.6;
			} else if (n == FrameMap.c4th_lake ||
				n == FrameMap.c4th_lake_shore_with_wand ||
				n == FrameMap.c5th_hall ||
				n == FrameMap.c4th_lake_shore_without_wand) {
				opacity.alpha = 0.3;
			} else {
				opacity.alpha = 0;
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

		function fetchChallenge(n: int) {
			retrybox.visible = false;
			opacity.alpha = 0.85;
			progressbar.visible = true;
			var req: ChallengeRequest = new ChallengeRequest(Globals.teamname, Globals.password);
			var jsonReq: String = JSON.stringify(req);
			var challengeLoader: URLLoader = new URLLoader();
			challengeLoader.addEventListener(Event.COMPLETE, function handler(e: Event): void {
				trace(e.target.data);
				var resp: Object = JSON.parse(e.target.data);
				if (resp.error == null) {
					opacity.alpha = 0;
					progressbar.visible = false;
					retrybox.visible = false;
					challengetext.text = resp.challenge;
				} else {
					// show error dialog

					retrybox.visible = true;
					opacity.alpha = 0;
					progressbar.visible = false;
					retrybox.addEventListener(MouseEvent.CLICK, function handler(e: MouseEvent): void {
						fetchChallenge(n);
					});
				}
			}, false, 0, true);
			challengeLoader.addEventListener(IOErrorEvent.IO_ERROR, function handler(e: Event): void {
				opacity.alpha = 0;
				progressbar.visible = false;
				retrybox.visible = true;
				retrybox.addEventListener(MouseEvent.CLICK, function handler(e: MouseEvent): void {
					fetchChallenge(n);
				});
			});
			challengeLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function handler(e: Event): void {
				opacity.alpha = 0;
				progressbar.visible = false;
				retrybox.visible = true;
				retrybox.addEventListener(MouseEvent.CLICK, function handler(e: MouseEvent): void {
					fetchChallenge(n);
				});
			});
			var request: URLRequest = new URLRequest(Constants.BASEURL + Constants.CHALLENGES + HelperMethods.frameNumberToLevel(n));
			request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
			request.data = jsonReq;
			request.method = URLRequestMethod.POST;
			challengeLoader.load(request)
		}

		function loginHandler(event: MouseEvent): void {
			try {
				loginbutton.visible = false;
				progressbar.visible = true;
				errorbox.text = "";
				opacity.alpha = 0.85;
				var req: LoginRequest = new LoginRequest(teamname.text, password.text);
				var jsonReq: String = JSON.stringify(req);
				var loginLoader: URLLoader = new URLLoader();
				loginLoader.addEventListener(Event.COMPLETE, function logincomplete(e: Event): void {
					var resp: Object = JSON.parse(e.target.data);
					trace(e.target.data);
					if (resp.error == null) {
						Globals.completedTill = resp.ct;
						Globals.wandPresent = resp.wf;
						Globals.spiritFreed = resp.sf;
						Globals.teamname = req.teamname;
						Globals.password = req.password;
						opacity.alpha = 0.5;
						gotoAndStop(2);
						loadLevelList();
					} else {
						errorbox.text = resp.error;
						opacity.alpha = 0.5;
						loginbutton.visible = true;
						progressbar.visible = false;
					}
				}, false, 0, true);
				loginLoader.addEventListener(IOErrorEvent.IO_ERROR, function handler(e: Event): void {
					loginbutton.visible = true;
					progressbar.visible = false;
					errorbox.text = "Oops.. Can't connect";
					opacity.alpha = 0.5;
				});
				loginLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function handler(e: Event): void {
					trace("here");
					loginbutton.visible = true;
					progressbar.visible = false;
					errorbox.text = "Oops.. Can't connect";
					opacity.alpha = 0.5;
				});
				var request: URLRequest = new URLRequest(Constants.BASEURL + Constants.LOGIN);
				request.requestHeaders.push(new URLRequestHeader("Content-Type", "text/plain"));
				request.data = jsonReq;
				request.method = URLRequestMethod.POST;
				loginLoader.load(request)
			} catch (error: Error) {
				//trace("sad")
			}
		}

		function onTeamNameFocusChange(event: FocusEvent): void {
			switch (event.type) {
				case FocusEvent.FOCUS_IN:
					if (teamname.text == teamNamePrompt) {
						teamname.text = "";
					}
					break;
				case FocusEvent.FOCUS_OUT:
					if (teamname.text == "") {
						teamname.text = teamNamePrompt;
					}
					break;
			}
		}

		function onPasswordFocusChange(event: FocusEvent): void {
			switch (event.type) {
				case FocusEvent.FOCUS_IN:
					if (password.text == passwordPrompt) {
						password.text = "";
						password.displayAsPassword = true;
					}
					break;
				case FocusEvent.FOCUS_OUT:
					if (password.text == "") {
						password.text = passwordPrompt;
						password.displayAsPassword = false;
					}
					break;
			}
		}
	}
}