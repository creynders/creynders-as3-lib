

package be.creynders.framework.utils {
	
	
	public class StringUtil {
		
		static public const NAME : String  = 'StringUtil';
		
		static private const CHARS : Array = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ];
		
		
		static private const LTRIM_REGEXP : RegExp = /^[\s]*/ig; //  /^[\s]*/ig;
		static private const RTRIM_REGEXP : RegExp = /[\s]*$/ig; //  /[\s]*$/ig
		static private const TRIM_REGEXP : RegExp = /^[\s]*|[\s]*$/ig; //  /^[\s]*|[\s]*$/ig
		
		/**
		 * Adds leading string to string
		 * @usage
		 * <code>
		 * trace( StringUtil.addLeading( "0", "2", 2 ) )
		 * //output: "02"
		 * trace( StringUtil.addLeading( "*", "yeah", 10 ) );
		 * //output: "******yeah"
		 * </code>
		 * @param	leading
		 * @param	sentence
		 * @param	requiredLength
		 * @return
		 */
		static public function addLeading( leading : String, sentence : String, requiredLength : uint ) : String {
			var output : String = sentence;
			if( sentence.length < requiredLength ){
				var diff : int = requiredLength - sentence.length;
				for( var i : uint = 0; i < diff ; i++ ){
					output = leading + output;
				}
			}
			return output;
		}
		
		/**
		 * Adds trailing string to string
		 * @param	trailing
		 * @param	sentence
		 * @param	requiredLength
		 * @return
		 */
		static public function addTrailing( trailing : String, sentence : String, requiredLength : uint ) : String{
			var output : String = sentence;
			if ( sentence.length < requiredLength ){
				var diff : int = requiredLength - sentence.length;
				for ( var i : uint = 0 ; i < diff ; i++ ){
					output += trailing;
				}
			}
			return output;
		}
		
		/**
		 * Strip whitespace from the beginning of a String
		 * @param	haystack
		 * @return
		 */
		static public function ltrim( haystack : String ) : String{
			return haystack.replace( LTRIM_REGEXP, "" );
		}
		
		/**
		 * Strip whitespace from the ending of a String
		 * @param	haystack
		 * @return
		 */
		static public function rtrim( haystack : String ) : String {
			return haystack.replace( RTRIM_REGEXP, "" );
		}
		
		/**
		 * Strip whitespace from the beginning and ending of a String
		 * @param	haystack
		 * @return
		 */
		static public function trim( haystack : String ) : String{
			return haystack.replace( TRIM_REGEXP, "" );
		}
		
		/**
		 * groups the digits of <code>value</code> by placing ',' every 3 digits
		 * TODO: add static variable for locale group symbols
		 * @param	value
		 * @return
		 */
		static public function groupDigits( value : Number ) : String {
			var sentence : String = value.toString();
			var end : int = sentence.lastIndexOf( "." );
			var output : String = "";
			var tail : String = '';
			
			if ( end < 0 ) end = sentence.length;
			else tail = sentence.slice( end, sentence.length );
			
			for ( var i : int = end ; i > 2 ; i -= 3 ) {
				output = "," + sentence.substr( i - 3, 3 ) + output;
			}
			var head : String = sentence.substr( 0, i );
			
			if( head.length > 0 ) output = head + output;
			else output = output.substr( 1, output.length - 1 );
			
			return output + tail;
		}
		
		/**
		 * Cuts the <code>subject</code> string after the last full word within <code>maxChars</code> characters
		 * @usage <code>
		 * var text : String = "some sentence with a few words.";
		 * trace( StringUtil.substrNeat( text, 6 ) ) //output: "some..."
		 * trace( StringUtil.substrNeat( text, 10 ) ) //output: "some..."
		 * trace( StringUtil.substrNeat( text, 15 ) ) // output: "some sentence..."
		 * trace( StringUtil.substrNeat( text, 15, "" ) ) // output: "some sentence"
		 * </code>
		 * @param	subject
		 * @param	maxChars
		 * @param	trail
		 * @return
		 */
		static public function substrNeat( subject : String, maxChars : uint, trail : String = "..." ) : String{
			if( subject.length > maxChars ) {
				var pattern : RegExp = new RegExp( "\\b.(\\w*).\\b",'gi' );
				var words : Array = subject.match( pattern ); 
				var i : int;
				var n : int = words.length;
				var length : int = 0;
				for( i = 0 ; i < n ; i++ ) {
					var word : String = words[ i ];
					length += word.length;
					if ( length > maxChars ) break;
				}
				var output : String = rtrim( words.slice( 0, i ).join( '' ) ) + trail;
				
				//var pattern : RegExp = new RegExp( "(.{" + maxChars + "}.*?)\\b", "" );
				//var matches : Array = subject.match( pattern );
				return output;
			} else {
		       return subject;
			}			
		}
		
		static public function replaceString( haystack : String, needle : String, replace : String, caseSensitive : Boolean = true ) : String {
			
			var pattern : RegExp;
			if( caseSensitive ) pattern = new RegExp( needle, "g" );
			else pattern = new RegExp( needle, "gi" );
			return haystack.replace( pattern, replace );
			
			/*
			while ( haystack.indexOf( needle ) >= 0 ) {
				haystack = haystack.replace( needle, replace );
			}
			return haystack;
			*/
		}
		
		static public function toHex( str : String ) : int {
			return int( "0x" + str );
		}
		
		static public function randomChar() : String {
			var rnd : int = Math.floor( Math.random() * CHARS.length );
			return CHARS[ rnd ];
		}
		
		static public function randomWord( capitalize : Boolean = false ) : String {
			var word : String = '';
			var n : int = 2 + Math.floor( Math.random() * 10 );
			var i : int;
			for ( i = 0 ; i < n ; i++ ) 
			{
				var char : String = randomChar();
				if ( capitalize && i == 0 ) char = char.toUpperCase();
				word += char;
			}
			return word;
		}
		
		static public function randomString( length : int = -1 ) : String {
			if ( length < 0 ) length = Math.floor( Math.random() * 256 );
			var n : int = length;
			var i : int;
			var output : String = '';
			for ( i = 0 ; i < n ; i++ ) 
			{
				output += randomChar();
			}
			return output;
		}
		
		static public function randomSentence( nrOfWords : int = -1 ) : String {
			if ( nrOfWords < 0 ) nrOfWords = 3 + Math.round( Math.random() * 10 );
			var output : String = randomWord( true );
			var n : int = nrOfWords - 1;
			var i : int;
			for ( i = 0 ; i < n ; i++ ) 
			{
				output += " " + randomWord();
			}
			return output;
		}
		
		static public function randomText( nrOfSentences : int = -1 ) : String {
			if ( nrOfSentences < 0 ) nrOfSentences = 2 + Math.round( Math.random() * 15 );
			var output : String = randomSentence();
			var i : int;
			var n : int = nrOfSentences - 1;
			for( i = 0 ; i < n ; i++ ) {
				output += ''  + randomSentence()
			}
			return output;
		}
		
		static public function splice( subject : String, startIndex : uint, deleteCount : uint, value : String = '' ) : String {
			var head : String = subject.substring( 0, startIndex );
			var tail : String = subject.substring( startIndex + deleteCount, subject.length );
			return head + value + tail;
		}
		
		static public function randomEmail() : String {
			return StringUtil.randomWord( false ) + '@' + StringUtil.randomWord( false ) + '.' + StringUtil.randomString( 2 )
		}
		
		static public function isNotEmpty( text : String ) : Boolean {
			
			return 	( text != null ) && ( trim( text ) != '' );
					
		}
		
	}
}