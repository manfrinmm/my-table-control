import React from "react";
import {
  Redirect,
  Route as ReactDOMRoute,
  RouteProps as ReactDOMRouteProps,
} from "react-router-dom";

import { useAuth } from "../hooks/auth";
import DefaultLayout from "../styles/DefaultLayout";

interface IRouteProps extends ReactDOMRouteProps {
  isPrivate?: boolean;
}

const Route: React.FC<IRouteProps> = ({ isPrivate, ...rest }) => {
  const { isSigned } = useAuth();

  if (isSigned && !isPrivate) {
    return <Redirect to="/dashboard" />;
  }

  if (!isSigned && isPrivate) {
    return <Redirect to="/" />;
  }

  return (
    <DefaultLayout>
      <ReactDOMRoute {...rest} />
    </DefaultLayout>
  );
};

export default Route;
