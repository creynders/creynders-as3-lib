/**
 * defines:
 * public be.creynders.data.PriorityQueue
 * internal be.creynders.data.QueueItem
 */

package be.creynders.framework.data
{
	import flash.utils.Dictionary;
	import be.creynders.utils.ArrayUtil;
	
	/**
	 * @usage <code>
			var i : int;
			var queue : PriorityQueue = new PriorityQueue();
			var n : int = 1000;
			var bt : int;
			var et : int;
			for ( i = 0; i < n ; ++i ) {
				var p : int = Math.round( Math.random() * 500 );
				var obj = {};
				obj.message = "Item " + i + ", priority " + p;
				//bt = getTimer();
				queue.insert( obj, p );
				//et = getTimer();
				trace("Enqueued: "+obj.message );
			}
			trace("---------------------------");
			for (i = 0; i < n ; ++i) {
				
				//bt = getTimer();
				obj = queue.removeTop();
				//et = getTimer();
				
				trace("Dequeue: "+obj.message );
			}
		</code>
	 * @author Camille Reynders
	 */
	public class PriorityQueue 
	{
	///////////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR
		
		public function PriorityQueue() 
		{
			init();
		}
		
	///////////////////////////////////////////////////////////////////////////
	// INSTANCE MEMBERS
		
		//--( PROPS          )-------//
		
        private var heap : Array;
		private var map : Object;
		private var nextID : int = 0;
		
		//--( ACCESSORS      )-------//
		
		/**
		 * source
		 */
		public function get source() : Array { return heap };
		
		private function get topVO() : QueueItem {
			if ( heap.length > 0 ) return heap[ 0 ] as QueueItem;
			
			return null;
		}

		/**
		 * top
		 */
		public function get top() : * {
			if ( topVO ) return topVO.item;
			
			return null;
		}
		
		/**
		 * topPriority
		 */
		public function get topPriority() : int {
			if ( topVO ) return topVO.priority;
			
			return -1;
		}
		
		//--( METHS          )-------//
		
		// initialize
        private function init() {
			heap = [];
			map = new Object();
        }

		private function sortHeap() : void {
			heap.sortOn( 'priority', Array.NUMERIC | Array.DESCENDING );
		}
		
		private function deleteFromMap( id : int ) : void {
			map[ id ] = null;
			delete map[ id ];
		}
		
		/**
		 * insert
		 * @param	item
		 * @param	priority
		 * @return (int) id
		 */
        public function insert( item : * , priority : int = 0 ) : int {
			var id : int = nextID++;
			var vo : QueueItem = new QueueItem( item, priority, id );
			heap.push( vo );
			sortHeap();
			map[ id ] = vo;
			return id;
        }
		
		/**
		 * removeTop
		 * @return
		 */
		public function removeTop() : * {
			var vo : QueueItem = heap.shift() as QueueItem;
			deleteFromMap( vo.id );
			return vo.item;
		}
		
		/**
		 * setPriotiy
		 * @param	id
		 * @param	priority
		 */
		public function setPriority( id : int , priority : int = 0 ) : void {
			var vo : QueueItem = map[ id ] as QueueItem;
			vo.priority = priority;
			sortHeap();
		}
		
		/**
		 * getPriority
		 * @param	id
		 * @return (int) priority
		 */
		public function getPriority( id : int ) : int {
			var vo : QueueItem = map[ id ] as QueueItem;
			return vo.priority;
		}
		
		/**
		 * isEmpty
		 * @return
		 */
		public function isEmpty() : Boolean {
			return heap.length == 0;
		}
		
		/**
		 * containsID
		 * @param	id
		 * @return
		 */
		public function containsID( id : int ) : Boolean {
			return map[ id ] != null;
		}
		
		/**
		 * containsItem
		 * @param	item
		 * @return
		 */
		public function containsItem( item : * ) : Boolean {
			return ArrayUtil.indexByKey( heap, 'item', item ) >= 0;
		}
		
		/**
		 * getItemByID
		 * @param	id
		 * @return
		 */
		public function getItemByID( id : int ) : * {
			return map[ id ];
		}
		
		/**
		 * remove
		 * @param	id
		 * @return
		 */
		public function remove( id : int ) : Boolean {
			trace( 'remove: ' + id );
			if ( ! containsID( id ) ) return false;
			
			var index : int = ArrayUtil.indexByKey( heap, 'id', id );
			trace( 'index : ' + index );
			var i : int;
			var n : int = heap.length;
			for( i = 0 ; i < n ; i++ ) {
				trace( heap[ i ] )
			}
			heap.splice( index, 1 );
			
			deleteFromMap( id );
			
			return true;
		}
		
		/**
		 * removeAll
		 */
		public function removeAll() : void {
			while ( ! isEmpty() ) {
				removeTop();
			}
		}
		
	}//end class
	
}//end package

internal class QueueItem {
	public var item : * ;
	public var priority : int;
	public var id : int;
	
	function QueueItem( item : * , priority : int, id : int ) : void {
		this.item = item;
		this.priority = priority;
		this.id = id;
	}
	
	public function toString() : String {
		return this.id + ', ' + this.item + ', ' + this.priority 
	}
}