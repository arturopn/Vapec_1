package extra {
	
	import spark.components.Button;
	import spark.primitives.BitmapImage;
	
	public class IconButton extends Button {
		
		private var _icon:Class;
		
		[SkinPart(required="false")]
		public var iconElement:BitmapImage;
		
		public function get icon():Class {
			
			return _icon;
			
		}
		
		public function set icon(val:Class):void {
			
			_icon = val;
			
			if (iconElement != null) {
				
				iconElement.source = _icon;
				
			}
			
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			
			super.partAdded(partName, instance);
			
			if (icon !== null && instance == iconElement) {
				
				iconElement.source = icon;
				
			}
			
		}
		
	}
	
}