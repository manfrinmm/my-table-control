import React, { SelectHTMLAttributes, useEffect, useRef } from "react";

import { useField } from "@unform/core";

interface ISelectProps extends SelectHTMLAttributes<HTMLSelectElement> {
  name: string;
  label: string;
  optionValues: Array<{ value: number | string; label: string }>;
  customMessageSelect?: string;
}

const Select: React.FC<ISelectProps> = ({
  label,
  name,
  optionValues,
  customMessageSelect,
  className,
  ...rest
}) => {
  const selectRef = useRef(null);

  const { defaultValue, error, fieldName, registerField } = useField(name);

  console.log({ optionValues });

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: selectRef.current,
      path: "value",
    });
  }, [registerField, fieldName]);

  return (
    <div>
      <label htmlFor={fieldName}>{label}</label>
      <div>
        <select
          id={fieldName}
          name={fieldName}
          ref={selectRef}
          defaultValue={defaultValue}
          className={`
            appearance-none relative
            block w-full
            p-2 pr-8 mt-0.5
            border border-gray-300
            placeholder-gray-500 text-gray-900
            rounded-md
            focus:outline-none focus:ring-slate-500 focus:border-slate-500
            focus:z-10 sm:text-sm
            ${className}
          `}
          {...rest}
        >
          <option hidden value="">
            {customMessageSelect || "Selecione o motivo"}
          </option>

          {optionValues.map((option) => (
            <option value={option.value} key={option.value}>
              {option.label}
            </option>
          ))}
        </select>
      </div>

      {error && <span className="text-red-900 font-bold">{error}</span>}
    </div>
  );
};

export default Select;
