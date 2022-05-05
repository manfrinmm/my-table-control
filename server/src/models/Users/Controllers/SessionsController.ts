import { Request, Response } from "express";
import AuthenticateUserService from "../services/AuthenticateUserService";

export default class SessionsController {
  async store(req: Request, res: Response) {
    const { email, password } = req.body;

    const authenticateUserService = new AuthenticateUserService();
    const { token, user } = await authenticateUserService.execute({
      email,
      password,
    });

    return res.json({ token, user });
  }
}
