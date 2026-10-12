import express from "express";
import dotenv from "dotenv";
import mongoose from "mongoose";
import morgan from "morgan";
import cors from "cors";

import registerRoutes from "./src/routes/register.routes.js";
import authRoutes from "./src/routes/auth.routes.js";
import phcRoutes from "./src/routes/phc.routes.js";
import ashaRoutes from "./src/routes/asha.routes.js";
import adminRoutes from "./src/routes/admin.routes.js";

// Load environment variables
dotenv.config();

// Initialize app
const app = express();

// ✅ Enable CORS (for Flutter or web)
app.use(
  cors({
    origin: "*", // For dev; later replace with your frontend domain
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);

// ✅ Middlewares
app.use(express.json());
app.use(morgan("dev"));

// ✅ Basic route for testing
app.get("/", (req, res) => {
  res.json({ success: true, message: "API is running successfully 🚀" });
});

// ✅ Connect to MongoDB
const mongoUri = process.env.MONGO_URL || "mongodb://127.0.0.1:27017/sahayak";

mongoose
  .connect(mongoUri)
  .then(() => console.log("✅ MongoDB connected successfully"))
  .catch((err) => {
    console.error("❌ MongoDB connection error:", err.message);
    console.log("💡 Tip: If using MongoDB Atlas, check your network/DNS connection. You can also connect to a local instance at mongodb://127.0.0.1:27017/sahayak");
  });

// ✅ API Routes
app.use("/api/auth", authRoutes);
app.use("/api/register", registerRoutes);
app.use("/api/phc", phcRoutes);
app.use("/api/asha", ashaRoutes);
app.use("/api/admin", adminRoutes);

// ✅ Global Error Handler
app.use((err, req, res, next) => {
  console.error("🔥 Error:", err.stack);
  res.status(500).json({
    success: false,
    message: "Internal Server Error",
    error: err.message,
  });
});

// ✅ Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
