import { InputHTMLAttributes, useEffect, useRef } from "react";

import { useField } from "@unform/core";
import { overrideTailwindClasses } from "tailwind-override";

interface IInputProps extends InputHTMLAttributes<HTMLInputElement> {
  label: string;
  name: string;
  containerStyle?: any;
}

export default function Input({
  label,
  name,
  className,
  containerStyle,
  ...rest
}: IInputProps) {
  const inputRef = useRef<HTMLInputElement>(null);

  const { defaultValue, error, fieldName, registerField } = useField(name);

  useEffect(() => {
    registerField({ name: fieldName, ref: inputRef.current, path: "value" });
  }, [registerField, fieldName]);

  return (
    <div className={`rounded-md shadow-sm -space-y-px ${containerStyle}`}>
      <div>
        <label htmlFor={fieldName}>{label}</label>
        <input
          id={fieldName}
          name={fieldName}
          defaultValue={defaultValue}
          ref={inputRef}
          type="text"
          autoComplete="off"
          className={overrideTailwindClasses(`
            appearance-none relative
            block w-full
            p-2 mt-0.5
            border border-gray-300
            placeholder-gray-500 text-gray-900
            rounded-md
            focus:outline-none focus:ring-slate-500 focus:border-slate-500
            focus:z-10
            text-base
            ${className}
          `)}
          {...rest}
        />
      </div>

      {error && <span className="text-red-900 font-bold">{error}</span>}
    </div>
  );
}
