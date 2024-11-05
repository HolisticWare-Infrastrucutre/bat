#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
brew uninstall bash-completion
brew unlink bash-completion
brew install bash-completion@2

#----------------------------------------------------------------------------------------------
# Amazon Q
# https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/command-line-getting-started-installing.html
# https://fig.io/
# https://github.com/withfig/autocomplete

brew $ACTION_VERB \
        amazon-q

brew $ACTION_VERB \
    --cask \
        amazon-q

#----------------------------------------------------------------------------------------------
# ChatWithCloud
# https://chatwithcloud.ai/
# https://www.reddit.com/r/aws/comments/1dbrwae/i_made_amazon_q_for_terminal_but_a_bit_better/
brew tap chatwithcloud/tap \
&& \
brew $ACTION_VERB \
    chat-with-cloud