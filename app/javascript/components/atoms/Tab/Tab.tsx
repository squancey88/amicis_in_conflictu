import classNames from "classnames";
import { useTabsContext } from "Organisms/Tabs/Tabs";
import { ReactNode } from "react";

interface TabProps {
  id: string;
  children: ReactNode;
  active?: boolean;
}

const Tab = ({ id, children }: TabProps) => {
  const { active } = useTabsContext();
  const isActive = active === id;

  return (
    <div role="tabpanel" className={classNames("tab-panel", { "active-panel": isActive })} data-tab-panel={id}>
      {children}
    </div>
  );
};

export default Tab;
