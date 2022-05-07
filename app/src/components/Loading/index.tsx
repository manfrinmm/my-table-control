import Lottie from "react-lottie";
import { overrideTailwindClasses } from "tailwind-override";

import loadingFile from "../../assets/loading.json";

export default function Loading({ className }: any) {
  return (
    <div
      className={overrideTailwindClasses(
        `text-center m-auto w-28 ${className}`,
      )}
    >
      <Lottie
        options={{
          autoplay: true,
          loop: true,
          animationData: loadingFile,
          rendererSettings: {
            preserveAspectRatio: "xMidYMid slice",
          },
        }}
        isClickToPauseDisabled
      />
      <p className="text-lg italic">Carregando...</p>
    </div>
  );
}
