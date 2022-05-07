import { AuthProvider } from "./auth";

export default function AppProvider({ children }: any) {
  return <AuthProvider>{children}</AuthProvider>;
}
