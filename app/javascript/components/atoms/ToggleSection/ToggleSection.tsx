import classNames from "classnames";
import React, { ReactNode, useState, useRef, useEffect } from "react";
import { Button } from "Atoms/Button";

interface ToggleSectionProps {
  title: string;
  icon?: ReactNode;
  startOpen?: boolean;
  children: ReactNode;
}

const ToggleSection = ({
  title,
  icon,
  startOpen = false,
  children,
}: ToggleSectionProps) => {
  const [open, setOpen] = useState(startOpen);
  const [closed, setClosed] = useState(!startOpen);
  const bodyRef = useRef<HTMLDivElement>(null);

  const [maxHeight, setMaxHeight] = useState<number | undefined>(
    startOpen ? undefined : 0,
  );

  const handleTransitionEnd = () => {
    if (!open) setClosed(true);
  };

  const handleToggle = () => {
    setClosed(false);
    setOpen((prev) => !prev);
  };

  useEffect(() => {
    if (open) {
      setMaxHeight(bodyRef.current?.scrollHeight);
    } else {
      setMaxHeight(0);
    }
  }, [open]);

  return (
    <div className={classNames("aic-toggle-section", { closed })}>
      <div className="title">
        <div className="content">
          {icon}
          {title}
        </div>
        <Button
          icon={open ? "chevron-up" : "chevron-down"}
          variant="primary"
          onClick={handleToggle}
        />
      </div>
      <div
        ref={bodyRef}
        className="body"
        onTransitionEnd={handleTransitionEnd}
        style={{
          maxHeight: open ? bodyRef.current?.scrollHeight : 0,
          overflow: "hidden",
          transition: "max-height 0.3s ease",
        }}
      >
        <div className="body-inner">{children}</div>
      </div>
    </div>
  );
};

export default ToggleSection;
