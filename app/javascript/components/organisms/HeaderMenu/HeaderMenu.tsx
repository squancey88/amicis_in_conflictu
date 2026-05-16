import React from "react";
import { DropdownMenu } from "Atoms/DropdownMenu";
import { DropDownMenuItem } from "../../atoms/DropdownMenu/DropdownMenu";

interface HeaderItem {
  label: string;
  href?: string;
  items?: Array<DropDownMenuItem>;
}

interface HeaderMenuProps {
  items: Array<HeaderItem>;
}

const HeaderMenu = ({ items }: HeaderMenuProps) => {
  return (
    <div className="links">
      {items.map((item) => {
        if (item.items) {
          return (
            <DropdownMenu
              key={item.label}
              label={item.label}
              items={item.items}
            />
          );
        } else {
          return (
            <a key={item.label} href={item.href}>
              {item.label}
            </a>
          );
        }
      })}
    </div>
  );
};

export default HeaderMenu;
