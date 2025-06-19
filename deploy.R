library(analogsea)
library(ssh)
Sys.setenv(DO_PAT="eae4166ed2fac0e3c41660fe26a009bb0176ab8bceeaf753faf5189f58a06520")

server <- analogsea::droplets()$`shiny-server`
droplet_ssh(server, "rm -r /srv/shiny-server/cciss-docs")
analogsea::droplet_ssh(server, "mkdir /srv/shiny-server/cciss-docs")
droplet_upload(server, "./_book/","/srv/shiny-server/cciss-docs")
droplet_ssh(server, "chown -R shiny:shiny /srv/shiny-server/cciss-docs")
