package
{
    // Programme de test
     
    // Fichiers nécessaires
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.filters.BlurFilter;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.ui.Mouse;
    import flash.display.Bitmap;
    import flash.events.MouseEvent;
    import flash.utils.Timer;
   
    // Le code
    public class Test extends Sprite {
         
        private var _bmp:Bitmap;
        private var _clock:Timer;
        private var _lastPosition:Point;
         
        public function Test() {
            addEventListener(Event.ADDED_TO_STAGE, Evt_added);
        }
         
        private function _init():void {
            stage.frameRate = 30;
             
            _bmp = new Bitmap(new BitmapData(stage.stageWidth, stage.stageHeight, false, 0x000000));
            _bmp.cacheAsBitmap = true;
            _bmp.opaqueBackground = 0x000000;
            addChild(_bmp);
             
            _lastPosition = new Point(mouseX, mouseY);
             
            stage.addEventListener(MouseEvent.MOUSE_MOVE, Evt_mouseMoved);
             
            _clock = new Timer(60);
            _clock.addEventListener(TimerEvent.TIMER, Evt_frame);
            _clock.start();
        }
         
        private function _particle():void {
            var pX:int = mouseX;
            var pY:int = mouseY;
             
            var x0:int = _lastPosition.x;
            var y0:int = _lastPosition.y;
            var x1:int = pX;
            var y1:int = pY;
             
            // Tracé de la ligne (Bresenham)
             
            var error: int;
             
            var dx: int = x1 - x0;
            var dy: int = y1 - y0;
             
            var yi: int = 1;
            if( dx < dy ){
                x0 ^= x1; x1 ^= x0; x0 ^= x1;
                y0 ^= y1; y1 ^= y0; y0 ^= y1;
            }
            if( dx < 0 ){
                dx = -dx; yi = -yi;
            }
            if( dy < 0 ){
                dy = -dy; yi = -yi;
            }
            if( dy > dx ){
                error = -( dy >> 1 );
                for ( ; y1 < y0 ; y1++ ) {
                    _bmp.bitmapData.fillRect(new Rectangle(x1 - 4, y1 - 4, 8, 8), 0xffffff);
                    error += dx;
                    if( error > 0 ){
                        x1 += yi;
                        error -= dy;
                    }
                }
            }else{
                error = -( dx >> 1 );
                for ( ; x0 < x1 ; x0++ ) {
                    _bmp.bitmapData.fillRect(new Rectangle(x0 - 4, y0 - 4, 8, 8), 0xffffff);
                    error += dy;
                    if( error > 0 ){
                        y0 += yi;
                        error -= dx;
                    }
                }
            }
             
            _lastPosition.x = pX;
            _lastPosition.y = pY;
        }
         
        private function Evt_added(evt:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, Evt_added);
            _init();
        }
         
        private function Evt_mouseMoved(evt:MouseEvent):void {
            _particle();
        }
         
        private function Evt_frame(evt:TimerEvent):void {
            _bmp.bitmapData.applyFilter(_bmp.bitmapData, new Rectangle(0, 0, _bmp.bitmapData.width, _bmp.bitmapData.height), new Point(), new BlurFilter(4, 4, 2));
        }
    }
}
