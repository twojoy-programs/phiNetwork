

$error_wrongform = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<div class="strong">Wrong form submitted</div>\n
</body></html>\n
END

$error_wrongpw = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<div class="strong">Incorrect Password!</div>\n
</body></html>\n
END

$success = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Success!</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Query Successful!</h1><br>\n
</body></html>\n
END

$error_daemondead = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<div class="strong">phiNetd is either not running, or the lockfile is
somewhere that this program can't find. Please show this error to whoever is
responsible for fixing this problem.</div>\n
</body></html>\n
END
