import { createContext, useState, ReactNode, useContext } from "react";

interface Tab {
  label: string;
  id: string;
}

interface TabsProps {
  tabs: Array<Tab>;
  groupId?: string;
  defaultActive?: string;
  children?: ReactNode;
}

interface TabsContextValue {
  active: string;
  handleSelect: (tabId: string) => void;
}

const TabsContext = createContext<TabsContextValue | null>(null);

export function useTabsContext(): TabsContextValue {
  const context = useContext(TabsContext);
  if (context === null) {
    throw new Error("useTabsContext must be used within a <Tabs> component");
  }
  return context;
}

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
      <div className="tabs-header" role="tablist">
        {tabs.map((tab) => {
          const selected = active === tab.id;
          return (
            <button
              key={tab.id}
              role="tab"
              type="button"
              className={selected ? "active-tab" : ""}
              aria-selected={selected}
              onClick={() => handleSelect(tab.id)}
            >
              {tab.label}
            </button>
          );
        })}
      </div>
      {children && (
        <div className="tab-panel-group" data-tab-group-id={groupId}>
          {children}
        </div>
      )}
    </TabsContext.Provider>
  );
};

export default Tabs;
