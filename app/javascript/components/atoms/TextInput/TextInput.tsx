import React, { useId } from "react";
import { FieldWrapper } from "Atoms/FieldWrapper";

interface TextInputProps {
  fieldName: string;
  label: string;
  value: string;
  disabled?: boolean;
  testId?: string;
  onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
}

const TextInput = ({ fieldName, label, value, disabled = false, onChange, testId }: TextInputProps) => {
  const id = useId();

  return (
    <FieldWrapper label={label} id={id}>
      <input
        className="form-control"
        type="text"
        id={id}
        name={fieldName}
        disabled={disabled}
        onChange={onChange}
        defaultValue={value}
        data-testid={testId}
      />
    </FieldWrapper>
  );
};

export default TextInput;
