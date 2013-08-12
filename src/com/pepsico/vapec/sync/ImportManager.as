package com.pepsico.vapec.sync
{
	import deng.fzip.FZipFile;
	
	import com.pepsico.vapec.db.SqliteBase;
	
	public class ImportManager
	{
	    protected var dbConn:SqliteBase = new SqliteBase();
		protected var dat:Date = new Date();
		
		public function ImportManager()
		{
		}
		
		public function processZipTableEntry(zipEntryData:FZipFile):String
		{
			var data:String = zipEntryData.getContentAsString();
			var logMsgs:String = "";
			var lines:Array = data.split(/\r\n|\n|\r/);
			var tableHeaders:String = lines[0];
			
			trace("Table Headers: (" + dat + ")");
			logMsgs += "Table Headers: (" + dat + ")";
			trace(tableHeaders);
			
			lines.shift();
			lines.pop();
			
			for (var i:int=0; i<lines.length; i++)
			{ 
				dbConn.insertLineToTable(zipEntryData.filename.substring(0, zipEntryData.filename.indexOf(".")), tableHeaders, lines[i]);
			}
			dat = new Date();
			logMsgs += "End Table: (" + dat + ")";
			
			return logMsgs;
		}
	}
}