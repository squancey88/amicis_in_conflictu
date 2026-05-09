import React, { useId } from "react";
import { FieldWrapper } from "Atoms/FieldWrapper";

interface TextInputProps {
  fieldName: string;
  label: string;
  value: string;
  onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
}

const TextInput = ({ fieldName, label, value, onChange }: TextInputProps) => {
  const id = useId();

  return (
    <FieldWrapper label={label} id={id}>
      <input
        className="form-control"
        type="text"
        id={id}
        name={fieldName}
        onChange={onChange}
        defaultValue={value}
      />
    </FieldWrapper>
  );
};

export default TextInput;
