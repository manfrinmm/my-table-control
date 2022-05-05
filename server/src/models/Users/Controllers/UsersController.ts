import { Request, Response } from "express";
import CreateUserService from "../services/CreateUserService";

export default class UsersController {
  async store(req: Request, res: Response) {
    const { name, email, password, uid } = req.body;
    const createUserService = new CreateUserService();

    const user = await createUserService.execute({
      email,
      name,
      password,
      uid,
    });

    return res.status(201).json(user);
  }
}
