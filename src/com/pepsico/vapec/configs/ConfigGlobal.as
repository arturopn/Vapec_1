package com.pepsico.vapec.configs
{
	import flash.filesystem.File;
	
	public class ConfigGlobal
	{
		public static const APP_DEFAULT_LANGUAGE:String = "ES";
		
		public static const APP_NATIVE_PATH:String = File.applicationDirectory.resolvePath("").nativePath;
		
		public static const WS_IMPORT_ENDPOINT:String = "http://192.168.2.4:8991/sicsweb-services/Services?WSDL";
		public static const WS_EXPORT_ENDPOINT:String = "http://192.168.2.4:8991/sicsweb-services/export";
		public static const WS_ZIP_FILENAME:String    = "vapec_db_import.zip";
		
		public static const DB_FILENAME:String = "test.db";
	}
}