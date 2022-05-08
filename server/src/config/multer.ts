import multer from "multer";
import path from "path";

const tmpFolder = path.resolve(__dirname, "..", "..", "tmp");

export default {
  tmpFolder,
  multer: {
    storage: multer.diskStorage({
      destination: tmpFolder,
      filename(req, file, cb) {
        // const fileHash = crypto.randomBytes(10)

        return cb(null, file.originalname);
      },
    }),
  },
};
