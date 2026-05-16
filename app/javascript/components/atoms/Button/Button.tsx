import React from "react";

interface ButtonProps {
  label?: string;
  icon?: string;
  type?: "submit" | "button";
  onClick?: () => void;
  variant: "primary" | "secondary";
}

const Button = ({
  label,
  icon,
  type = "button",
  onClick,
  variant,
}: ButtonProps) => {
  const classes = `btn btn-${variant}`;

  return (
    <button onClick={onClick} className={classes} type={type}>
      {label}
      {icon && <i className={`bi bi-${icon}`} />}
    </button>
  );
};

export default Button;
