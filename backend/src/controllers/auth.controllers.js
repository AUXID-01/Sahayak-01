import asyncHandler from "../utils/asyncHandler.js";
import User from "../models/user.model.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

export const login = asyncHandler(async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ success: false, message: "All fields are required" });
  }

  const user = await User.findOne({ email });
  if (!user) {
    return res.status(404).json({ success: false, message: "User not found" });
  }

  const isPasswordCorrect = await bcrypt.compare(password, user.password_hash);
  if (!isPasswordCorrect) {
    return res.status(401).json({ success: false, message: "Invalid password" });
  }

  const payload = { id: user.user_id, role: user.user_type };
  const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "1h" });

  return res.status(200).json({
    success: true,
    message: "Login successful",
    token,
    user: {
      id: user.user_id,
      user_id: user.user_id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      role: user.user_type,
      user_type: user.user_type,
    },
  });
});
