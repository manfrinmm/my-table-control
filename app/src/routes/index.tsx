import { Redirect, Switch } from "react-router-dom";

import Dashboard from "../pages/Dashboard";
import Presences from "../pages/Presences";
import SignIn from "../pages/SignIn";
import Table from "../pages/Table";
import Route from "./Route";

export default function Routes() {
  return (
    <Switch>
      <Route exact path="/" component={SignIn} />

      <Route path="/dashboard" isPrivate component={Dashboard} />
      <Route path="/tables" isPrivate component={Table} />
      <Route path="/presences" isPrivate component={Presences} />

      <Redirect to="/" />
    </Switch>
  );
}
