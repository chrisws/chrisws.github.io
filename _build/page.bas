unit page

export name
export url
export title
export lastedit
export link
export linkName
export help

pagename = translate(command,  "pages2", "")
pagename = translate(pagename, "pages3", "")
pagename = translate(pagename, "pages", "")
pagename = translate(pagename, "_out", "")
pagename = translate(pagename, "/", "")
pagename = translate(pagename, ".html", "")

item = ""
name = pagename
url = "/" + pagename + ".html"
title = pagename

if (pagename == "aircave") then
  name = "Air Cave"
  help = "Play outside"
  link = "https://play.google.com/store/apps/details?id=net.aircave"
  linkName = "Google play"
elseif (pagename == "stompbox") then
  name = "Stompbox"
  help = "Virtual stomp box/metronome"
  link = "https://play.google.com/store/apps/details?id=net.stomp"
  linkName = "Google play"
else
  help = "text"
endif  

sourcefile = "pages/" + pagename + ".markdown"
if (not exist(sourcefile)) then
  sourcefile = "scripts/" + pagename + ".html"
  if (not exist(sourcefile)) then
    sourcefile = "posts/" + pagename + ".markdown"
  endif
endif

lastedit = run("git log -1 --format=\"%cD\" -- " + sourcefile)
