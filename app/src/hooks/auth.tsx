import { AxiosError } from "axios";
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
} from "react";
import { toast } from "react-toastify";

import api from "../services/api";
import handleMessageError from "../utils/handleMessageError";

interface ISignCredentials {
  email: string;
  password: string;
}

interface IAuthContextData {
  isSigned: boolean;
  signIn(credentials: ISignCredentials): Promise<void>;
  signOut(): void;
}

const AuthContext = createContext<IAuthContextData>({} as IAuthContextData);

export default function AuthProvider({ children }: any) {
  const [isSigned, setIsSigned] = useState(() => {
    const token = localStorage.getItem("@my-table-control:token");
    api.defaults.headers.common.authorization = `Bearer ${token}`;

    api.interceptors.response.use(
      (response) => {
        return response;
      },
      (error: AxiosError) => {
        if (
          error.response?.status === 401 &&
          !error.request.responseURL.includes("sessions")
        ) {
          toast.info("Você precisa realizar login novamente!", {
            toastId: "INFO TO SIGN IN IN APP",
          });
          signOut();
        }

        return Promise.reject(error);
      },
    );

    if (token) {
      return true;
    }

    return false;
  });

  useEffect(() => {}, []);

  const signIn = useCallback(async ({ email, password }: ISignCredentials) => {
    const toastId = toast.info("Fazendo login...", { autoClose: false });

    try {
      const response = await api.post("/sessions", {
        email,
        password,
      });

      const { token } = response.data;

      api.defaults.headers.common.authorization = `Bearer ${token}`;

      localStorage.setItem("@my-table-control:token", token);
      setIsSigned(true);

      toast.dismiss(toastId);
    } catch (error) {
      toast.update(toastId, {
        render: `Falha ao fazer login. Favor, verifique suas credenciais. ${handleMessageError(
          error,
        )}`,
        type: "error",
        autoClose: 5000,
      });
    }
  }, []);

  const signOut = useCallback(() => {
    localStorage.removeItem("@my-table-control:token");
    setIsSigned(false);
  }, []);

  return (
    <AuthContext.Provider value={{ isSigned, signIn, signOut }}>
      {children}
    </AuthContext.Provider>
  );
}

function useAuth(): IAuthContextData {
  const context = useContext(AuthContext);

  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }

  return context;
}

export { AuthProvider, useAuth };
