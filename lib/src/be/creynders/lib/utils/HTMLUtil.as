package be.creynders.lib.utils
{
	public class HTMLUtil
	{
		static public function calculateHTMLPosition( htmlstr:String, pos:int ):int
		{
		    // we return -1 (not found) if the position is bad
		    if (pos <= -1)
		        return -1;
		 
		    // characters that appears when a tag starts
		    var openTags:Array = ["<","&"];
		    // characters that appears when a tag ends
		    var closeTags:Array = [">",";"];
		    // the tag should be replaced with
		    // ex: &amp; is & and has 1 as length but normal 
		    // tags have 0 length
		    var tagReplaceLength:Array = [0,1];
		    // flag to know when we are inside a tag
		    var isInsideTag:Boolean = false;
		    var cnt:int = 0;
		    // the id of the tag opening found
		    var tagId:int = -1;
		    var tagContent:String = "";
		 
		    for (var i:int = 0; i < htmlstr.length; i++)
		    {
		        // if the counter passes the position specified
		        // means that we reach the text position
		        if (cnt>=pos) 
		            break;
		        // current char	
		        var currentChar:String = htmlstr.charAt(i);
		        // checking if the current char is in the open tag array
		        for (var j:int = 0; j < openTags.length; j++)
		        {
		            if (currentChar == openTags[j])
		            {
		                // set flag
		                isInsideTag = true;
		                // store the tag open id
		                tagId = j;
		            }
		        }
		        if (!isInsideTag)
		        {
		            // increment the counter
		            cnt++;
		        } else {
		            // store the tag content
		            // needed afterwards to find new lines
		            tagContent += currentChar;
		        }
		        if (currentChar == closeTags[tagId]) {
		            // we ad the replace length 
		            if (tagId > -1) cnt += tagReplaceLength[tagId];
		            // if we encounter the </P> tag we increment the counter
		            // because of new line character
		            if (tagContent == "</P>") cnt++;
		            // set flag 
		            isInsideTag = false;
		            // reset tag content
		            tagContent = "";
		        }
		    }
		    // return de position in html text
		    return i;
		}
		
		static public function cleanHTML(str:String):String
		{
		    var pattern:RegExp = /<TEXTFORMAT.*?>/g;
		    var str:String = str.replace(pattern, "");
		    pattern = /<FONT.*?>/g;
		    str = str.replace(pattern, "");
		    pattern = /<\/FONT.*?>/g;
		    str = str.replace(pattern, "");
		    pattern = /<\/TEXTFORMAT.*?>/g;
		    str = str.replace(pattern, "");
		    return str;
		}

	}
}