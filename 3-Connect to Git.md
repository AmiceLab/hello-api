# Deploy the Code and CI/CD

In Summary, what we are doing:

1. Local setup: Node, npm, nodemon, Express, hello-api endpoint.
2. Test locally: node app.js → Postman → see JSON.
3. GitHub repo: init, add, commit, push.
4. Azure App Service: create Windows plan, set Free F1 tier.
5. CI/CD setup: Deployment Center → GitHub Actions → automatic deploy.
6. Budget management: set alerts, stop app when idle.

---

## Step 1 – Upload Project to GitHub

For both environments, the flow is similar:

Create GitHub repo for hello-api

Push your local Node.js API (hello-api) to GitHub

```bash
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/AmiceLab/hello-api.git
git push -u origin main
```

---

## Step 2 - setup Azure App Service

(DashBoard)
[Login to Main Page of Azure](https://portal.azure.com/#home)

Setup the Window App Service with following steps/configuration:

- Select `App Service`
- Create `Web App`
- Select the `Subscription` & `Resource Group` (Setup if not yet)
- Instance Details: `helloapi-test`
- Publish: `code`
- Runtime stack: `Node 22 LTS`
- Operation System: `Windows`
- Region: `Canada East`
- Windows Plan (Canada East): `(New) ASP-helloapitestgroup-9xxx`
- Price plan: `Free F1 60 CPU Minutes/day included`

Click: `Review + Create`

Review it, then Click: `Create`

---

## Step 3 - Set the Budget ALERT

**email alert only, you have to stop MANUALLY**

- from DashBoard -> Select `Subscription` name you set
- Left-hand side: -> `Cost Management`-> `Budgets`
  (OR Navigate to `Cost Management + Billing`)

- set $5/mth | set alert threadhold | set 2 emails

_Again, email alert only, you have to stop MANUALLY in Azure after receiving alert._

---

## Step 4 - Create CI/CD workflow:

### 4.1 - Setup Git Deployment in Azure

---

https://portal.azure.com/#home

- from DashBoard -> our App Service `helloapi-test`
- Left-hand side: -> `Deployment` -> `Deployment Center`
- Select `Source` -> `GitHub`
- Click `Authorize` -> a pop-up brovser to Select Your GitHub
- Will route back to Azure page to continue:
- `Organization` → your GitHub account
- `Repository` → hello-api
- `Branch` → main
- `Workflow option` -> Add a workflow: Add a new workflow file main_helloapi-test.yml in the selected repository and branch.

- `Authentication Type` -> User-assigned identity

* SAVE on top
  -> a `main_helloapi-test.yml` will be added to the Remote Repo

CI/CD should established. But may be error.

---

### 4.2 - Fix Issue in Yml

---

_Steps:_

1. Go to the Git Repo.
2. found out `main_helloapi-test.yml`
3. comment out `npm run test`

`Actions` would run again

Go the `Actions` on top -> should see `Workflow Success`

---

### 4.3 - Git Pull new file from Origin

---

Once finishes, in local terminal
`git push origin main`  
to download the YML as well.

Once it finishes, visit your App Service: (or Postman)

https://helloapi-test.azurewebsites.net/api/hello
