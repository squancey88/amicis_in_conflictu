interface TabsChangeDetail {
  groupId: string;
  activeTab: string;
}

// Augment the global event map so TS knows the shape of `tabs:change` events
declare global {
  interface DocumentEventMap {
    "tabs:change": CustomEvent<TabsChangeDetail>;
  }
}

document.addEventListener("tabs:change", (e) => {
  const { groupId, activeTab } = e.detail;

  const group = document.querySelector<HTMLElement>(`[data-tab-panel-group="${groupId}"]`);
  if (!group) return;

  group.querySelectorAll<HTMLElement>("[data-tab-panel]").forEach((panel) => {
    panel.classList.toggle("active-panel", panel.dataset.tabPanel === activeTab);
  });
});

export {};
