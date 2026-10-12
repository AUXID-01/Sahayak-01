import asyncHandler from "../utils/asyncHandler.js";
import User from "../models/user.model.js";
import AshaWorker from "../models/asha.model.js";
import { parseSafeDate } from "../utils/dateHelper.js";

// Step 2: ASHA role-specific registration
export const registerAshaDetails = asyncHandler(async (req, res) => {
  const {
    user_id,
    date_of_birth,
    gender,
    associated_phc,
    photo_url,
    address,
    training_completed,
    certifications,
    bank_details
  } = req.body;

  if (!user_id || !date_of_birth || !gender || !associated_phc) {
    return res.status(400).json({ success: false, message: "Required fields missing" });
  }

  const user = await User.findOne({ user_id });
  if (!user) return res.status(404).json({ success: false, message: "Base user not found" });

  const existingAsha = await AshaWorker.findOne({ user_id });
  if (existingAsha) return res.status(400).json({ success: false, message: "ASHA details already submitted" });

  const parsedDob = parseSafeDate(date_of_birth) || new Date();

  const asha = await AshaWorker.create({
    user_id,
    date_of_birth: parsedDob,
    gender,
    associated_phc,
    photo_url,
    address: address || {},
    training_completed: training_completed || [],
    certifications: certifications || [],
    bank_details: bank_details || {},
    verification_status: "Pending",
    createdAt: new Date(),
    updatedAt: new Date()
  });

  res.status(201).json({
    success: true,
    message: "ASHA worker details registered successfully",
    asha
  });
});



// Get ASHA profile (protected)
export const getAshaProfile = asyncHandler(async (req, res) => {
  const asha = await AshaWorker.findOne({ user_id: req.user.id }).populate(
    "user_id",
    "-password_hash"
  );
  if (!asha) return res.status(404).json({ message: "ASHA worker not found" });
  res.json(asha);
});