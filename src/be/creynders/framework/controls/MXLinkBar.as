package be.creynders.framework.controls
{
     import mx.controls.Button;  
     import mx.controls.LinkBar;  
     import flash.events.MouseEvent;  
 
     public class MXLinkBar extends LinkBar  
     {  
         public function MXLinkBar()  
         {  
             super();  
         }  
    
         override protected function clickHandler(event:MouseEvent):void  
         {  
			  super.clickHandler(event);  
			  var btn:Button = Button(event.target);  
			  var childBtns:Array = this.getChildren();  
			  for each(var child:Button in childBtns)  
			  {  
			   child.enabled = true;  
			  }  
			  btn.enabled = false;  
         }  
     }  
}