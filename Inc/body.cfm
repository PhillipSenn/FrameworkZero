<cfoutput>
<cfinclude template="/Library/fw0/body.cfm">
<cfif IsDefined("request.Bootstrap.navbar")>
	<cfif request.Bootstrap.navbar NEQ "none">
		<div class="navbar navbar-inverse #request.Bootstrap.navbar#">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">PhillipSenn.com</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#Application.fw0.dir#">#Application.fw0.Name#</a></li>
						<li class="dropdown">
							<a href="JavaScript:;" class="dropdown-toggle" data-toggle="dropdown">Help 
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#Application.fw0.dir#About/About.cfm">About</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a id="navUsrName" href="JavaScript:;" class="dropdown-toggle" data-toggle="dropdown">
							<cfif IsDefined("session.Usr.qry.UsrName")>
							#session.Usr.qry.UsrName#
							</cfif>
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#Application.fw0.dir#Usr/Profile.cfm">Profile</a></li>
								<li><a href="#Application.fw0.dir#?logout">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</cfif>
<cfelse>
	<p>
		<a class="navbar-brand" href="#Application.fw0.dir#">#Application.fw0.Name#</a>
	</p>
</cfif>
</cfoutput>

<cfif IsDefined("request.Bootstrap.Container") AND request.Bootstrap.Container>
	<cfoutput>
	<div class="msg container">
		<span id="textStatus"></span>
		<span id="errorThrown"></span>
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section class="container" id="responseText">
<cfelse>
	<cfoutput>
	<div class="msg"> <!--- height --->
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section id="responseText">
</cfif>

