# Data file for query.cgi messages
#

# This might be able to be automated by a function that fills in values from a
# template, but i'm too lazy to do that.

# Error message if the form submitted is incorrectly validated
$error_wrongform = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<div class="strong">Wrong form submitted</div>\n
</body></html>\n
END

# Error message if the password is incorrect
$error_wrongpw = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Error</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Error:</h1><br>\n
<div class="strong">Incorrect Password!</div>\n
</body></html>\n
END

# Success message
$success = <<"END";
"Content-Type:text/html\n\n
<html><head><title>Query Success!</title>\n
<link rel="stylesheet" type="text/css" href="../libs/common.css">\n
</head><body><h1 class="heading">Query Successful!</h1><br>\n
</body></html>\n
END

# Error message if the daemon is dead.
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
