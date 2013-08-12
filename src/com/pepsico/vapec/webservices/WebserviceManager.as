package com.pepsico.vapec.webservices
{
	import com.pepsico.vapec.configs.ConfigGlobal;
	
	import flash.utils.ByteArray;
	
	import mx.rpc.events.*;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.soap.*;
	import mx.rpc.soap.WebService;
	
	public class WebserviceManager
	{
		public function WebserviceManager()
		{
		}
		
		private var service:WebService;
		private var zipFileStream:ByteArray;
		
		public function importZip():ByteArray 
		{
			service = new WebService();
			 
			service.loadWSDL(ConfigGlobal.WS_IMPORT_ENDPOINT); 
			// GetPayload is the method name you're calling on your web service
			//service.getByteArray.resultFormat = "e4x";
			//service.getByteArray.addEventListener("result", resultHandler);
			//service.getByteArray.addEventListener("fault", faultHandler);
			
			// Method to call once the WSDL is loaded
			service.addEventListener(LoadEvent.LOAD, onWSDLLoaded);
			 
			service.getByteArray();
			
			return zipFileStream;
		}
		
		public function onWSDLLoaded( event:LoadEvent ):void {
			service.getByteArray.addEventListener( ResultEvent.RESULT, onTestMethodResult );
			service.getByteArray.addEventListener( FaultEvent.FAULT, onTestMethodFault );
			
			service.getByteArray();
		}
		
		public function onTestMethodResult(event:ResultEvent):void 
		{
			zipFileStream = event.result as ByteArray;
		}
		
		public function onTestMethodFault(event:FaultEvent):void 
		{
			//deal with event.fault.faultString, etc
		}
	}
}