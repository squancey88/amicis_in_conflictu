import React, { ReactNode } from "react";

interface FormSectionProps {
  children: ReactNode;
}

const FormSection = ({ children }: FormSectionProps) => {
  return (
    <div className="record-form-wrapper__box">
      <div className="card text-bg-light">
        <div className="record-form-wrapper__box-content card-body">
          {children}
        </div>
      </div>
    </div>
  );
};

export default FormSection;
