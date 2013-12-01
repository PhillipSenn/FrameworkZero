component {

function GrandUnification(form) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	WITH DB AS(
		SELECT TOP 100 *
		FROM LogDB
		ORDER BY LogDBDateTime DESC
	)
	,CF AS(
		SELECT TOP 100 *
		FROM LogCF
		ORDER BY LogCFDateTime DESC
	)
	,CFC AS(
		SELECT TOP 100 *
		FROM LogCFC
		ORDER BY LogCFCDateTime DESC
	)
	,DBErr AS(
		SELECT TOP 100 *
		,LogCF_UsrID AS LogDBErr_UsrID
		FROM LogDBErr
		JOIN LogCF
		ON LogDBErr_LogCFID = LogCFID
		ORDER BY LogDBErrDateTime DESC
	)
	,CFErr AS(
		SELECT TOP 100 *
		,LogCF_UsrID AS LogCFErr_UsrID
		FROM LogCFErr
		JOIN LogCF
		ON LogCFErr_LogCFID = LogCFID
		ORDER BY LogCFErrDateTime DESC
	)
	,UI AS(
		SELECT TOP 100 *
		FROM LogUI
		ORDER BY LogUIDateTime DESC
	)
	,JS AS(
		SELECT TOP 100 *
		FROM LogJS
		ORDER BY LogJSDateTime DESC
	)
	SELECT 'DB' AS Type
	,LogDBSort AS DBSort
	,0 AS JSSort
	,LogDBElapsed AS Elapsed
	,LogDBName AS LogName
	,LogDBFunctionName AS [Description]
	,LogDBDateTime AS LogDateTime
	,LogDB_UsrID as UsrID
	,LogDBRemoteAddr AS RemoteAddr
	FROM DB
	
	UNION ALL
	SELECT 'CF'
	,LogCFSort
	,0
	,LogCFElapsed
	,LogCFName
	,LogCFRemoteAddr
	,LogCFDateTime
	,LogCF_UsrID
	,LogCFRemoteAddr
	FROM CF
	
	UNION ALL
	SELECT 'CFC'
	,LogCFCSort
	,0
	,LogCFCElapsed
	,LogCFCName
	,LogCFCDesc
	,LogCFCDateTime
	,LogCFC_UsrID
	,LogCFCRemoteAddr
	FROM CFC
	
	UNION ALL
	SELECT 'DBErr'
	,LogDBErrSort
	,0
	,LogDBErrElapsed
	,LogDBErrName
	,LogDBErrFunctionName
	,LogDBErrDateTime
	,LogDBErr_UsrID
	,LogDBErrRemoteAddr
	FROM DBErr
	
	UNION ALL
	SELECT 'CFErr'
	,LogCFErrSort
	,0
	,LogCFErrElapsed
	,LogCFErrName
	,LogCFErrDetail
	,LogCFErrDateTime
	,LogCFErr_UsrID
	,LogCFErrRemoteAddr
	FROM CFErr
	
	UNION ALL
	SELECT 'UI'
	,0
	,LogUISort
	,LogUIElapsed
	,LogUIName
	,LogUIDestination
	,LogUIDateTime
	,LogUI_UsrID
	,LogUIRemoteAddr
	FROM UI
	
	UNION ALL
	SELECT 'JS'
	,0
	,LogJSSort
	,LogJSElapsed
	,LogJSName
	,LogJSDesc
	,LogJSDateTime
	,LogJS_UsrID
	,LogJSRemoteAddr
	FROM JS
	ORDER BY LogDateTime DESC
	";
	local.fw0.LogDB = false;
	include "/Inc/execute.cfm";
	return local.result;
}
}
