package be.creynders.lib.utils{
	
	public class DateUtil{
		static public const NAME : String = 'DateUtil';
		
		static public const MS_PER_MINUTE : int = 1000 * 60;
		static public const MS_PER_HOUR : int = 1000 * 60 * 60;
		static public const MS_PER_DAY : int = 1000 * 60 * 60 * 24;
		static public const MS_PER_WEEK : int = 1000 * 60 * 60 * 24 * 7;
		
		static public function clone( date : Date ) : Date{
			return new Date( date.getTime() );
		}
		
		static public function isLeapYear( year : uint ) : Boolean{
			if( year % 400 == 0 ) return true;
			if( year % 100 == 0 ) return false;
			if( year % 4 == 0 ) return true;
			return false;			
		}
		
		/**
		 * 
		 * @param	date
		 * @param	format
		 * "d" day [1;31], w/o leading zeroes
		 * "D" day [1;31], with leading zeroes
		 * "m" month [1;12], w/o leading
		 * "M" month [1;12], with leading
		 * "y" year [0;99], w/o leading
		 * "Y" year [0;99], with leading
		 * "J" year [1970;9999]
		 * "h" hour [0;23], w/o leading
		 * "H" hour [0;23], with leading
		 * "i" minutes [0;59], w/o leading
		 * "I" minutes [0;59], with leading
		 * "s" seconds [0;59], w/o leading
		 * "S" seconds [0;59], with leading
		 * "u" milliseconds [0;999], w/o leading
		 * "U" milliseconds [0;999], with leadin
		 * @usage	<code>
		 * var d : Date = new Date();
		 * trace( DateUtil.dateToString( d, "H:I:S D/M/J" );
		 * //will output something like: 13:42:32 06/11/2008
		 * </code>
		 * @return
		 */
		
		static public function dateToString( date : Date, format : String ) : String{
			var output : String = ""; 
			for( var i : int = 0 ; i < format.length ; i++ ){
				var char : String = format.charAt( i );
				var value : String;
				switch( char ){
					case "d": value = ( date.getDate() ).toString(); break;
					case "D": value = StringUtil.addLeading( "0", ( date.getDate() ).toString(), 2 ); break;
					case "m": value = ( date.getMonth() + 1 ).toString(); break;
					case "M": value = StringUtil.addLeading( "0", ( date.getMonth() + 1 ).toString(), 2 ); break;
					case "y": value = date.getFullYear().toString().substr( -2, 2); break;
					case "Y": value = date.getFullYear().toString().substr( -2, 2); break;
					case "J": value = ( date.getFullYear() ).toString(); break;
					case "h": value = ( date.getHours() ).toString(); break;
					case "H": value = StringUtil.addLeading( "0", ( date.getHours() ).toString(), 2 ); break;
					case "i": value = ( date.getMinutes() ).toString(); break;
					case "I": value = StringUtil.addLeading( "0", ( date.getMinutes() ).toString(), 2 ); break;
					case "s": value = ( date.getSeconds() ).toString(); break;
					case "S": value = StringUtil.addLeading( "0", ( date.getSeconds() ).toString(), 2 ); break;
					case "u": value = ( date.getMilliseconds() ).toString(); break;
					case "U": value = StringUtil.addLeading( "0", ( date.getMilliseconds() ).toString(), 3 ); break;
					default: value = char; break;
				}
				output += value;
			}
			return output;
		}
		
		static public function stringToDate( date : String, format : String, useUTC : Boolean = false ) : Date {
			var i : int;
			var n : int = format.length;
			var day : uint = 0;
			var month : uint = 0;
			var year : uint = 0;
			var hours : uint = 0;
			var minutes : uint = 0
			var seconds : uint = 0;
			var ms : uint = 0;
			for( i = 0 ; i < n ; i++ ) {
				var char : String = format.charAt( i );
				switch( char ) {
					case "D": {
						day = uint( date.substr( 0, 2 ) ); 
						date = date.slice( 2 ); 
						break;
					}
					case "M": {
						month = uint( date.substr( 0, 2 ) ) - 1; 
						date = date.slice( 2 ); 
						break; //must be 0-based
					}
					case "Y": {
						year = uint( date.substr( 0, 2 ) ) + 2000; 
						date = date.slice( 2 );
						break;
					}
					case "J": {
						year = uint( date.substr( 0, 4 ) ); 
						date = date.slice( 4 );
						break;
					}
					case "H": {
						hours = uint( date.substr( 0, 2 ) ); 
						date = date.slice( 2 );
						break;
					}
					case "I": {
						minutes = uint( date.substr( 0, 2 ) ); 
						date = date.slice( 2 );
						break;
					}
					case "S": {
						seconds = uint( date.substr( 0, 2 ) ); 
						date = date.slice( 2 );
						break;
					}
					case "U": {
						ms = uint( date.substr( 0, 3 ) ); 
						date = date.slice( 3 );
						break;
					}
					default: {
						date = date.slice( 1 ); 
						break;
					}
				}
			}
			
			var result : Date;
			if ( useUTC ) {
				result = getUTCDate( year, month, day, hours, minutes, seconds, ms );
			}else {
				result = new Date( year, month, day, hours, minutes, seconds, ms );
			}
			
			//trace( year, month, day, hours, minutes, seconds, ms );
			return result
		}
		
		static public function getDaysInMonths( year : uint ) : Array{
			
			//skip february
			var output : Array = [
				31, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
			];
			
			//add february
			if( isLeapYear( year ) ) output.splice( 1, 0, 29 );
			else output.splice( 1, 0, 28 );
			
			return output;
		}
		
		static public function subtractDays( date : Date, numDays : int ) : Date{
			var output : Date = clone( date )
			output.setDate( date.getDate() - numDays );
			return output; 
		}
		
		static public function addDays( date : Date, numDays : int ) : Date{
			var output : Date = clone( date )
			output.setDate( date.getDate() + numDays );
			return output; 
		}
		
		static public function subtractWeeks( date : Date, numWeeks : int ) : Date{
			var output : Date = clone( date )
			output.setDate( date.getDate() - ( numWeeks * 7 ) );
			return output; 
		}
		
		static public function addWeeks( date : Date, numWeeks : int ) : Date{
			var output : Date = clone( date )
			output.setDate( date.getDate() + ( numWeeks * 7 ) );
			return output; 
		}
		
		static public function subtractMonths( date : Date, numMonths : int ) :Date{
			var output : Date = clone( date )
			output.setMonth( date.getMonth() - numMonths );
			return output; 
		}

		static public function addMonths( date : Date, numMonths : int ) :Date{
			var output : Date = clone( date )
			output.setMonth( date.getMonth() + numMonths );
			return output; 
		}

		static public function subtractYears( date : Date, numYears : int ) :Date{
			var output : Date = clone( date )
			output.setFullYear( date.getFullYear() - numYears, date.getMonth(), date.getDate() );
			return output; 
		}

		static public function addYears( date : Date, numYears : int ) :Date{
			var output : Date = clone( date )
			output.setFullYear( date.getFullYear() + numYears, date.getMonth(), date.getDate() );
			return output; 
		}
		
		static public function randomDate() : Date {
			var now : Number = new Date().getTime();
			return new Date( Math.round( now * Math.random() ) );
		}
		
		static public function randomFromRange( start : Date, end : Date ) : Date {
			var startMS : Number = start.getTime();
			var endMS : Number = end.getTime();
			var randomMS : Number = MathUtil.randomFromRange( startMS, endMS, true );
			var output : Date = new Date();
			output.setTime( randomMS );
			return output;
		}
		
		static public function getDaysBetween( date1 : Date, date2 : Date ) : Number {
			var t1 : Number = date1.getTime();
			var t2 : Number = date2.getTime();
			var d : Number = t2 - t1;
			return d / MS_PER_DAY;
		}
		
		static public function getDays( date : Date ) : Number{
			return date.getTime() / MS_PER_DAY;
		}
		
		static public function getUTCDate( year : Number, month : Number, date : Number = 1, hours : Number = 0, minutes : Number = 0, seconds : Number = 0, milliSeconds : Number = 0 ) : Date {
			var result : Date = new Date()
			result.setTime( Date.UTC( year, month, date, hours, minutes, seconds, milliSeconds ) );
			//trace( NAME, 'getUTCDate', result );
			return result;
		}
		
	 
		static public function isValidNumDays( days : int, month : int, year : int ) : Boolean {
			
			var maxdays : int = 0;
			switch( month ) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10: 
				case 12: {
					maxdays = 31;
					break;
				}
				
				case 4:
				case 6:
				case 9:
				case 11: {
					maxdays = 30;
					break;
				}
				
				case 2: {
					maxdays = ( isLeapYear( year ) ) ? 29 : 28;
					break;
				}
				
				default: return false;
			}
			return ( days > 0 ) && ( days <= maxdays );
		}
	}
}