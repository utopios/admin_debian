const express = require('express');
const path = require('path');

const app = express();
const port = 80;

// Dossier contenant les fichiers à servir
const preseedFolder = path.join(__dirname, '/');

// Servir des fichiers statiques (comme preseed.cfg)
app.use(express.static(preseedFolder));

app.get('/', (req, res) => {
  res.send('Serveur de fichiers preseed.');
});

app.listen(port, () => {
  console.log("Serveur Express actif sur http://localhost");
});
