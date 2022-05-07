// import React, { Component, Fragment } from "react";

// import Select from "react-select";
// import { colourOptions } from "../data";

// interface State {
//   readonly isClearable: boolean;
//   readonly isDisabled: boolean;
//   readonly isLoading: boolean;
//   readonly isRtl: boolean;
//   readonly isSearchable: boolean;
// }

// export default class ReactSelect2 extends Component<{}, State> {
//   state: State = {
//     isClearable: true,
//     isDisabled: false,
//     isLoading: false,
//     isRtl: false,
//     isSearchable: true,
//   };

//   toggleClearable = () =>
//     this.setState((state) => ({ isClearable: !state.isClearable }));
//   toggleDisabled = () =>
//     this.setState((state) => ({ isDisabled: !state.isDisabled }));
//   toggleLoading = () =>
//     this.setState((state) => ({ isLoading: !state.isLoading }));
//   toggleRtl = () => this.setState((state) => ({ isRtl: !state.isRtl }));
//   toggleSearchable = () =>
//     this.setState((state) => ({ isSearchable: !state.isSearchable }));

//   render() {
//     const { isClearable, isSearchable, isDisabled, isLoading, isRtl } =
//       this.state;

//     return (
//       <>
//         <Select
//           className="basic-single"
//           classNamePrefix="select"
//           defaultValue={colourOptions[0]}
//           // isDisabled={isDisabled}
//           // isLoading={isLoading}
//           // isClearable={isClearable}
//           // isRtl={isRtl}
//           // isSearchable={isSearchable}
//           name="color"
//           options={colourOptions}
//         />
//       </>
//     );
//   }
// }

import React, { SelectHTMLAttributes, useEffect, useRef } from "react";

import { useField } from "@unform/core";
import Select, { Props, OptionsOrGroups } from "react-select";

interface ISelectProps extends Props {
  name: string;
  label: string;
  options: Array<{ value: number | string; label: string }>;
  customMessageSelect?: string;
}

const ReactSelect: React.FC<ISelectProps> = ({
  label,
  name,
  customMessageSelect,
  className,
  ...rest
}) => {
  const selectRef = useRef(null);

  const { defaultValue, error, fieldName, registerField } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: selectRef.current,
      getValue: (ref) => {
        return ref.getValue()[0]?.value;
      },
      setValue: (ref, value) => {
        ref.setValue(value);
      },
    });
  }, [registerField, fieldName]);

  return (
    <div>
      <label htmlFor={fieldName}>{label}</label>
      <div>
        <Select
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
        />
        {/* <option hidden value="">
            {customMessageSelect || "Selecione o motivo"}
          </option>

          {optionValues.map((option) => (
            <option value={option.value} key={option.value}>
              {option.label}
            </option>
          ))} */}
      </div>

      {error && <span className="text-red-900 font-bold">{error}</span>}
    </div>
  );
};

export default ReactSelect;
