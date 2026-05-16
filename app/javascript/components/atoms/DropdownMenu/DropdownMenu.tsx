import React, { useEffect, useRef, useState } from "react";
import { Button } from "Atoms/Button";

export interface DropDownMenuItem {
  label: string;
  href: string;
}

interface DropdownMenuProps {
  label: string;
  items: Array<DropDownMenuItem>;
}

const DropdownMenu = ({ label, items }: DropdownMenuProps) => {
  const [isOpen, setIsOpen] = useState<boolean>(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleOutsideClick = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) {
        setIsOpen(false);
      }
    };

    document.addEventListener("click", handleOutsideClick);
    return () => document.removeEventListener("click", handleOutsideClick);
  }, []);

  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape") setIsOpen(false);
    };

    document.addEventListener("keydown", handleEscape);
    return () => document.removeEventListener("keydown", handleEscape);
  }, []);

  const options = items.map((item) => (
    <a key={item.label} href={item.href}>
      {item.label}
    </a>
  ));

  return (
    <div className="aic-dropdown-menu" ref={ref}>
      <Button
        aria-expanded={isOpen}
        aria-haspopup="true"
        label={label}
        icon="caret-down-fill"
        onClick={() => setIsOpen((prev: boolean) => !prev)}
      />
      {isOpen && (
        <div className="sub-menu" role="menu">
          {options}
        </div>
      )}
    </div>
  );
};

export default DropdownMenu;
