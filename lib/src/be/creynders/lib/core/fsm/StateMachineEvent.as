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


package be.creynders.lib.core.fsm
{
	import flash.events.Event;
	
	public class StateMachineEvent extends Event
	{
		public static const EXIT_CALLBACK:String = "exit";
		public static const ENTER_CALLBACK:String = "enter";
		public static const TRANSITION_COMPLETE:String = "transition complete";
		public static const TRANSITION_DENIED:String = "transition denied";
		
		public var fromState : String;
		public var toState : String;
		public var currentState : String;
		public var allowedStates : Object;

		public function StateMachineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}