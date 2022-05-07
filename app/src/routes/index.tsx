import { Redirect, Switch, Router, BrowserRouter } from "react-router-dom";
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
      {/* <Route path="/register-password" component={RegisterPassword} />
      <Route path="/forgot-password" component={ForgotPassword} />

      <Route path="/profile" isPrivate component={Profile} />
      <Route exact path="/companies" isPrivate component={Companies} />
      <Route
        exact
        path="/companies/:company_id"
        isPrivate
        component={Company}
      />
      <Route
        exact
        path="/companies/:company_id/transactions"
        isPrivate
        component={CompanyFinancial}
      />

      <Route
        exact
        path="/companies/registers/:register_id"
        isPrivate
        component={CompanyRegister}
      />
      <Route
        exact
        path="/companies/registers/:register_id/updates"
        isPrivate
        component={CompanyUpdate}
      />

      <Route exact path="/customers" isPrivate component={Customers} />
      <Route
        exact
        path="/customers/:customer_id"
        isPrivate
        component={Customer}
      /> */}

      <Redirect to="/" />
    </Switch>
  );
}
