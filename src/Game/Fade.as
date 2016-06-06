package src.Game {
	import flash.display.Stage;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;

	/*
	 * Class used to create a zooming and fading animation while transitioning between the frames.
	 */
	public class Fade {
		public static function fadeIntoFrame(root, stage, frame: int, Scene: String = null, alphaPerFrame: Number = 0.05) {
			var data: BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0);
			data.draw(stage);

			var stageData: Bitmap = new Bitmap;
			stageData.bitmapData = data;

			var stageClip: MovieClip = new MovieClip();
			stageClip.addChild(stageData);

			if (Scene != null) {
				MovieClip(root).gotoAndStop(frame, Scene);
			} else {
				MovieClip(root).gotoAndStop(frame);
			}

			stageClip.x = 0;
			stageClip.y = 0;

			stage.addChild(stageClip);

			var highIndex: int = stage.getChildIndex(stage.getChildAt(stage.numChildren - 1));
			stage.setChildIndex(stageClip, highIndex);

			stageClip.addEventListener(Event.ENTER_FRAME, fadeTo);

			function fadeTo(e: Event) {
				//trace("called");
				e.currentTarget.alpha -= alphaPerFrame;
				e.target.width += 30;
				e.target.height += 30;
				e.target.x -= 15;
				e.target.y -= 15;
				if (e.currentTarget.alpha <= 0) {
					e.currentTarget.removeEventListener(Event.ENTER_FRAME, fadeTo);
					e.currentTarget.parent.removeChild(e.currentTarget);
				}
			}
		}

	}

}