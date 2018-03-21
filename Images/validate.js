function validateText(x){
  	var ed=x.value;
 var pattern = /^([a-zA-Z0-9\_\. ]{4,25})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }

function validateNumber(x){
  	var ed=x.value;
 var pattern = /^([0-9]{1,7})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }
function validateWWW(){
			var frm = document.forms(0);
			var website=frm.value;
 		    var pattern = /^www\.[a-zA-Z0-9 \-\.]+\.([a-zA-Z]{2,4})$/;
			 if(!(pattern.test(website))) 
			 {
				alert("Please enter valid website address");
				return false;
			 } else
			 return true;
		}
function chekNum(x){
	var val=x.value;
	if(isNaN(val)==true){
		alert("Please Enter numbers only");
		x.value="";
//		x.focus();
		return false;
	}
	else
		return true;

}
// Format: Name@SiteName.domain
function validateEmailAddress() {
  elm = email;
  var pattern = /^[a-zA-Z0-9\- ]+\@[a-zA-Z0-9 \-\.]+\.([a-zA-Z]{2,4})$/;
  
  if(pattern.test(elm.value))
  {
   alert("ValidEmail");
  }
  else
   alert("notvalid");
 }
function validateEmail(x){
  	var ed=x.value;
 var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }
// Checking wether starting date is lessthan ending date or not
function validatePeriod(x,y){
  var sd=x.value;
  var yy=sd.substr(0,4);
  var mm=sd.substr(5,2);
  var dd=sd.substr(8,2);
  var sdobj = new Date(yy,mm,dd);

  var ed=y.value;
  var yy=ed.substr(0,4);
  var mm=ed.substr(5,2);
  var dd=ed.substr(8,2);
  var edobj = new Date(yy,mm,dd);

  if(sdobj<=edobj) 
    return true;
  else
    return false;
 }
 function DatesDifference(x,y){
  var sd=x.value;
  var yy=sd.substr(0,4);
  var mm=sd.substr(5,2);
  var dd=sd.substr(8,2);
  var sdobj = new Date(yy,mm,dd);

  var ed=y.value;
  var yy=ed.substr(0,4);
  var mm=ed.substr(5,2);
  var dd=ed.substr(8,2);
  var edobj = new Date(yy,mm,dd);
  var diff = (edobj - sdobj) / (60*60*24*1000); //days
  return diff;
  /*diff=new Date();
	diff.setTime(Math.abs(edobj.getTime() - sdobj.getTime()));

	timediff = diff.getTime();

	weeks = Math.floor(timediff / (1000 * 60 * 60 * 24 * 7));
	timediff -= weeks * (1000 * 60 * 60 * 24 * 7);

	days = Math.floor(timediff / (1000 * 60 * 60 * 24)); 
	timediff -= days * (1000 * 60 * 60 * 24);

	day=weeks*7;
	days=day+days;
    return days;*/
  
 }

//Validating date format (yyyy-mm-dd)
function validateDate(x,y,z){
  	var yyyy=x.value;
	var mm=y.value;
	var dd=z.value;
	var ed=yyyy+"-"+mm+"-"+dd;

 var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
 if(!pattern.test(ed)) 
  alert("Invalid Format");
  }

    /* this function shows the pop-up when
     user moves the mouse over the link */
    function ShowToolTip(DivID)
    {
        /* get the mouse left position */
        x = event.clientX + document.body.scrollLeft;
        /* get the mouse top position  */
        y = event.clientY + document.body.scrollTop + 15;
        /* display the pop-up */
        DivID.style.display="block";
        /* set the pop-up's left */
        DivID.style.left = x;
        /* set the pop-up's top */
        DivID.style.top = y;
		/* set the pop-up's height */
        DivID.style.height = 10;
        /* set the pop-up's width */
        //DivID.style.top = y;

    }
    /* this function hides the pop-up when
     user moves the mouse out of the link */
    function HideToolTip(DivID)
    {
        /* hide the pop-up */
        DivID.style.display="none";
    }
	function fnEmpPopUp(URL,h,w)
	{ 
		var strTitle ='Details';
		var strUrl = URL;
		var strOptions= 'menubar=no,toolbar=no,scrollbars=yes,status=yes,resizable=yes,height='+h+',width='+w+',left=300,top=0';
		window.open(strUrl,strTitle,strOptions).focus();
	}
	//Function to load checked values into a result field
	//Element --> CheckBox/RadioButton
	//Result --> Result
	function getValues(Element,Result){
		var Str="";
		var cb = Element;
		for(i=0;i<cb.length;i++){
			if(cb[i].checked==true){
				Str+=cb[i].value +",";
			}
		}
		Str = Str.substring(0,Str.length-1);
		Result.value=Str;
		return false;
	}
	// ajax function URL: target url
	//				 divobj: html obj to hold response from target url
	function ajaxFunction(URL,divobj){ 
		  var xmlHttp;
		  try
			{      xmlHttp=new XMLHttpRequest();    }
		  catch (e)
			{    
			try
			  {      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");      }
				catch (e)
				{		try
						{        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");        }
						catch (e){
							alert("Your browser does not support AJAX!");        
							return false;        
						}      
				}    
			  }
			  if (xmlHttp==null)
		  {
		  alert ("Your browser does not support AJAX!");
		  return;
		  } 

			xmlHttp.onreadystatechange=function()
			  {
			  if(xmlHttp.readyState==4)
				{
				//document.GenCodeForm.Code.value=xmlHttp.responseText;
				
				divobj.innerHTML=xmlHttp.responseText;
				//document.writeln(xmlHttp.responseText);
				}
			  else{
				//document.GenCodeForm.Code.value = "Error";
				divobj.innerHTML="Loading data....";
			  }
			  }
			  //alert(URL);
			xmlHttp.open("GET",URL,true);
			xmlHttp.send(null);  
		}