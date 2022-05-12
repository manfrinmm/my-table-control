import "react-toastify/dist/ReactToastify.css";
import { useCallback } from "react";

import { Form } from "@unform/web";

import logo from "../assets/logo.svg";
import Input from "../components/form/Input";
import { useAuth } from "../hooks/auth";

export default function SignIn() {
  const { signIn } = useAuth();

  const handleSubmit = useCallback(
    (data: any) => {
      signIn(data);
    },
    [signIn],
  );

  return (
    <div className="min-h-full flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <img
            className="mx-auto h-12 w-auto"
            src={logo}
            // src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
            alt="Workflow"
          />
          <h2 className="mt-6 text-center text-2xl font-extrabold ">
            Entre com sua conta
          </h2>
        </div>
        <Form
          onSubmit={handleSubmit}
          className="mt-8 space-y-6"
          action="#"
          method="POST"
        >
          <div className="rounded-md space-y-3">
            <Input label="" name="email" placeholder="Login" required />

            <Input
              label=""
              name="password"
              type="password"
              placeholder="Senha"
            />
          </div>
          <div>
            <button
              type="submit"
              className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-amber-600 hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500"
            >
              <span className="absolute left-0 inset-y-0 flex items-center pl-3">
                {/* <LockClosedIcon
                    className="h-5 w-5 text-indigo-500 group-hover:text-indigo-400"
                    aria-hidden="true"
                  /> */}
              </span>
              Entrar
            </button>
          </div>
        </Form>
      </div>
    </div>
  );
}
