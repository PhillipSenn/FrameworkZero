component {

function Send(form) {
	include "/Passwords/FrameworkZero.cfm";
	local.result = {};
	local.svc = new mail();
	local.svc.setSubject(Application.fw0.Name);
	local.svc.setBody('Email is working!  Yay!');
	local.svc.setServer(local.Server);
	local.svc.setType(local.Type);
	local.svc.setUseSSL(local.UseSSL);
	local.svc.setPort(local.Port);
	local.svc.setTo(form.UserName);
	local.svc.setFrom(local.UserName);
	local.svc.setUserName(local.UserName);
	local.svc.setPassword(local.Password);
	local.result.Class = "btn-success";
	local.result.Status = "Yes";
	/*
	try {
		local.svc.Send();
	} catch(any Exception) {
		local.result.Class = "btn-danger";
		local.result.Status = "NO";
	}
	*/
	return local.result;
}
}
