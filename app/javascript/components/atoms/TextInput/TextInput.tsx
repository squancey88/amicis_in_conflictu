import React, { useId } from "react";

interface TextInputProps {
  fieldName: string;
  label: string;
  value: string;
}

const TextInput = ({ fieldName, label, value }: TextInputProps) => {
  const id = useId();

  return (
    <div className="form-floating">
      <input
        className="form-control"
        type="text"
        id={id}
        name={fieldName}
        defaultValue={value}
      />
      <label htmlFor={id}>{label}</label>
    </div>
  );
};

export default TextInput;
