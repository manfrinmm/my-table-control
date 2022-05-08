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

export default function Route({ isPrivate, ...rest }: IRouteProps) {
  const { isSigned } = useAuth();

  if (isSigned && !isPrivate) {
    return <Redirect to="/presences" />;
  }

  if (!isSigned && isPrivate) {
    return <Redirect to="/" />;
  }

  return (
    <DefaultLayout>
      <ReactDOMRoute {...rest} />
    </DefaultLayout>
  );
}
