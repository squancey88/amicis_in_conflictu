import { React, ReactNode } from "react";
import clsx from "clsx";

export interface SelectProps {
  label?: string;
  fieldName: string;
  onChange?: (event: React.ChangeEvent<HTMLSelectElement>) => void;
}

interface AllProps extends SelectProps {
  children: ReactNode;
}

const Select = ({ label, fieldName, onChange, children }: AllProps) => {
  const hasLabel = label !== undefined;

  const wrapperClass = hasLabel ? "form-floating" : "input-group";

  return (
    <div className={clsx("mb-3", wrapperClass)}>
      <select
        className="form-select"
        id={fieldName}
        name={fieldName}
        onChange={(e) => onChange?.(e)}
      >
        {children}
      </select>
      <label htmlFor={fieldName}>{label}</label>
    </div>
  );
};

export default Select;
