mercurial-jira-hook
===================

This Mercurial hook updates a Jira bug with mercurial commits.  It utilizes Jira CLI and is triggered by Mercurial commits. 

I wrote this hook so my mercurial commits would appear in a bug by putting my bug number into the comments.

Dependencies
============
jira cli 2.6.0 
 - https://marketplace.atlassian.com/plugins/org.swift.jira.cli#versions
 - jira.sh needs to be accessible to your path 

Installation
============
1. If $HOME/.hgrc doesn't exist, you need to create this file.  You then need to add the following line your $HOME/.hgrc
<.hgrc>
[hooks]
commit = ~/.hg/jira-commit.sh 
</.hgrc>

2. Create a jira-setting file in $HOME/.hg/jira-setting
<jira-settings>
# No space
JIRA_HOST=(your mercurial host include port if necessary)
JIRA_USERNAME=(your username)
JIRA_PASSWORD=(your password)
</jira-settings>

TODO
====
Eventually, I will write a installation script that uses ruby brew or something to automate all these steps.