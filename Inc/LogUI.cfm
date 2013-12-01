<cfscript>
new LogUI().Save(
	 LogUIName='LogUIName'
	,LogUITag='Tag'
	,LogUITagName='TagName'
	,LogUIIdentifier='Identifier'
	,LogUIClass='Class'
	,LogUIDestination='Destination'
	,LogUIValue='value'
	,LogJSSort=1
	,TickCount=#request.fw0.TickCount#
	,UsrID=1
	);

//form.LogUIName = 'LogUIName';
//form.LogUITag = 'Tag';
//form.LogUITagName = 'TagName';
//form.LogUIIdentifier = 'Identifier';
//form.LogUIClass = 'Class';
//form.LogUIDestination = 'Destination';
//form.LogUIValue = 'value';
//form.UsrID = 1;
// new LogUI().Save(form);
// http://www.raymondcamden.com/index.cfm/2010/11/1/Using-argumentCollection-with-AJAX-calls-to-ColdFusion-Components#c7ABD0E6B-FEAF-A94B-1E3928C9F9CC8925
// var mydata = {data:
//[1,2,3,4,5,"Camden,Raymond"]
//,goo:1
//,hoo:1
//};

// That would be 3 args to the CFC (data, goo, and hoo), with data being an array, goo and hoo being 1.

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>