#!/usr/bin/bash
[[ "root" = "$(whoami)" ]] || exit
if [ -z "$(pgrep PublicPage)" ]
then
    (cd /home/frank/WebPage/PublicPage/PublicPage; nohup ./PublicPage &> /dev/null &)
    echo "PublicPage Server Started..."
else
    echo "PublicPage already running"
fi
