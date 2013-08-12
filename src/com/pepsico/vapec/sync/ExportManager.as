package com.pepsico.vapec.sync
{
	public class ExportManager
	{
	   import flash.filesystem.File;
	   import flash.filesystem.FileMode;
	   import flash.filesystem.FileStream;
	   import deng.fzip.*;
	   
		public function ExportManager()
		{
			var zip:FZip = new FZip();
			zip.addFile("/_rels/", null, false);
			zip.addFile("/docProps/", null, false);
			zip.addFile("/word/", null, false);
			zip.addFile("[Content_Types].xml", bytContentType, false);
			zip.addFile("/docProps/app.xml", bytApp, false);
			zip.addFile("/docProps/core.xml", bytCore, false);
			zip.addFile("/word/document.xml", bytDocument, false);
			zip.addFile("/word/fontTable.xml", bytFontTable, false);
			zip.addFile("/word/settings.xml", bytSettings, false);
			zip.addFile("/word/webSettings.xml", bytWebSettings, false);
			zip.addFile("/_rels/.rels", bytRels, false);
			var file:File = File.documentsDirectory;
			file = file.resolvePath(folder + ".docx");
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			zip.serialize(stream);
			stream.close();
		}
	}
}