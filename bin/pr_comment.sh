#!/bin/bash

PR_NUMBER=$1

gh pr comment $PR_NUMBER \
  --body "Gitleaks scan completed"

env