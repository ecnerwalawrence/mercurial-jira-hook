mercurial-jira-hook
===================

This Mercurial hook updates a Jira issue with your mercurial commits' comment.  It utilizes Jira CLI and is triggered by Mercurial commits. 

I wrote this hook so my mercurial commits would appear in a bug by putting my bug number into the comments.  The hook will log the bug into the Jira comment field, if comment has "BUG:#JIRA_ISSUE".

Dependencies
------------
jira cli 2.6.0 
 - https://marketplace.atlassian.com/plugins/org.swift.jira.cli#versions
 - jira.sh needs to be accessible to your path 

Installation
------------
1. If $HOME/.hgrc doesn't exist, you need to create this file.  You then need to add the following line your $HOME/.hgrc
<div>
  <div>
    <div>Trigger by commits.</div>
    <div>.hgrc:
      <code>
      [hooks]
      commit = ~/.hg/jira-commit.sh 
      </code>
    </div>
    <div>or</div>
  </div>
  <div>
    <div>Trigger by push/pull/unbundle</div>
    <div>.hgrc: 
      <code>
      [hooks]
      changegroup = ~/.hg/jira-commit.sh 
      </code>
    </div>
  </div>
</div>
Please read http://mercurial.selenic.com/wiki/Hook on how to configure this to fit your need.

2. Create a jira-setting file in $HOME/.hg/jira-setting
<div>jira-settings:
  <pre>
  # No space
  JIRA_HOST=(your mercurial host include port if necessary)
  JIRA_USERNAME=(your username)
  JIRA_PASSWORD=(your password)|`(keychain script to retrieve your password)`
  </pre>
</div>

TODO
----
Eventually, I will write a installation script that uses ruby brew or something to automate all these steps.