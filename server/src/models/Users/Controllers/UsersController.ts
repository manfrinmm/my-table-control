import { Request, Response } from "express";
import CreateUserService from "../services/CreateUserService";

export default class UsersController {
  async store(req: Request, res: Response) {
    const { email, password } = req.body;
    const createUserService = new CreateUserService();

    const user = await createUserService.execute({
      email,
      password,
    });

    return res.status(201).json(user);
  }
}
