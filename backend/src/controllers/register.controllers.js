import asyncHandler from "../utils/asyncHandler.js";
import User from "../models/user.model.js";
import bcrypt from "bcryptjs";
import crypto from "crypto";

export const registerBaseUser = asyncHandler(async (req, res) => {
  const { first_name, last_name, email, password, phone_number, user_type } = req.body;

  if (!first_name || !last_name || !email || !password || !phone_number || !user_type){
    return res.status(400).json({ success: false, message: "Required fields missing" });
  }


  const validTypes = ["asha_worker", "phc_staff", "admin"];
  if (!validTypes.includes(user_type)) {
    return res.status(400).json({ success: false, message: "Invalid user type" });
  }

  const existingUser = await User.findOne({ email });
  if (existingUser) {
    return res.status(400).json({ success: false, message: "Email already exists" });
  }

  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);

  const user = await User.create({
    user_id: crypto.randomUUID(),
    first_name,
    last_name,
    email,
    password_hash: hashedPassword,
    phone_number,
    user_type,
    is_active: true,
    createdAt: new Date(),
    updatedAt: new Date(),
  });

  return res.status(201).json({
    success: true,
    message: "Base user registered successfully",
    user_id: user.user_id,
    user_type: user.user_type,
  });
});
