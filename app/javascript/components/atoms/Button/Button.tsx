import classNames from "classnames";
import React from "react";

interface ButtonProps {
  label?: string;
  icon?: string;
  type?: "submit" | "button";
  onClick?: () => void;
  variant?: "primary" | "secondary";
}

const Button = ({
  label,
  icon,
  type = "button",
  onClick,
  variant,
  ...props
}: ButtonProps) => {
  const classes = classNames("btn", {
    [`btn-${variant}`]: variant !== undefined,
  });

  return (
    <button onClick={onClick} className={classes} type={type} {...props}>
      {label}
      {icon && <i className={`bi bi-${icon} ms-1`} />}
    </button>
  );
};

export default Button;
