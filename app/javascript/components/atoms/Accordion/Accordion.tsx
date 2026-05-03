import classNames from "classnames";
import React, { ReactNode, useState } from "react";
import { Button } from "../Button";

interface AccordionProps {
  title: string;
  icon?: string;
  startOpen?: boolean;
  children: ReactNode;
}

const Accordion = ({
  title,
  icon,
  startOpen = false,
  children,
}: AccordionProps) => {
  const [open, setOpen] = useState(startOpen);

  const handleToggle = () => {
    setOpen(!open);
  };

  return (
    <div className="aic-accordion">
      <div className="title">
        <div className="content">
          {icon && <i>{icon}</i>}
          {title}
        </div>
        <Button
          icon={open ? "chevron-up" : "chevron-down"}
          variant="primary"
          onClick={handleToggle}
        />
      </div>
      <div className={classNames("body", { hidden: !open })}>
        <div className="body-inner">{children}</div>
      </div>
    </div>
  );
};

export default Accordion;
