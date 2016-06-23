my $error_wrongform = "Content-Type:text/html\n"
                      "<html><head><title>Query Error</title>\n"
                      '<link rel="stylesheet" type="text/css" href="common.css">'."\n"
                      '</head><body><h1 class="heading">Error:</h1><br>'."\n"
                      '<strong class="center">Wrong form submitted</strong>'."\n"
                      "</body></html>\n";

my $error_wrongpw   = "Content-Type:text/html\n"
                      "<html><head><title>Query Error</title>\n"
                      '<link rel="stylesheet" type="text/css" href="common.css">'."\n"
                      '</head><body><h1 class="heading">Error:</h1><br>'."\n"
                      '<strong class="center">Password Incorrect</strong>'."\n"
                      "</body></html>\n";

my $success         = "Content-Type:text/html\n"
                      "<html><head><title>Query Error</title>\n"
                      '<link rel="stylesheet" type="text/css" href="common.css">'."\n"
                      '</head><body><h1 class="heading">Success!!!</h1><br>'."\n"
                      '<strong class="center"></strong>'."\n"
                      "</body></html>\n";

my $error_daemondead ="Content-Type:text/html\n"
                      "<html><head><title>Query Error</title>\n"
                      '<link rel="stylesheet" type="text/css" href="common.css">'."\n"
                      '</head><body><h1 class="heading">Error:</h1><br>'."\n"
                      '<strong class="center">The daemon doesnt seem to be up</strong>'."\n"
                      "</body></html>\n";
