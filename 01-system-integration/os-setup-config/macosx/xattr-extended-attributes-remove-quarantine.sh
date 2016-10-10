#!/bin/bash


xattr -d com.apple.quarantine *.exe
xattr -d com.apple.quarantine ./
  
