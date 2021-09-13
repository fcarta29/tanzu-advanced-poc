#!/bin/bash
# 
# Purpose:
#   Deploy the desireded test case to eduk8s workshop.
#   Ensure you provide the right path for the test case markdown file
#
#  Syntax: sh deploy.sh  <RELATIVE PATH TO TEST CASE MARKDOWN FILE>
#
#

cp -ur scenarios /opt/workshop/content/
rm /opt/workshop/content/labs/testcase.md
cp -u $1 /opt/workshop/content/labs/testcase.md