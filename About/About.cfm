<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>Framework Zero</h1>
I heard about various frameworks like Fusebox, Model Glue, Mach II, CFWheels, ColdBox, and yes Framework One.
I tried to understand them.  But even Framework One talks over my head. The guys on cfhour were
extolling the virtues of using a framework and to at least use framework 1.  So after getting lost
in the documentation yet again, I decided to put into canon the way that I currently write ColdFusion applications.
<p>Just as the ColdFusion language has evolved, from using Application.cfm to using Application.cfc
and from using &lt;cfquery> to service.execute, my style of writing ColdFusion applications has evolved as well. I would say in general, here are some guidelines that I use:</p>
<dl>
	<dt>Keep things as close as possible</dt>
	<dd>In other words, if you have an About.cfm page, then it could have an About.cfc, About.css and About.js
	in the same subfolder.
	</dd>
	<dt>Promote things that are common</dt>
	<dd>When writing code, there is the tendacy to say "this could be used everywhere". Resist
	that urge and write the code for the immediate task at hand.  Wait for another program to need
	the same functionality, and move the code into an area common to both programs (typically up the 
	directory structure).
	</dd>
	<dt>Functions that are common to <em>all</em> programs are in the com subfolder.
	<dd>This is done by mapping "com" to the application's subfolder first.
	<pre>this.CurrentTemplatePath = getCurrentTemplatePath();
this.CurrentTemplateDir  = GetDirectoryFromPath(this.CurrentTemplatePath);
this.mappings["/com"] = this.CurrentTemplateDir & "com";</pre>
	</dd>
	<dt>Things that are common to <em>all</em> applications are in /inetpub/wwwroot/Library.
	<dd>Every site has an IIS mapping to /Library.</dd>
	<dt>Put database calls into components</dt>
	<dd>If About.cfm needs to query the database in some unique way, then put that query into About.cfc</dd>
	<dt>Every database call uses:</dt>
	<dd>
		<ul>
			<li>/Inc/newQuery.cfm (Creates a new query service)</li>
			<li>/Inc/execute.cfm  (Does a service.execute)</li>
		</ul>
	</dd>
	<dt>Favor cfscript for logic</dt>
	<dd>For all components and at the top of every page, I use cfscript for my logic. Example:
	<blockquote>for (qry in Usr.qry) {}</blockquote></dd>
	<dt>Favor tag based syntax for presentation</dt>
	<dd>After the opening html tag, use tag based syntax.  Example:
	<blockquote>&lt;cfloop query="myQry"></blockquote>
	<dt>Favor a result structure over a result query</dt>
	<dd>Because service.execute returns both getPrefix() and getResult(), the result of a database call
	is a structure that has a .Prefix structure and a .qry query. Example:
	<pre>obj = service.execute();<br>
result.Prefix = obj.getPrefix();<br>
result.qry = obj.getResult();</pre>
	</dd>
	<dt>Favor new over cached components</dt>
	<dd>Instead of loading components into memory, instantiate them when needed. Example:
	<blockquote>Usr = new com.Usr().Where();</blockquote>
	This returns the Usr structure (Usr.Prefix and Usr.qry) after the database call has been logged
	and error trapped.
	</dd>
	<dt>Favor a structure as a parameter.</dt>
	<dd>Typically, the structure is the form, but it could be any structure (url, session, query, local&hellip;).  Example:
	<blockquote>
	Usr = new com.Usr().Read(form)</blockquote>
	</dd>
	<dt>If the argument is a structure, then use the word "form" as the argument name.</dt>
	<dd>Typically, the form is indeed what's being passed, but sometimes it's the url or a query. 
	In any case, always use the word form inside a function. Example:
	<blockquote>function WhereUsrID(form)</blockquote>
	To determine what arguments are used in the function, search for "form.". <br>
	Functions are usually brief, so I press Ctrl+Fform. and find what arguments are used.
	</dd>
	<dt>Read the code instead of trying to memorize it</dt>
	<dd>When answering a question about what a function does, don't try to go on memory.
	Instead, <em>look at the code</em> and say aloud what it does as you are reading it.
	</dd>
	<dt>Remote function can't use the form structure as an argument.</dt>
	<dd>As best I can tell, the best way to pass arguments via JavaScript is individually.</dd>
</dl>
<address>
Phillip Senn
</address>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>