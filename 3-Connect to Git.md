# Deploy the Code and CI/CD

In Summary, what we are doing:

1. Local setup: Node, npm, nodemon, Express, hello-api endpoint.
2. Test locally: node app.js → Postman → see JSON.
3. GitHub repo: init, add, commit, push.
4. Azure App Service: create Windows plan, set Free F1 tier.
5. CI/CD setup: Deployment Center → GitHub Actions → automatic deploy.
6. Budget management: set alerts, stop app when idle.

## Step 1 – Upload to GitHub

For both environments, the flow is similar:

Create GitHub repo for hello-api

Push your local Node.js API (hello-api) to GitHub

git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/AmiceLab/hello-api.git
git push -u origin main

## Step 2 - setup Azure App Service (Option1)

[Login to Main Page](https://portal.azure.com/#home)

Select App Service
Create Web App
Select the Subscription & Resource Group (Setup if not yet)
Instance Details: helloapi-test
Publish: code
Runtime stack: Node 22 LTS
Operation System: Windows
Region: Canada East
Windows Plan (Canada East) : (New) ASP-helloapitestgroup-9xxx
Price plan: Free F1 60 CPU Minutes/day included

Click: Review + Create

Review and Click: Create

## Step 3 - Set the Budget ALERT (email alert only, you have to stop MANUALLY)

from Dash Board
Select "Subscription" name you set
Left-hand side Cost Management
-> Cost Management
-> Budgets

OR Navigate to Cost Management + Billing

set $5/mth
set alert threadhold
set 2 emails

- Again, email alert only, you have to stop MANUALLY in Azure after receiving alert.

## Step 4 - Create CI/CD workflow:

https://portal.azure.com/#home

our App Service -> helloapi-test
Go to the Web App (called helloapi-test) -> Deployment -> Deployment Center
Select `Source` --> `GitHub`
Click `Authorize`
Will forward to a po-up brovser to Select Your GitHub

Will route back to Azure page to continue:

- Organization → your GitHub account
- Repository → hello-api
- Branch → main

Workflow option: (Select) Add a workflow: Add a new workflow file main_helloapi-test.yml in the selected repository and branch.

Authentication Type:

- Serious project -> User-assigned identity
- Simple trial -> Basic authentication

Ind
.
.
.

Azure App Service → Use GitHub Actions with azure/webapps-deploy@v2

Windows VM → Use GitHub Actions to build and deploy via WinRM, SSH, or Remote PowerShell

Baby step example (Azure App Service):

name: Node.js CI/CD

on:
push:
branches: - main

jobs:
build-and-deploy:
runs-on: ubuntu-latest
steps: - uses: actions/checkout@v3 - name: Setup Node.js
uses: actions/setup-node@v3
with:
node-version: '22' # LTS version - run: npm install - run: npm run build # if you have build steps - name: Deploy to Azure Web App
uses: azure/webapps-deploy@v2
with:
app-name: YOUR_APP_NAME
slot-name: production
publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}

Step 3 – Record all baby steps

I suggest a markdown guide like your Hello API setup:

Step 0: Open folder & check Node.js/npm versions

Step 1: Initialize project, add scripts

Step 2: Install nodemon, express

Step 3: Create app.js and test locally

Step 4: GitHub repo creation & initial commit

Step 5: Create CI/CD workflow (Azure or Windows VM)

Step 6: Deploy & test endpoint (/api/hello)

Step 7: Verify logs, version, and troubleshoot

Each step can include commands, screenshots, and tips, so your team can follow without missing anything.

Step 4 – Practice first

I recommend practice deploying Node.js API to Azure App Service first, because:

Easier to configure

CI/CD integration is well documented

You can quickly verify your /api/hello endpoint

Once this works, replicate the workflow for Windows VM if needed.
