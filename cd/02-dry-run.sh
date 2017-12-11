#!/bin/bash

#we assume the code is in . dir

echo Starting dry run - `date`
ansible-playbook -C -i cd/hosts -c local jenkins-setup.yaml
CODE=$?
echo Finishing dry run - `date`

exit $CODE
