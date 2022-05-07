import { AuthProvider } from "./auth";

export default function AppProvider(props: any) {
  return <AuthProvider>{props.children}</AuthProvider>;
}
