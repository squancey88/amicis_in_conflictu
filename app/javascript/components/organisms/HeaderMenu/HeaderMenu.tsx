import React, { useState } from "react";
import { Button } from "Atoms/Button";
import { DropdownMenu } from "Atoms/DropdownMenu";
import { DropDownMenuItem } from "Atoms/DropdownMenu/DropdownMenu";
import useBreakpoint from "Hooks/useBreakpoint";
import classNames from "classnames";

interface HeaderItem {
  label: string;
  href?: string;
  items?: Array<DropDownMenuItem>;
}

interface HeaderMenuProps {
  logoPath: string;
  logoHref: string;
  userPath: string;
  items: Array<HeaderItem>;
}

const HeaderMenu = ({
  logoPath,
  logoHref,
  userPath,
  items,
}: HeaderMenuProps) => {
  const { isMobile } = useBreakpoint();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <nav
      className={classNames("aic-main-nav", {
        mobile: isMobile,
      })}
    >
      <div className="menu-head">
        <a className="icon" href={logoHref}>
          <img src={logoPath} alt="Amicis in conflictu logo" />
        </a>
        {isMobile && (
          <Button
            onClick={() => {
              setMobileMenuOpen((prev) => !prev);
            }}
            icon="list"
          />
        )}
      </div>
      {(!isMobile || mobileMenuOpen) && (
        <div className="menu-content">
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
          <div className="icons">
            <a href={userPath}>
              <i className="bi bi-person-circle"></i>
            </a>
            <a href={""}>
              <i className="bi bi-box-arrow-right"></i>
            </a>
          </div>
        </div>
      )}
    </nav>
  );
};

export default HeaderMenu;
