/*

Licensed under the MIT License

Copyright (c) 2009-10 Cássio S. Antonio

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

package be.creynders.framework.core.fsm
{
	public class State
	{
		public var name:String;
		public var from:Object;
		public var enter:Function;
		public var exit:Function;
		public var _parent:State;
		public var children:Array;
		
		public function State(name:String, from:Object = null, enter:Function = null, exit:Function = null, parent:State = null)
		{
			this.name = name;
			if (!from) from = "*";
			this.from = from;
			this.enter = enter;
			this.exit = exit;
			this.children = [];
			if (parent)
			{
				_parent = parent;
				_parent.children.push(this);
			}
		}
		
		public function set parent(parent:State):void
		{
			_parent = parent;
			_parent.children.push(this);
		}
		
		public function get parent():State
		{
			return _parent;
		}
		
		public function get root():State
		{
			var parentState:State = _parent;
			if(parentState)
			{
				while (parentState.parent)
				{
					parentState = parentState.parent;
				}
			}
			return parentState;
		}
		public function get parents():Array
		{
			var parentList:Array = [];
			var parentState:State = _parent;
			if(parentState)
			{
				parentList.push(parentState);
				while (parentState.parent)
				{
					parentState = parentState.parent;
					parentList.push(parentState);
				}
			}
			return parentList;
		}
		public function toString():String
		{
			return this.name;
		}
	}
}