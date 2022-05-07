import "react-toastify/dist/ReactToastify.css";

import { ToastContainer } from "react-toastify";

import AppProvider from "./hooks";
import Routes from "./routes";

export default function App() {
  return (
    <>
      <ToastContainer className="p-2" />
      <AppProvider>
        <Routes />
      </AppProvider>
    </>
  );
}
