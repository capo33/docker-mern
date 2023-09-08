import express, { Application } from "express";

const app: Application = express();

app.listen(5000, () => console.log("Server running on port " + 5000));