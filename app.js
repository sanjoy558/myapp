const http = require("http");

const server = http.createServer((req, res) => {
  res.end("🚀 Hello from DevOps Sanjoy's Dockerized App!");
});

server.listen(3000, () => {
  console.log("Server running at http://localhost:3000");
});

