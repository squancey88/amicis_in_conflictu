import { createContext, useState, ReactNode } from "react";

interface Tab {
  label: string;
  id: string;
}

interface TabsProps {
  tabs: Array<Tab>;
  defaultActive: string;
  children: ReactNode;
  groupId?: string;
}

interface TabsContextValue {
  active: string;
  handleSelect: (tabId: string) => void;
}

const TabsContext = createContext<TabsContextValue | null>(null);

const Tabs = ({ groupId, tabs, defaultActive, children }: TabsProps) => {
  const [active, setActive] = useState<string>(defaultActive ?? tabs[0].id);

  const handleSelect = (tabId: string) => {
    setActive(tabId);
    if (groupId) {
      document.dispatchEvent(new CustomEvent("tabs:change", { detail: { groupId: groupId, activeTab: tabId } }));
    }
  };

  return (
    <TabsContext.Provider value={{ active, handleSelect }}>
      <div role="tablist">
        {tabs.map((tab) => {
          return (
            <button
              key={tab.id}
              role="tab"
              type="button"
              aria-selected={active === tab.id}
              onClick={() => handleSelect(tab.id)}
            >
              {tab.label}
            </button>
          );
        })}
      </div>
      {children}
    </TabsContext.Provider>
  );
};

export default Tabs;
