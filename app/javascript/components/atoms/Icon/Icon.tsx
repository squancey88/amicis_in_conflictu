import React from "react";

interface IconProps {
  name: string;
}

const Icon = ({ name }: IconProps) => {
  return <i className={`bi bi-${name}`} />;
};

export default Icon;
