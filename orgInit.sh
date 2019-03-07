# sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --json --userprefix vf -o work.shop

sfdx force:package:install -r --package 04t6A000000SG0F -w 20

sfdx force:apex:execute -f scripts/dataWipe.cls
sfdx force:data:tree:import -p data/sample-data-plan.json

sfdx force:source:push
sfdx shane:user:password:set -l User -g User -p sfdx1234 --json
sfdx force:apex:execute -f scripts/init.cls

sfdx force:org:open
sfdx shane:data:file:upload -f assets/Visualforce_Report_2018-09-06_02-25_PM.pdf -n "VisualforceReport"
sfdx force:user:create -f config/userDef/cloudy-user-def.json
sfdx shane:user:photo -f assets/cloudy-profile.png -l Cloudy
sfdx force:user:create -f config/userDef/codey-user-def.json
sfdx shane:user:photo -f assets/codey-profile.png  -l CodeBear
sfdx force:user:create -f config/userDef/astro-user-def.json
sfdx shane:user:photo -f assets/astro-profile.png  -l Nomical
sfdx shane:data:file:upload -f assets/LightningExperienceReadinessReport_V5.4_08-29-2018_21-01-35.pdf