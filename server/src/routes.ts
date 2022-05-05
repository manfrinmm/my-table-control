import { Router } from "express";
import { ensureAuthenticated } from "./middlewares/ensureAuthenticated";
import SessionsController from "./models/Users/Controllers/SessionsController";
import UsersController from "./models/Users/Controllers/UsersController";
import EventsController from "./models/Events/Controllers/EventsController";
import PresencesController from "./models/Events/Controllers/PresencesController";
import TablesController from "./models/Events/Controllers/TablesController";

const routes = Router();

const sessionsController = new SessionsController();
const usersController = new UsersController();
const eventsController = new EventsController();
const presencesController = new PresencesController();
const tablesController = new TablesController();

// Users
routes.post("/users", usersController.store);

routes.post("/sessions", sessionsController.store);

routes.use(ensureAuthenticated);

routes.get("/events", eventsController.index);
routes.post("/events", eventsController.store);

routes.get("/events/:event_id/tables", tablesController.index);
routes.post("/events/:event_id/tables/:table_id", tablesController.store);
routes.get("/events/:event_id/tables/:table_id", tablesController.show);

routes.get("/events/:event_id/presences", presencesController.index);
routes.put(
  "/events/:event_id/presences/:presence_id",
  presencesController.update,
);
routes.delete(
  "/events/:event_id/tables/:table_id/presences/:presence_id",
  presencesController.delete,
);

export default routes;
