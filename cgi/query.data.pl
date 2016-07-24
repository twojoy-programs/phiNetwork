my $error_wrongform = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<strong class="center">Wrong form submitted</strong>\n
</body></html>\n
END

my $error_wrongpw = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<strong class="center">Incorrect Password!</strong>\n
</body></html>\n
END

my $success = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Success!</title>\n
<link rel="stylesheet" type="text/css" href="common.css">\n
</head><body><h1 class="heading">Query Successful!</h1><br>\n
</body></html>\n
END

my $error_daemondead = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<strong class="center">phiNetd is either not running, or the lockfile is
somewhere that this program can't find. Please show this error to whoever is
responsible for fixing this problem.</strong>\n
</body></html>\n
END
