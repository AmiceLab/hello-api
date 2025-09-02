const express = require('express');
const app = express();

// Use Azure-assigned port if available
const port = process.env.PORT || 3000;

app.get('/api/hello', (req, res) => {
  res.json({ message: 'Hello from Node.js API!' });
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
