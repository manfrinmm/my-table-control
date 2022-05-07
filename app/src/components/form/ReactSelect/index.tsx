import { useEffect, useRef } from "react";
import Select, { Props } from "react-select";

import { useField } from "@unform/core";

interface ISelectProps extends Props {
  name: string;
  label: string;
  options: Array<{ value: number | string; label: string }>;
}

export default function ReactSelect({
  label,
  name,
  className,
  ...rest
}: ISelectProps) {
  const selectRef = useRef(null);

  const { defaultValue, error, fieldName, registerField } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: selectRef.current,
      getValue: ref => {
        return ref.getValue()[0]?.value;
      },
      setValue: (ref, value) => {
        ref.setValue(value);
      },
      clearValue: ref => {
        ref.setValue();
      },
    });
  }, [registerField, fieldName]);

  return (
    <div>
      <label htmlFor={fieldName}>{label}</label>
      <div className="text-xl">
        <Select
          id={fieldName}
          name={fieldName}
          ref={selectRef}
          defaultValue={defaultValue}
          className={`
            appearance-none relative
            block w-full
            mt-0.5
            border border-gray-300
            placeholder-gray-500 text-gray-900
            rounded-md
            focus:outline-none focus:ring-slate-500 focus:border-slate-500
            focus:z-10
            text-base
            ${className}
          `}
          {...rest}
        />
      </div>

      {error && <span className="text-red-900 font-bold">{error}</span>}
    </div>
  );
}
