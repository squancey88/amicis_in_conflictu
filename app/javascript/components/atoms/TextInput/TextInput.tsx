import React, { useId } from "react";
import { FieldWrapper } from "Atoms/FieldWrapper";

interface TextInputProps {
  fieldName: string;
  label: string;
  value: string;
}

const TextInput = ({ fieldName, label, value }: TextInputProps) => {
  const id = useId();

  return (
    <FieldWrapper label={label} id={id}>
      <input
        className="form-control"
        type="text"
        id={id}
        name={fieldName}
        defaultValue={value}
      />
    </FieldWrapper>
  );
};

export default TextInput;
