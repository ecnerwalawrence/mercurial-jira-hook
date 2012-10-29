#!/bin/bash


#
# Helper function that I found in the internet
#
is_installed() {
  PROGRAM=$1
  PATHNAME=$( type $PROGRAM 2> /dev/null )
  if [ -z "$PATHNAME" ]; then
    echo "cannot locate $PROGRAM in path"
    exit 1
  fi
}

# 
# Checks whether jira cli is installed.
# 
is_installed jira.sh

#
# 'jira-setting' file must exists in $HOME/.hg
#    look at README
#
source $HOME/.hg/jira-settings
SUBJECT="$HG_NODE"
COMMENTS=`hg log -r $HG_NODE`
JIRA_ISSUE=`hg log -r $HG_NODE | grep -i 'summary: ' | awk -F ' ' '{ c=1; while(c < 5) { if(match($c,"BUG:")){print $c;} c++;}}' | awk -F ':' '{print $2}' `
if [ -z "$JIRA_ISSUE" ]; then
    echo "WARNING:No bug in comment '$JIRA_ISSUE'"
    exit
else
    echo "INFO:JIRA_ISSUE='$JIRA_ISSUE'"
fi
echo $COMMENTS | jira.sh --server $JIRA_HOST --action addComment --issue $JIRA_ISSUE --user $JIRA_USERNAME --password $JIRA_PASSWORD -v -f -

exit
