﻿package com.kode80.swf.abc.multinames 
{
	import com.kode80.swf.abc.MultinameInfo;
	import com.kode80.swf.abc.NamespaceSet;
	import com.kode80.swf.utils.readEncodedU32;
	import flash.utils.ByteArray;
	
	/**
	* ...
	* @author Ben Hopkins
	*/
	public class Multiname extends AbstractMultiname
	{
		protected var _nameIndex:uint;
		protected var _namespaceSetIndex:uint;
		
		//=========================================================
		//	Properties
		//=========================================================
		
		public function get name():String { return _info.constantPool.getStringAt( _nameIndex); }
	
		public function get namespaceSet():NamespaceSet { return _info.constantPool.getNamespaceSetAt( _namespaceSetIndex); }
		
		//=========================================================
		//	Constructor
		//=========================================================
		
		public function Multiname( info:MultinameInfo) 
		{
			super( info);
		}
		
		//=========================================================
		//	Public Methods
		//=========================================================
		
		override public function readFrom(bytes:ByteArray):void 
		{
			_nameIndex = readEncodedU32( bytes);
			_namespaceSetIndex = readEncodedU32( bytes);
		}
		
		override public function toString():String 
		{
			return super.toString() + "\nname:" + name + "\nnamespace set:" + namespaceSet + "\n";
		}
	}
	
}