import React, { ReactNode } from "react";

interface FieldWrapperProps {
  children: ReactNode;
  id: string;
  label: string;
}

const FieldWrapper = ({ id, label, children }: FieldWrapperProps) => {
  return (
    <div className="form-floating mb-3">
      {children}
      <label htmlFor={id}>{label}</label>
    </div>
  );
};

export default FieldWrapper;
