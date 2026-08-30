import { render, screen } from "@testing-library/react";
import { Tabs } from ".";
import { Tab } from "Atoms/Tab";
import userEvent from "@testing-library/user-event";

describe("Tabs", () => {
  const tabs = [
    { label: "First", id: "first-tab" },
    { label: "Second", id: "second-tab" },
  ];
  const groupId = "test-group";

  describe("with group id", () => {
    it("renders", () => {
      render(<Tabs tabs={tabs} groupId={groupId} />);

      expect(screen.getByRole("tab", { name: "First" })).toBeInTheDocument();
      expect(screen.getByRole("tab", { name: "Second" })).toBeInTheDocument();
    });

    it("clicking tab does emit customEvent", async () => {
      const listener = jest.fn<void, [Event]>();
      document.addEventListener("tabs:change", listener);
      render(<Tabs tabs={tabs} groupId={groupId} />);

      const user = userEvent.setup();

      await user.click(screen.getByRole("tab", { name: "Second" }));

      expect(listener).toHaveBeenCalledTimes(1);

      const event = listener.mock.calls[0][0] as CustomEvent;
      expect(event.detail).toEqual({ groupId: "test-group", activeTab: "second-tab" });

      document.removeEventListener("tabs:change", listener);
    });
  });

  describe("with children", () => {
    it("should jump through the tabs on click", async () => {
      const { container } = render(
        <Tabs tabs={tabs}>
          <Tab id={tabs[0].id} active={true}>
            <p>Im in the first tab</p>
          </Tab>
          <Tab id={tabs[1].id}>
            <p>Im in the second tab</p>
          </Tab>
        </Tabs>,
      );

      expect(screen.getAllByRole("tabpanel")).toHaveLength(2);

      expect(container.querySelector("[data-tab-panel='first-tab']")).toHaveClass("active-panel");
      expect(container.querySelector("[data-tab-panel='second-tab']")).not.toHaveClass("active-panel");

      const user = userEvent.setup();

      await user.click(screen.getByRole("tab", { name: "Second" }));

      expect(container.querySelector("[data-tab-panel='first-tab']")).not.toHaveClass("active-panel");
      expect(container.querySelector("[data-tab-panel='second-tab']")).toHaveClass("active-panel");
    });
  });
});
