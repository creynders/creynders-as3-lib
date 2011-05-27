package be.creynders.framework.data
{
	import flash.utils.Dictionary;

	public class UniqueList
	{
		public function UniqueList( idFieldName : String ){
			_idFieldName = idFieldName;
			_source = [];
			_indexMap = new Dictionary();
		}
		
		private var _idFieldName : String;
		private var _source : Array;
		private var _indexMap : Dictionary;
		
				/**
		*/
		private var _source : Array;
		public function get source() : Array {
			return _source
		} 
		public function set source( value : Array ) : void {
			_source = value;
			_indexMap = new Dictionary();
			
			var i : int;
			var n : int = _source.length;
			for( i = 0 ; i < n ; i++ ){
				var id : * = _getID( _source[ i ] ); 
				_indexMap[ id ] = i;
			}

		} 
		
		public function addItem( item : * ) : void {
			var index : int;
			var id : * = _getID( item );
			if( hasItem( item ) ){
				//overwrite
				index = _indexMap[ id ];
			}else{
				//add
				index = _source.length;
				_indexMap[ id ] = index;
			}
			_source[ index ] = item;
		}
		
		public function hasItem( item : * ) : Boolean{
			var id : * = _getID( item );
			return _indexMap[ id ] != null;
		}
		
		private function _getID( item : * ) : *{
			return item[ _idFieldName ];
		}
		
		public function removeItem( item : * ) : Boolean{
			if( hasItem( item ) ){
				var id : * = _getID( item );
				var index : int = _indexMap[ id ];
				_source.splice( index, 1 );
				delete _indexMap[ id ];
				return true;
			}
			
			return false;
		}
		
		public function get length() : int{
			return _source.length;
		}
		
		public function getItemAt( index : int ) : *{
			return _source[ index ];
		}
		
	}
}