import React from "react";

interface ButtonProps {
  label?: string;
  icon?: string;
  onClick: () => void;
  variant: "primary" | "secondary";
}

const Button = ({ label, icon, onClick, variant }: ButtonProps) => {
  const classes = `btn btn-${variant}`;

  return (
    <button onClick={onClick} className={classes} type="button">
      {label}
      {icon && <i className={`bi bi-${icon}`} />}
    </button>
  );
};

export default Button;
