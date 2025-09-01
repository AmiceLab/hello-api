# Hello API – Setup Guide

This is a simple starter API using **Node.js + Express**.  
Follow these steps to set up the project on your machine.

---

## Step 0 – Open the folder

(terminal)

`cd hello-api`

---

## Step 1 – Ensure the environment

`node -v`
`npm -v`

if not there, install with:

**Option A** – Using Node.js installer

Go to [Node.js official website](https://nodejs.org/en)
Download the LTS (Long-Term Support) version.
Run the installer and follow the steps.

**Option B** - Install with Brew

If you have Homebrew installed:

`brew install node`

---

## Step 2 – Initialize the project:

`npm init -y`

This creates `package.json` .
Add a start script in `package.json`:

```json
{
  "scripts": {
    "start": "node app.js"
  }
}
```

- Add a comma at the end of previous scripts if needed.

---

## Step 3 – Nodemon

It is a development tool that automatically restarts your Node.js app when code changes.

check:

`nodemon -v`

if not there, to install:

`npm install -g nodemon`

changes in `package.json`

```json
{
  "scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js"
  }
}
```

Create a empty file: `app.js`

Run with:
`npm run dev`

- control-C to stop.

---

## Step 4 – Install express.js

Check if installed:
`npm list express`

If not there/no version number showing, install with:
`npm install express --save`
This also save the version info into `package.json`

```json
{
  "dependencies": {
    "express": "^4.19.2"
  }
}
```

---

## Step 5 – Create app.js

Create a file `app.js`

```js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/api/hello', (req, res) => {
  res.json({ message: 'Hello from Node.js API!' });
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
```

Double-check the installation:

`npm list express`

---

## Step 6 - Run Locally

`npm run dev` or
`node app.js`

Visit:
👉 http://localhost:3000/api/hello

Seeing:

{
"message": "Hello from Node.js API!"
}
